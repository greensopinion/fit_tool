# -*- coding: utf-8 -*-

"""
fit.field

:copyright: (c) 2017 by Stages Cycling
"""

import struct


class DevFieldDefinition:
    PACK_FORMAT = 'BBB'

    def __init__(self, field_num, size, dev_data_index):
        self.field_num = field_num
        self.field_size = size
        self.dev_data_index = dev_data_index

    def to_bytes(self):
        return struct.pack(self.PACK_FORMAT, self.field_num, self.field_size,
                           self.dev_data_index)

    @classmethod
    def from_file(cls, file_object):
        bytes_buffer = file_object.read(cls.size())
        return cls.from_bytes(bytes_buffer)

    @classmethod
    def from_bytes(cls, bytes_buffer, offset=0):
        field_num, size, dev_data_index = struct.unpack_from(cls.PACK_FORMAT,
                                                             bytes_buffer, offset)

        return cls(field_num, size, dev_data_index)

    @classmethod
    def size(cls):
        return struct.calcsize(cls.PACK_FORMAT)

    def __eq__(self, other):
        return self.__dict__ == other.__dict__


class FieldDefinition:
    """The Field Definition bytes are used to specify which FIT fields of the
    global FIT message are to be included in the upcoming data message in this
    instance. Any subsequent data messages of a particular local message type
    are considered to be using the format described by the definition message
    of matching local message type. All FIT messages and their respective FIT
    fields are listed in the global FIT profile.

    The Field Definition is essentially a field "declaration" in the definition
    message. It provides location and length information (for array data fields)
    in the data message.
    """
    PACK_FORMAT = 'BBB'

    def __init__(self, field_num, size, base_type_num):
        # Defined in the Global FIT profile for the specified FIT message
        self.field_num = field_num
        # Size (in bytes) of the specified FIT message’s field
        self.field_size = size
        # Base type num
        self.base_type_num = base_type_num

    def to_bytes(self):
        return struct.pack(self.PACK_FORMAT, self.field_num, self.field_size,
                           self.base_type_num)

    @classmethod
    def from_file(cls, file_object):
        bytes_buffer = file_object.read(cls.size())
        return cls.from_bytes(bytes_buffer)

    @classmethod
    def from_bytes(cls, bytes_buffer, offset=0):
        field_num, size, base_type_num = struct.unpack_from(
            cls.PACK_FORMAT, bytes_buffer, offset)

        return cls(field_num, size, base_type_num)

    @classmethod
    def size(cls):
        return struct.calcsize(cls.PACK_FORMAT)

    def __eq__(self, other):
        return self.__dict__ == other.__dict__


# class SubField(object):
#     name = None
#     base_type = None
#     scale = 1
#     offset = 0
#     units = None

#     ref_field_num = None
#     ref_field_value = 0

#     def __init__(self, fields, raw_value):
#         self.value = value


class Field(object):
    """ """
    def_num = None
    name = None
    base_type = None
    scale = 1
    offset = 0
    units = None
    subfields = []
    type_ = None

    #         self.dev_field_num = dev_field_num
    #         self.bits = bits
    #         self.accumulate = accumulate

    def __init__(self, value, buffer=None):
        self.value = value
        self.subfield = None
        self.buffer = buffer if buffer else []

    def get_name(self):
        if self.subfield:
            return self.subfield.get_name()
        return self.name

    def get_value(self):
        if self.subfield:
            return self.subfield.get_value()
        return self.value

    def get_units(self):
        if self.subfield:
            return self.subfield.get_units()
        return self.units

    def get_raw_value(self):

        if self.base_type.is_float:
            if isinstance(self.value, list):
                raw_value = [round(self.scale * (value + self.offset)) for value in self.value]
            else:
                raw_value = round(self.scale * (self.value + self.offset))
        else:
            raw_value = self.value

        return raw_value

    def to_bytes(self, is_little_endian, length=1):
        raw_value = self.get_raw_value()
        return self.base_type.to_bytes(is_little_endian, raw_value, length=length)

    @classmethod
    def is_dynamic(cls):
        return len(cls.subfields) > 0

    @classmethod
    def get_length_from_size(cls, size):

        return max(1, int(size / cls.base_type.size()))

    @classmethod
    def to_field_definition(cls, length=1):
        return FieldDefinition(cls.def_num, cls.base_type.size() * length, cls.base_type.def_num)

    @classmethod
    def from_file(cls, fileobject, length=1, is_little_endian=True):
        buffer = fileobject.read(length * cls.base_type.size())
        return cls.from_bytes(is_little_endian, buffer, length=length)

    @classmethod
    def from_bytes(cls, is_little_endian, bytes_buffer, offset=0, length=1):

        raw_value = cls.base_type.from_bytes(
            is_little_endian, bytes_buffer, offset, length=length)

        if cls.base_type.is_float:
            if length > 1:
                value = [(val / cls.scale) - cls.offset for val in raw_value]
            else:
                value = (raw_value / cls.scale) - cls.offset
        else:
            value = raw_value

        buffer = bytes_buffer[offset:offset + cls.base_type.size() * length]

        return cls(value, buffer=buffer)

    @classmethod
    def size(cls, length):
        return length * cls.base_type.size()

    @staticmethod
    def new(def_num: int, name: str, base_type, scale=1, offset=0, units='',
            subfields=None, ref_field_names=None, ref_field_values=None, ref_field_map=None, length=1):

        cls_dict = {
            'def_num': def_num,
            'name': name,
            'base_type': base_type,
            'scale': scale,
            'offset': offset,
            'units': units,
            'subfields': subfields if subfields else [],
            'ref_field_names': ref_field_names,
            'ref_field_values': ref_field_values,
            'ref_field_map': ref_field_map,
            'length': length,
            'type_': None,
        }

        return type(name, (Field,), cls_dict)

    def __eq__(self, other):
        return self.__dict__ == other.__dict__
