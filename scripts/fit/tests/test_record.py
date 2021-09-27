# nosetests --nocapture  tests/test_record.py

import unittest

from fit import base_type
from fit.field import Field, FieldDefinition
from fit.fit import FitFile
from fit.record import DefinitionMessage, DataMessage
from fit.record import RecordHeader, RecordHeaderType, RecordMessageType


class TestRecord(unittest.TestCase):

    def shortDescription(self):
        return None

    def test_normal_record_header(self):
        """Test packing and unpacking of normal record header.
        """
        expected_rh = RecordHeader(RecordHeaderType.NORMAL,
                                   RecordMessageType.DEFINITION,
                                   0,
                                   has_dev_data=True,
                                   time_offset=None)

        _bytes = expected_rh.to_bytes()

        rh = RecordHeader.from_bytes(_bytes, 0)

        self.assertEqual(rh, expected_rh)
        self.assertEqual(rh.size(), 1)

    def test_compressed_timestamp_record_header(self):
        """Test packing and unpacking of a compressed timestamp header.
        """
        expected_rh = RecordHeader(RecordHeaderType.COMPRESSED_TIMESTAMP,
                                   RecordMessageType.DATA,
                                   0,
                                   has_dev_data=False,
                                   time_offset=10)

        _bytes = expected_rh.to_bytes()

        rh = RecordHeader.from_bytes(_bytes, 0)

        self.assertEqual(rh, expected_rh)
        self.assertEqual(rh.size(), 1)

    # def test_base_type_definition(self):
    #     expected = BaseTypeDefinition(1, 4)
    #     byte = expected.to_byte()
    #     btd = BaseTypeDefinition.from_byte(byte)

    #     self.assertEqual(btd, expected)

    def test_field_definition(self):
        exp_fd = FieldDefinition(1, 2, 132)
        _bytes = exp_fd.to_bytes()
        fd = FieldDefinition.from_bytes(_bytes)

        self.assertEqual(fd, exp_fd)
        self.assertEqual(fd.size(), 3)

    # def test_dev_field_definition(self):
    #     exp_fd = DevFieldDefinition(1, 4, True, 5)
    #     _bytes = exp_fd.to_bytes()
    #     fd, offset = FieldDefinition.from_bytes(_bytes, 0)
    #     # self.assertEqual(fd, exp_fd)
    #     self.assertEqual(offset, 3)

    def test_field_uint32(self):
        # noinspection PyPep8Naming
        Timestamp = Field.new(253, 'timestamp',
                              base_type.get_by_name('uint32'))

        value = 100
        is_little_endian = True
        expected = Timestamp(value)
        bytes_ = expected.to_bytes(is_little_endian)
        expected.buffer = bytes_

        field = Timestamp.from_bytes(is_little_endian, bytes_)
        self.assertEqual(expected, field)

    def test_field_string(self):
        # noinspection PyPep8Naming
        FieldName = Field.new(3, 'field_name', base_type.get_by_name('string'))

        value = 'doughnuts'
        is_little_endian = True
        size = 64
        expected = FieldName(value)
        bytes_ = expected.to_bytes(is_little_endian, length=size)
        expected.buffer = bytes_

        field = FieldName.from_bytes(is_little_endian, bytes_, length=size)

        self.assertEqual(expected, field)

    def test_definition_message(self):
        local_msg_type = 0
        is_little_endian = True
        global_msg_num = 0

        field_defs = []

        # field type
        field_def = FieldDefinition(field_num=0, size=1, base_type_num=0)
        field_defs.append(field_def)

        # field mfg
        field_def = FieldDefinition(field_num=1, size=2, base_type_num=132)
        field_defs.append(field_def)

        expected = DefinitionMessage(local_msg_type=local_msg_type,
                                     is_little_endian=is_little_endian,
                                     global_msg_num=global_msg_num,
                                     field_defs=field_defs,
                                     dev_field_defs=[])

        bytes_ = expected.to_bytes()

        def_msg = DefinitionMessage.from_payload(header, bytes_)
        self.assertEqual(expected, def_msg)

    def test_data_message(self):
        fit_file = FitFile()

        # noinspection PyPep8Naming
        TypeField = fit_file.profile.get_message_by_name(
            'file_id').get_field_by_name('type')
        # noinspection PyPep8Naming
        ManufacturerField = fit_file.profile.get_message_by_name(
            'file_id').get_field_by_name('manufacturer')

        field_defs = [TypeField.to_field_definition(),
                      ManufacturerField.to_field_definition()]

        #
        # Define 'File Id' message
        #
        header = RecordHeader(0, 0, 0)
        msg_def = DefinitionMessage(local_msg_type=0,
                                    is_little_endian=True,
                                    global_msg_num=0,
                                    field_defs=field_defs,
                                    dev_field_defs=[])

        dm = DataMessage(msg_def, [TypeField(5), ManufacturerField(6)])

        bytes_ = dm.to_bytes()

        dm2 = DataMessage.from_payload(header, msg_def, bytes_)

        self.assertEqual(dm, dm2)
