// ignore_for_file: constant_identifier_names
import 'fit_file_header.dart';

class Fit {
  static bool debug = false;

  static final ProtocolVersion protocolVersion = ProtocolVersion(2, 3);
  static final ProfileVersion profileVersion = ProfileVersion(21, 60);

  static const int ANTFS_FILE_DATA_TYPE = 128;

  static const int FILE_HDR_SIZE = 14;

  static const int HDR_SIZE = 1;
  static const int HDR_TIME_REC_BIT = 0x80;
  static const int HDR_TIME_TYPE_MASK = 0x60;
  static const int HDR_TIME_TYPE_SHIFT = 5;
  static const int HDR_TIME_OFFSET_MASK = 0x1F;
  static const int HDR_TYPE_DEF_BIT = 0x40;
  static const int HDR_DEV_FIELDS_BIT = 0x20;
  static const int HDR_TYPE_MASK = 0x0F;
  static const int MAX_LOCAL_MESGS = HDR_TYPE_MASK + 1;

  static const int MAX_MESG_SIZE = 65535;

  static const int ARCH_ENDIAN_MASK = 0x01;
  static const int ARCH_ENDIAN_LITTLE = 0;
  static const int ARCH_ENDIAN_BIG = 1;

  static const int MAX_FIELD_SIZE = 255;

  static const int FIELD_NUM_INVALID = 255;
  static const int FIELD_NUM_MESSAGE_INDEX = 254;
  static const int FIELD_NUM_TIMESTAMP = 253;
  static const int FIELD_DEFAULT_SCALE = 1;
  static const int FIELD_DEFAULT_OFFSET = 0;

  static const int SUBFIELD_INDEX_ACTIVE_SUBFIELD = 65534;
  static const int SUBFIELD_INDEX_MAIN_FIELD = 65535;
  static const String SUBFIELD_NAME_MAIN_FIELD = '';

  static const int BASE_TYPE_ENDIAN_FLAG = 0x80;
  static const int BASE_TYPE_RESERVED = 0x60;
  static const int BASE_TYPE_NUM_MASK = 0x1F;

  static const int UTF8_BOM_BYTE_1 = 0xEF;
  static const int UTF8_BOM_BYTE_2 = 0xBB;
  static const int UTF8_BOM_BYTE_3 = 0xBF;
  static const int UTF8_NUM_BOM_BYTES = 3;
}
