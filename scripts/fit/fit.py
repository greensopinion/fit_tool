# -*- coding: utf-8 -*-

"""
fit.file

:copyright: (c) 2017 by Stages Cycling
"""
import csv
import struct

from fit import PROTOCOL_VERSION, FIT_DATA_TYPE, SDK_VERSION
from fit.exceptions import FitException
from fit.profile.profile import Profile
from fit.record import DefinitionMessage
from fit.record import Record

CRC_TABLE = (
    0x0000, 0xCC01, 0xD801, 0x1400, 0xF001, 0x3C00, 0x2800, 0xE401,
    0xA001, 0x6C00, 0x7800, 0xB401, 0x5000, 0x9C01, 0x8801, 0x4400,
)


def calc_crc(buffer, crc=0):
    if not buffer:
        return crc

    for byte in buffer:
        # byte_char = ord(byte)
        byte_char = byte
        # Taken verbatim from FIT SDK docs
        tmp = CRC_TABLE[crc & 0xF]
        crc = (crc >> 4) & 0x0FFF
        crc = crc ^ tmp ^ CRC_TABLE[byte_char & 0xF]
        # now compute checksum of upper four bits of byte
        tmp = CRC_TABLE[crc & 0xF]
        crc = (crc >> 4) & 0x0FFF
        crc = crc ^ tmp ^ CRC_TABLE[(byte_char >> 4) & 0xF]
    return crc


class FileHeader:
    # noinspection SpellCheckingInspection
    PACK_FORMAT = '<BBHI4s'
    CRC_PACK_FORMAT = '<H'

    def __init__(self, data_size, header_size=14, protocol_version=PROTOCOL_VERSION,
                 profile_version=SDK_VERSION, data_type=FIT_DATA_TYPE, crc=None):

        self.data_size = data_size

        self.header_size = header_size

        if header_size not in [12, 14]:
            raise ValueError(
                'Invalid header size. Expected: 12 or 14, but found {}'.format(header_size))

        if header_size == 12 and crc is not None:
            raise ValueError('Crc must be none with a header size of 12.')

        self.protocol_version = protocol_version if protocol_version else PROTOCOL_VERSION
        self.profile_version = profile_version if profile_version else SDK_VERSION
        self.data_type = data_type

        # check data_type
        if data_type != FIT_DATA_TYPE:
            raise FitException(
                'Bad Datatype. Expected: {}, but found {}'.format(FIT_DATA_TYPE, data_type))

        self.crc = crc

        if header_size == 14 and crc is None:
            self.update_crc()

    def update_crc(self):
        self.crc = self.calc_crc()

    def validate_crc(self):
        if not self.crc:
            return
        expected_crc = self.calc_crc()
        if self.crc != expected_crc:
            raise FitException(
                'Bad header crc. Expected: {}, but found {}'.format(expected_crc, self.crc))

    def calc_crc(self):
        _bytes = self.to_bytes_no_crc()
        return calc_crc(_bytes)

    def to_bytes_no_crc(self):
        values = [int(x) for x in str(self.protocol_version).split('.')]
        encoded_protocol_version = values[0] * 10 + values[1]

        values = [int(x) for x in self.profile_version.split('.')]
        encoded_profile_version = values[0] * 100 + values[1]

        bytes_ = struct.pack(self.PACK_FORMAT, self.header_size, encoded_protocol_version,
                             encoded_profile_version, self.data_size, self.data_type)

        return bytes_

    def to_bytes(self):

        bytes_ = self.to_bytes_no_crc()

        if self.header_size == 14 and self.crc is None:
            self.update_crc()

        if self.crc is not None:
            bytes_ += struct.pack(self.CRC_PACK_FORMAT, self.crc)

        return bytes_

    def size(self):
        size = struct.calcsize(self.PACK_FORMAT)

        if self.crc is not None:
            size += struct.calcsize(self.CRC_PACK_FORMAT)
        return size

    @classmethod
    def from_file(cls, fit_file):
        size = struct.unpack('B', fit_file.file_object.read(1))[0]
        fit_file.file_object.seek(0)
        bytes_buffer = fit_file.read(size)
        header = cls.from_bytes(bytes_buffer)
        return header

    @classmethod
    def from_bytes(cls, bytes_buffer, offset=0):
        header_size, protocol_raw, profile_raw, data_size, data_type = struct.unpack_from(
            cls.PACK_FORMAT, bytes_buffer, offset)

        if header_size == struct.calcsize(cls.PACK_FORMAT) + struct.calcsize(cls.CRC_PACK_FORMAT):
            crc = struct.unpack_from(cls.CRC_PACK_FORMAT, bytes_buffer,
                                     struct.calcsize(cls.PACK_FORMAT))[0]
        else:
            crc = None

        protocol_version = "%d.%d" % (protocol_raw / 10, protocol_raw % 10)
        # print(f'>> from bytes: protocol version, encoded: {protocol_raw}, decoded: {protocol_version}')

        profile_version = "%2d.%2d" % (profile_raw / 100, profile_raw % 100)
        # print(f'>> from bytes: profile version, encoded: {profile_raw}, decoded: {profile_version}')

        header = FileHeader(data_size, header_size, protocol_version,
                            profile_version, data_type, crc)
        return header

    def __eq__(self, other):
        return self.__dict__ == other.__dict__


class FitFile:

    def __init__(self, file_object=None, profile=None):

        self.msg_def_map = {}
        self.field_map = {}

        if not profile:
            profile = Profile.get_default_profile()

        self.profile = profile
        self.dev_profile = Profile()

        # The final 2 bytes of a FIT file contain a 16 bit CRC in little endian format
        self.crc = 0

        # Length of the Data Records section in bytes. Does not include Header or CRC
        self.data_size = 0

        self.file_object = file_object
        self.bytes_left = 0
        self.records = []
        self.header = None
        self.last_buffer = b''

    def get_msg_def(self, local_msg_type):
        return self.msg_def_map.get(local_msg_type)

    def add_msg_def(self, msg_def):
        self.msg_def_map[msg_def.header.local_msg_type] = msg_def

    def get_field_class(self, field_num):
        return self.field_map.get(field_num)

    # def add_dev_profile(application_id)
    #     pass

    # def get_dev_profile(application_id)
    def set_bytes_left(self, num_bytes):
        self.bytes_left = num_bytes

    def read(self, size):
        """Read at most size bytes from the fit file
        """

        buffer = self.file_object.read(size)
        self.last_buffer = buffer  # for debug only

        self.bytes_left -= len(buffer)
        self.crc = calc_crc(buffer, self.crc)

        return buffer

    def read_and_validate_crc(self):
        crc = struct.unpack('H', self.file_object.read(2))[0]
        if crc != self.crc:
            raise FitException(
                'Computed file crc: 0x{:X} does not match expected crc: 0x{:X}'.format(crc, self.crc))
        # else:
        #     print('Computed file crc: 0x{:X} matches expected crc: 0x{:X}'.format(crc, self.crc))

    def to_csv(self, path, include=None, exclude=None):
        with open(path, 'w', newline='') as fileobject:
            max_fields = 23
            writer = csv.writer(fileobject)

            # write header
            header = ['Type', 'Local Msg Id', 'Message']

            for index in range(1, max_fields + 1):
                header.extend(
                    ['Field {}'.format(index), 'Value {}'.format(index), 'Units {}'.format(index)])

            writer.writerow(header)

            for record in self.records:
                if not self.is_record_included(record, include, exclude):
                    continue
                writer.writerow(record.to_row(self.profile))

    def create_field(self, msg_name: str, field_name: str, value, length=1):

        msg = self.profile.get_message_by_name(msg_name)
        clz = msg.get_field_by_name(field_name)
        clz.length = length
        field = clz(value=value)
        return field

    def create_field_definition(self, msg_name, field_name, length=1):
        msg = self.profile.get_message_by_name(msg_name)
        return msg.get_field_by_name(field_name).to_field_definition(length=length)

    def is_record_included(self, record, include, exclude):
        if not record:
            return False
        global_msg = record.get_global_message(self.profile)

        if not global_msg:
            return False

        if include is not None:
            if global_msg.name in include or global_msg.id in include:
                return True
            else:
                return False

        if exclude is not None:
            if global_msg.name in exclude or global_msg.id in exclude:
                return False
            else:
                return True

        return True

    def update_header(self, data_size=None):

        if not data_size:
            data_size = 0
            for record in self.records:
                data_size += record.size()

        self.data_size = data_size
        self.header = FileHeader(data_size=data_size)

    def to_file(self, path: str):
        crc = 0

        if self.header is None:
            self.update_header()

        with open(path, 'wb') as outfile:
            if self.header:
                buffer = self.header.to_bytes()
                outfile.write(buffer)
                crc = calc_crc(buffer, crc)

            for record in self.records:
                buffer = record.to_bytes()
                outfile.write(buffer)
                crc = calc_crc(buffer, crc)

            buffer = struct.pack('<H', crc)
            outfile.write(buffer)

    def add_record(self, record: Record):
        self.records.append(record)

        if isinstance(record, DefinitionMessage):
            self.add_msg_def(record)
        else:
            if record.msg_def.global_msg_num == 206:
                self.dev_profile.add_dev_field(record)

        buffer = record.to_bytes()
        self.data_size += len(buffer)
        self.update_header(data_size=self.data_size)

    def clear(self):
        self.records.clear()
        self.msg_def_map.clear()
        self.field_map.clear()
        self.crc = 0

    def update_crc(self):
        buffer = self.header.to_bytes()
        crc = calc_crc(buffer, self.crc)
        for record in self.records:
            buffer = record.to_bytes()
            crc = calc_crc(buffer, crc)

        self.crc = crc

    @staticmethod
    def from_file(path, post_read_record_function=None):
        """Parse a fit file.

        Args:
            path (str): path of fit file to parse
            post_read_record_function (func): callback for post record read (default: None)

        Returns:
            fit_file (FitFile): fit_file
        """

        with open(path, 'rb') as file_object:
            fit_file = FitFile(file_object)
            header = FileHeader.from_file(fit_file)
            header.validate_crc()
            fit_file.header = header

            # print(f'Protocol Version: {header.protocol_version}')
            # print(f'Profile Version : {header.profile_version}')
            # print(f'Payload Size    : {header.data_size} bytes')
            fit_file.set_bytes_left(header.data_size)
            count = 0
            while fit_file.bytes_left > 0:
                file_start_position = fit_file.file_object.tell()

                record = Record.from_file(fit_file)

                fit_file.add_record(record)

                if post_read_record_function:
                    post_read_record_function(
                        fit_file, file_start_position, count, record)

                count += 1

            fit_file.read_and_validate_crc()
            return fit_file

    # noinspection SpellCheckingInspection
    @staticmethod
    def fromto_file(from_path, to_path):
        """Read and write a fit file at the same time.

        Args:
            from_path (str): path of fit file to parse
            to_path (str): path of fit file to write to

        """

        with open(to_path, 'wb') as outfile:

            def post_read_record(file, file_start_position, count, record):

                if count == 0:
                    buffer = file.header.to_bytes()
                    outfile.write(buffer)
                    file.crc_out = calc_crc(buffer, 0)

                buffer = record.to_bytes()
                outfile.write(buffer)
                file.crc_out = calc_crc(buffer, file.crc_out)
                if file.crc != file.crc_out:
                    file_end_position = file.file_object.tell()
                    file.file_object.seek(file_start_position)
                    in_buffer = file.file_object.read(
                        file_end_position - file_start_position)

                    print('in file : ', in_buffer.hex())
                    print('out file: ', buffer.hex())
                    assert False

                if file.bytes_left <= 0:
                    # print("final crc: 0x{:X}".format(file.crc_out))
                    buffer = struct.pack('<H', file.crc_out)
                    outfile.write(buffer)

            FitFile.from_file(
                from_path, post_read_record_function=post_read_record)
