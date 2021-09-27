# -*- coding: utf-8 -*-

"""
fit.record

:copyright: (c) 2017 by Stages Cycling
"""

import struct
from enum import IntEnum

import bitstruct

from fit import base_type
from fit.exceptions import FitException
from fit.field import Field, FieldDefinition, DevFieldDefinition


def swap16(value):
    return struct.unpack('>H', struct.pack('<H', value))[0]


class RecordHeaderType(IntEnum):
    NORMAL = 0
    COMPRESSED_TIMESTAMP = 1


class RecordMessageType(IntEnum):
    DATA = 0
    DEFINITION = 1


class Architecture(IntEnum):
    LITTLE_ENDIAN = 0
    BIG_ENDIAN = 1


class RecordHeader:
    """The record header indicates whether the record content contains a definition message, a normal data message or a
     compressed timestamp data message. The record header also has a Local Message Type field that references the local
     message in the data record to its global FIT message."""

    NORMAL_FORMAT = 'u1u1u1b1u4'
    COMPRESSED_TIMESTAMP_FORMAT = 'u1u2u5'

    def __init__(self, header_type, msg_type, local_msg_type,
                 has_dev_data=False, time_offset=None):
        self.header_type = header_type
        self.msg_type = msg_type
        self.local_msg_type = local_msg_type
        self.has_dev_data = has_dev_data
        self.time_offset = time_offset

    def is_normal(self):
        return self.header_type == RecordHeaderType.NORMAL

    def is_compressed_timestamp(self):
        return self.header_type == RecordHeaderType.COMPRESSED_TIMESTAMP

    def is_definition_msg(self):
        return self.msg_type == RecordMessageType.DEFINITION

    def is_data_msg(self):
        return self.msg_type == RecordMessageType.DATA

    def to_bytes(self):
        if self.is_normal():
            # normal header
            assert 0 <= self.local_msg_type < 16
            return bitstruct.pack(self.NORMAL_FORMAT, self.header_type,
                                  self.msg_type, self.has_dev_data, 0,
                                  self.local_msg_type)
        else:
            # compressed timestamp header
            assert 0 <= self.local_msg_type < 3
            assert 0 <= self.time_offset < 31
            return bitstruct.pack(self.COMPRESSED_TIMESTAMP_FORMAT, True, self.local_msg_type,
                                  self.time_offset
                                  )

    @classmethod
    def size(cls):
        return 1

    @classmethod
    def from_file(cls, file_object):
        bytes_buffer = file_object.read(cls.size())
        return cls.from_bytes(bytes_buffer)

    @classmethod
    def from_bytes(cls, bytes_buffer, offset=0):

        is_compressed = bitstruct.unpack('b1', bytes_buffer[offset:])[0]
        header_type = RecordHeaderType.COMPRESSED_TIMESTAMP if is_compressed else RecordHeaderType.NORMAL

        if header_type == RecordHeaderType.NORMAL:
            _, msg_type, has_dev_data, _, local_msg_type = bitstruct.unpack(
                cls.NORMAL_FORMAT, bytes_buffer[offset:])
            msg_type = RecordMessageType(msg_type)
            header = cls(RecordHeaderType.NORMAL, msg_type, local_msg_type,
                         has_dev_data)
        else:
            _, local_msg_type, time_offset = bitstruct.unpack(
                cls.COMPRESSED_TIMESTAMP_FORMAT, bytes_buffer[offset:])
            header = cls(RecordHeaderType.COMPRESSED_TIMESTAMP,
                         RecordMessageType.DATA, local_msg_type,
                         time_offset=time_offset)

        return header

    def __eq__(self, other):
        return self.__dict__ == other.__dict__


#
# Record Content Classes
#

class Record:

    def __init__(self):
        self.msg_def = None

    def get_global_message(self, profile):
        return profile.get_message_by_id(self.get_global_message_id())

    def get_global_message_id(self):
        pass

    @classmethod
    def from_file(cls, fit_file, header=None):
        if not header:
            header = RecordHeader.from_file(fit_file)

        if header.is_definition_msg():
            return DefinitionMessage.from_file(fit_file, header)
        else:
            return DataMessage.from_file(fit_file, header)

    @classmethod
    def from_bytes(cls, fit_file, buffer, offset=0):
        header = RecordHeader.from_bytes(buffer, offset)
        offset += header.size()

        if header.is_definition_msg():
            return DefinitionMessage.from_payload(header, buffer, offset)
        else:
            msg_def = fit_file.get_msg_def(header.local_msg_type)
            if not msg_def:
                raise FitException(
                    'Message not defined for local message {} .'.format(header.local_msg_type))
            return DataMessage.from_payload(header, msg_def, buffer, offset)


class DefinitionMessagePreamble:
    # noinspection SpellCheckingInspection
    PACK_FMT = "<BBHB"

    def __init__(self, architecture, global_msg_num, num_fields):
        self.architecture = architecture
        self.global_msg_num = global_msg_num
        self.num_fields = num_fields

    @classmethod
    def size(cls):
        return struct.calcsize(cls.PACK_FMT)

    @classmethod
    def from_file(cls, file_object):
        bytes_buffer = file_object.read(cls.size())

        return cls.from_bytes(bytes_buffer)

    @classmethod
    def from_bytes(cls, bytes_buffer, offset=0):
        _, architecture, global_msg_num, num_fields = struct.unpack_from(cls.PACK_FMT,
                                                                         bytes_buffer, offset)

        if architecture == Architecture.BIG_ENDIAN:
            global_msg_num = swap16(global_msg_num)

        return DefinitionMessagePreamble(Architecture(architecture), global_msg_num, num_fields)

    def to_bytes(self):
        pack_format = self.PACK_FMT
        if self.architecture == Architecture.BIG_ENDIAN:
            pack_format = pack_format.replace('<', '>')

        return struct.pack(pack_format, 0, self.architecture, self.global_msg_num, self.num_fields)


class DefinitionMessage(Record):
    """The definition message is used to create an association between the local
    message type contained in the record header, and a Global Message Number
    (mesg_num) that relates to the global FIT message.
    """

    def __init__(self, local_msg_type: int, is_little_endian: bool, global_msg_num: int, field_defs, dev_field_defs):
        """

        local_msg_type: The Local Message Type is used to create an association between the definition message, data
                        message and the FIT message in the Global FIT Profile (global_msg_num). Value is 0-15
        """

        super().__init__()
        self.is_little_endian = is_little_endian
        self.global_msg_num = global_msg_num
        self.field_defs = field_defs
        self.dev_field_defs = dev_field_defs

        has_dev_data = True if dev_field_defs else False

        self.header = RecordHeader(RecordHeaderType.NORMAL,
                                   RecordMessageType.DEFINITION,
                                   local_msg_type,
                                   has_dev_data)
        self.field_classes = []
        self.field_lengths = []

    def has_dev_data(self):
        return True if self.dev_field_defs else False

    def get_local_message_type(self):
        return self.header.local_msg_type

    def build_field_classes(self, profile, dev_profile):
        global_msg = profile.get_message_by_id(self.global_msg_num)
        if not global_msg:
            print('WARNING: Global message {} not found in profile'.format(
                self.global_msg_num))

        # includes both standard fields and developer fields
        self.field_classes = []
        self.field_lengths = []

        for field_def in self.field_defs:
            field_class = global_msg.get_field_by_id(
                field_def.field_num) if global_msg else None

            base_type_ = base_type.get_by_id(field_def.base_type_num)

            if field_class and field_class.base_type != base_type_:
                # print(
                #     'WARNING: field definition is overriding the base type of this field')
                field_class = Field.new(field_class.def_num,
                                        field_class.name,
                                        base_type_,
                                        scale=field_class.scale,
                                        offset=field_class.offset,
                                        units=field_class.units,
                                        subfields=field_class.subfields)

            if not field_class:
                print('WARNING: Field not found in profile, msg: {}, field: {}'.format(self.global_msg_num,
                                                                                       field_def.field_num))

                field_class = Field.new(field_def.field_num,
                                        'unknown_{}'.format(
                                            field_def.field_num),
                                        base_type_)

            field_length = field_class.get_length_from_size(
                field_def.field_size)
            self.field_lengths.append(field_length)
            self.field_classes.append(field_class)

        for dev_field_def in self.dev_field_defs:
            dev_msg = dev_profile.get_message_by_id(
                dev_field_def.dev_data_index)

            if not dev_msg:
                print(f'WARNING: Dev message {dev_msg} not found in profile')

            field_class = dev_msg.get_field_by_id(
                dev_field_def.field_num) if dev_msg else None

            field_length = field_class.get_length_from_size(
                dev_field_def.field_size)

            self.field_lengths.append(field_length)
            self.field_classes.append(field_class)

    def to_bytes(self):
        bbuf = self.header.to_bytes()

        architecture = Architecture.LITTLE_ENDIAN if self.is_little_endian else Architecture.BIG_ENDIAN
        preamble = DefinitionMessagePreamble(
            architecture, self.global_msg_num, len(self.field_defs))
        bbuf += preamble.to_bytes()

        for field_def in self.field_defs:
            bbuf += field_def.to_bytes()

        dev_bytes_count = 0
        if self.dev_field_defs:
            bbuf += struct.pack('B', len(self.dev_field_defs))
            dev_bytes_count += 1
            for dev_field_def in self.dev_field_defs:
                bbuf += dev_field_def.to_bytes()
                dev_bytes_count += len(dev_field_def.to_bytes())
        return bbuf

    def to_row(self, profile):
        global_msg = self.get_global_message(profile)
        message_name = global_msg.name if global_msg else 'unknown'

        row = [self.header.msg_type.name, self.header.local_msg_type, message_name]

        for field_def in self.field_defs:
            row.extend(
                [field_def.field_num, field_def.field_size, base_type.get_by_id(field_def.base_type_num).name])

        for field_def in self.dev_field_defs:
            row.extend(
                [field_def.field_num, field_def.field_size, field_def.dev_data_index])

        return row

    def get_global_message_id(self):
        return self.global_msg_num

    @classmethod
    def from_file(cls, fit_file, header=None):

        if not header:
            header = RecordHeader.from_file(fit_file)

        preamble = DefinitionMessagePreamble.from_file(fit_file)

        field_defs = []
        for _ in range(0, preamble.num_fields):
            field_def = FieldDefinition.from_file(fit_file)
            field_defs.append(field_def)

        num_dev_fields = struct.unpack_from(
            'B', fit_file.read(1))[0] if header.has_dev_data else 0

        dev_field_defs = []
        for _ in range(0, num_dev_fields):
            dev_field_def = DevFieldDefinition.from_file(fit_file)
            dev_field_defs.append(dev_field_def)

        is_little_endian = preamble.architecture == Architecture.LITTLE_ENDIAN

        def_msg = cls(header.local_msg_type, is_little_endian, preamble.global_msg_num,
                      field_defs, dev_field_defs)

        def_msg.build_field_classes(fit_file.profile, fit_file.dev_profile)

        return def_msg

    @classmethod
    def from_payload(cls, header: RecordHeader, bytes_buffer, offset=0):
        # header = RecordHeader.from_bytes(bytes_buffer, offset)
        # offset += header.size()

        preamble = DefinitionMessagePreamble.from_bytes(bytes_buffer, offset)
        offset += preamble.size()

        field_defs = []
        for _ in range(0, preamble.num_fields):
            field_def = FieldDefinition.from_bytes(bytes_buffer, offset)
            field_defs.append(field_def)
            offset += field_def.size()

        dev_field_defs = []
        if header.has_dev_data:

            pack_fmt = 'B'
            num_dev_fields = struct.unpack_from(pack_fmt, bytes_buffer, offset)[0]
            offset += struct.calcsize(pack_fmt)

            for _ in range(0, num_dev_fields):
                dev_field_def = DevFieldDefinition.from_bytes(bytes_buffer,
                                                              offset)
                offset += dev_field_def.size()
                dev_field_defs.append(dev_field_def)

        is_little_endian = preamble.architecture == Architecture.LITTLE_ENDIAN

        return cls(header.local_msg_type, is_little_endian, preamble.global_msg_num,
                   field_defs, dev_field_defs)

    def size(self):
        size = RecordHeader.size() + DefinitionMessagePreamble.size() + \
               len(self.field_defs) * FieldDefinition.size()

        if self.header.has_dev_data:
            size += 1 + len(self.dev_field_defs) * DevFieldDefinition.size()

        return size

    def __eq__(self, other):
        if len(self.field_defs) != len(other.field_defs):
            return False

        if self.header != other.header:
            return False

        if self.is_little_endian != other.is_little_endian:
            return False

        if self.global_msg_num != other.global_msg_num:
            return False

        return True


class DataMessage(Record):

    def __init__(self, msg_def, fields):
        super().__init__()
        self.header = RecordHeader(RecordHeaderType.NORMAL, RecordMessageType.DATA,
                                   local_msg_type=msg_def.get_local_message_type())

        self.msg_def = msg_def
        self.fields = fields

    def to_bytes(self):
        buffer = self.header.to_bytes()
        for field, field_def in zip(self.fields, self.msg_def.field_defs + self.msg_def.dev_field_defs):
            length = field.get_length_from_size(field_def.field_size)
            buffer += field.to_bytes(self.msg_def.is_little_endian, length=length)

        return buffer

    def to_row(self, profile):
        global_msg = self.get_global_message(profile)
        message_name = global_msg.name if global_msg else 'unknown'

        row = [self.header.msg_type.name, self.header.local_msg_type, message_name]
        for field in self.fields:
            row.extend(
                [field.get_name(), field.get_value(), field.get_units()])

        return row

    def get_global_message_id(self):
        return self.msg_def.global_msg_num

    def get_field_by_name(self, name):
        for field in self.fields:
            if field.name == name:
                return field
        return None

    @classmethod
    def from_file(cls, fit_file, header=None):
        if not header:
            header = RecordHeader.from_file(fit_file)

        msg_def = fit_file.get_msg_def(header.local_msg_type)

        if not msg_def:
            message = 'Message not defined for local message {} .'.format(header.local_msg_type)
            raise FitException(message)

        fields = []
        for field_length, field_class in zip(msg_def.field_lengths, msg_def.field_classes):
            bytes_buffer = fit_file.read(field_class.size(field_length))
            field = field_class.from_bytes(msg_def.is_little_endian,
                                           bytes_buffer, length=field_length)
            fields.append(field)

        # Handle dynamic fields that are dependent on the value of another field
        # in the message
        for field in fields:
            for subfield in field.subfields:
                for ref_field in fields:
                    if subfield.ref_field_names[0] == ref_field.name and \
                            subfield.ref_field_values[0] == ref_field.value:
                        field.subfield = subfield.from_bytes(msg_def.is_little_endian,
                                                             field.bbuffer[0:subfield.base_type.size()])
                        break

        # todo: class determination
        MSG_WORKOUT_STEP = 27
        if msg_def.global_msg_num == MSG_WORKOUT_STEP:
            from fit.profile.workout_step_message import WorkoutStepMessage
            return WorkoutStepMessage(msg_def, fields)

        return cls(msg_def, fields)

    @classmethod
    def from_payload(cls, header: RecordHeader, msg_def: DefinitionMessage, buffer, offset: int = 0) -> 'DataMessage':
        """Read a date record from a buffer. Record header has already been read.
         """
        fields = []
        for field_length, field_class in zip(msg_def.field_lengths, msg_def.field_classes):
            field = field_class.from_bytes(msg_def.is_little_endian,
                                           buffer, offset=offset,
                                           length=field_length)
            offset += field.size(field_length)
            fields.append(field)

        # Handle dynamic fields that are dependent on the value of another field
        # in the message
        for field in fields:
            for subfield in field.subfields:
                for ref_field in fields:
                    if subfield.ref_field_names[0] == ref_field.name and \
                            subfield.ref_field_values[0] == ref_field.value:
                        field.subfield = subfield.from_bytes(msg_def.is_little_endian,
                                                             field.bbuffer[:subfield.base_type.size()])
                        break

        return cls(msg_def, fields)

    def size(self):
        size = RecordHeader.size() + \
               sum([field_def.field_size for field_def in self.msg_def.field_defs]) + \
               sum([dev_field_def.field_size
                    for dev_field_def in self.msg_def.dev_field_defs])

        return size

    def __eq__(self, other):
        if self.header != other.header:
            return False

        if self.msg_def != other.msg_def:
            return False

        for field1, field2 in zip(self.fields, other.fields):
            if field1 != field2:
                return False

        return True
