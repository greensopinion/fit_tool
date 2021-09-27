# -*- coding: utf-8 -*-

"""
fit.base_type

:copyright: (c) 2017 by Stages Cycling
"""

import struct


class Type:

    def __init__(self, name, base_type_):
        self.name = name
        self.base_type = base_type_
        self.names_by_value = {}
        self.values_by_name = {}

    def add_value(self, name, value):
        self.names_by_value[value] = name
        self.values_by_name[name] = value

    def get_value_by_name(self, name):
        return self.values_by_name.get(name)

    def get_name_by_value(self, value):
        return self.names_by_value.get(value)


class BaseType:

    def __init__(self, def_num, name, pack_format, is_float=True):
        self.def_num = def_num
        self.name = name
        self.pack_format = pack_format
        self.is_float = is_float

    def to_bytes(self, is_little_endian, raw_value, length=1):

        pack_format = self.compute_pack_format(is_little_endian, length)

        if isinstance(raw_value, str):
            raw_value = raw_value.encode('utf-8')

        if isinstance(raw_value, list):
            bytes_ = struct.pack(pack_format, *raw_value)
        else:
            bytes_ = struct.pack(pack_format, raw_value)

        return bytes_

    def from_bytes(self, is_little_endian, bytes_buffer, offset=0, length=1):
        pack_format = self.compute_pack_format(is_little_endian, length)

        raw_value = struct.unpack_from(pack_format, bytes_buffer, offset)

        if length == 1 or 's' in pack_format:
            raw_value = raw_value[0]

        if 's' in pack_format:
            # noinspection PyBroadException
            try:
                raw_value = str(raw_value, 'utf-8')
            except Exception:
                print('WARNING: Unable to parse string as utf-8', raw_value)
                raw_value = ''
            raw_value = raw_value.replace('\x00', '')

        return raw_value

    def compute_pack_format(self, is_little_endian, length):
        if struct.calcsize(self.pack_format) > 1:
            endian_format = '<' if is_little_endian else '>'
        else:
            endian_format = ''

        if length <= 1:
            length = ''

        pack_format = "{}{}{}".format(endian_format, length, self.pack_format)
        return pack_format

    def size(self):
        return struct.calcsize(self.pack_format)


#
# Define standard FIT base types
#

BASE_TYPE_BY_ID = {
    0: BaseType(def_num=0, name='enum', pack_format='B', is_float=False),
    1: BaseType(def_num=1, name='sint8', pack_format='b'),
    2: BaseType(def_num=2, name='uint8', pack_format='B'),
    7: BaseType(def_num=7, name='string', pack_format='s', is_float=False),
    10: BaseType(def_num=10, name='uint8z', pack_format='B'),
    13: BaseType(def_num=13, name='byte', pack_format='B'),
    131: BaseType(def_num=131, name='sint16', pack_format='h'),
    132: BaseType(def_num=132, name='uint16', pack_format='H'),
    133: BaseType(def_num=133, name='sint32', pack_format='i'),
    134: BaseType(def_num=134, name='uint32', pack_format='I'),
    136: BaseType(def_num=136, name='float32', pack_format='f'),
    137: BaseType(def_num=137, name='float64', pack_format='d'),
    139: BaseType(def_num=139, name='uint16z', pack_format='H'),
    140: BaseType(def_num=140, name='uint32z', pack_format='I'),
    142: BaseType(def_num=142, name='sint64', pack_format='q'),
    143: BaseType(def_num=143, name='uint64', pack_format='Q'),
    144: BaseType(def_num=144, name='uint64z', pack_format='Q'),
}

BASE_TYPE_BY_NAME = {}
for _, base_type in BASE_TYPE_BY_ID.items():
    BASE_TYPE_BY_NAME[base_type.name] = base_type


def get_by_name(name):
    return BASE_TYPE_BY_NAME.get(name)


def get_by_id(id_):
    return BASE_TYPE_BY_ID.get(id_)
