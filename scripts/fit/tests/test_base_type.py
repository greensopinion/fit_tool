# nosetests --nocapture  tests/test_base_type.py

import unittest

from fit import base_type


class TestBaseType(unittest.TestCase):

    def shortDescription(self):
        return None

    def test_base_type(self):
        base_type_ = base_type.get_by_name('uint32')

        # test little endian 32bit int
        expected = 0xdeedbeef
        is_little_endian = True
        bytes_ = base_type_.to_bytes(is_little_endian, expected)
        self.assertEqual(b'\xef\xbe\xed\xde', bytes_)

        raw_value = base_type_.from_bytes(is_little_endian, bytes_, 0)

        self.assertEqual(expected, raw_value)

        # test big endian 32bit int
        expected = 0xdeedbeef
        is_little_endian = False
        bytes_ = base_type_.to_bytes(is_little_endian, expected)
        self.assertEqual(b'\xde\xed\xbe\xef', bytes_)

        raw_value = base_type_.from_bytes(
            is_little_endian, bytes_, 0)

        self.assertEqual(expected, raw_value)

        # Test a string
        base_type_ = base_type.get_by_name('string')

        expected = 'test.log'
        length = len(expected) + 1
        bytes_ = base_type_.to_bytes(is_little_endian, expected, length=length)

        raw_value = base_type_.from_bytes(is_little_endian, bytes_, 0, length=length)

        self.assertEqual(expected, raw_value)
