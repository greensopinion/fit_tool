// ignore_for_file: constant_identifier_names

enum BaseType {
  ENUM,
  SINT8,
  UINT8,
  SINT16,
  UINT16,
  SINT32,
  UINT32,
  STRING,
  FLOAT32,
  FLOAT64,
  UINT8Z,
  UINT16Z,
  UINT32Z,
  BYTE,
  SINT64,
  UINT64,
  UINT64Z,
}

extension BaseTypeExtension on BaseType {
  static BigInt uint64Max = BigInt.from(-1).toUnsigned(64);
  static BigInt sint64Max = BigInt.parse('7fffffffffffffff', radix: 16);
  static BigInt uint64Min = BigInt.zero;
  static BigInt sint64Min = -BigInt.parse('8000000000000000', radix: 16);

  int get value {
    switch (this) {
      case BaseType.ENUM:
        return 0x00;
      case BaseType.SINT8:
        return 0x01;
      case BaseType.UINT8:
        return 0x02;
      case BaseType.SINT16:
        return 0x83;
      case BaseType.UINT16:
        return 0x84;
      case BaseType.SINT32:
        return 0x85;
      case BaseType.UINT32:
        return 0x86;
      case BaseType.STRING:
        return 0x07;
      case BaseType.FLOAT32:
        return 0x88;
      case BaseType.FLOAT64:
        return 0x89;
      case BaseType.UINT8Z:
        return 0x0A;
      case BaseType.UINT16Z:
        return 0x8B;
      case BaseType.UINT32Z:
        return 0x8C;
      case BaseType.BYTE:
        return 0x0D;
      case BaseType.SINT64:
        return 0x8E;
      case BaseType.UINT64:
        return 0x8F;
      case BaseType.UINT64Z:
        return 0x90;
    }
  }

  int get size {
    switch (this) {
      case BaseType.ENUM:
        return 1;
      case BaseType.SINT8:
        return 1;
      case BaseType.UINT8:
        return 1;
      case BaseType.SINT16:
        return 2;
      case BaseType.UINT16:
        return 2;
      case BaseType.SINT32:
        return 4;
      case BaseType.UINT32:
        return 4;
      case BaseType.STRING:
        return 1;
      case BaseType.FLOAT32:
        return 4;
      case BaseType.FLOAT64:
        return 8;
      case BaseType.UINT8Z:
        return 1;
      case BaseType.UINT16Z:
        return 2;
      case BaseType.UINT32Z:
        return 4;
      case BaseType.BYTE:
        return 1;
      case BaseType.SINT64:
        return 8;
      case BaseType.UINT64:
        return 8;
      case BaseType.UINT64Z:
        return 8;
    }
  }

  bool isInteger() {
    switch (this) {
      case BaseType.SINT8:
      case BaseType.UINT8:
      case BaseType.SINT16:
      case BaseType.UINT16:
      case BaseType.UINT16Z:
      case BaseType.SINT32:
      case BaseType.UINT32:
      case BaseType.UINT32Z:
      case BaseType.SINT64:
      case BaseType.UINT64:
      case BaseType.UINT64Z:
        return true;

      default:
        return false;
    }
  }

  bool isSignedInteger() {
    switch (this) {
      case BaseType.SINT8:
      case BaseType.SINT16:
      case BaseType.SINT32:
      case BaseType.SINT64:
        return true;

      default:
        return false;
    }
  }

  bool isBig() {
    switch (this) {
      case BaseType.SINT64:
      case BaseType.UINT64:
      case BaseType.UINT64Z:
        return true;

      default:
        return false;
    }
  }

  bool isString() {
    return this == BaseType.STRING;
  }

  bool isFloat() {
    switch (this) {
      case BaseType.FLOAT32:
      case BaseType.FLOAT64:
        return true;

      default:
        return false;
    }
  }

  dynamic get invalidRawValue {
    switch (this) {
      case BaseType.ENUM:
        return 0xff;
      case BaseType.SINT8:
        return 0x7f;
      case BaseType.UINT8:
        return 0xff;
      case BaseType.SINT16:
        return 0x7fff;
      case BaseType.UINT16:
        return 0xffff;
      case BaseType.SINT32:
        return 0x7fffffff;
      case BaseType.UINT32:
        return 0xffffffff;
      case BaseType.STRING:
        return 0x00;
      case BaseType.FLOAT32:
        return 0xffffffff;
      case BaseType.FLOAT64:
        return uint64Max;
      case BaseType.UINT8Z:
        return 0x00;
      case BaseType.UINT16Z:
        return 0x0000;
      case BaseType.UINT32Z:
        return 0x00000000;
      case BaseType.BYTE:
        return 0xff;
      case BaseType.SINT64:
        return sint64Max;
      case BaseType.UINT64:
        return uint64Max;
      case BaseType.UINT64Z:
        return BigInt.zero;
    }
  }

  // Max integer
  dynamic get max {
    switch (this) {
      case BaseType.ENUM:
        return 0xff;
      case BaseType.SINT8:
        return 0x7f;
      case BaseType.UINT8:
        return 0xff;
      case BaseType.SINT16:
        return 0x7fff;
      case BaseType.UINT16:
        return 0xffff;
      case BaseType.SINT32:
        return 0x7fffffff;
      case BaseType.UINT32:
        return 0xffffffff;
      case BaseType.STRING:
        return null;
      case BaseType.FLOAT32:
        return null;
      case BaseType.FLOAT64:
        return null;
      case BaseType.UINT8Z:
        return 0xff;
      case BaseType.UINT16Z:
        return 0xffff;
      case BaseType.UINT32Z:
        return 0xffffffff;
      case BaseType.BYTE:
        return 0xff;
      case BaseType.SINT64:
        return sint64Max;
      case BaseType.UINT64:
        return uint64Max;
      case BaseType.UINT64Z:
        return uint64Max;
    }
  }

// Min integer
  dynamic get min {
    switch (this) {
      case BaseType.ENUM:
        return 0x00;
      case BaseType.SINT8:
        return -0x80;
      case BaseType.UINT8:
        return 0x00;
      case BaseType.SINT16:
        return -0x8000;
      case BaseType.UINT16:
        return 0x0000;
      case BaseType.SINT32:
        return -0x80000000;
      case BaseType.UINT32:
        return 0x00000000;
      case BaseType.STRING:
        return null;
      case BaseType.FLOAT32:
        return null;
      case BaseType.FLOAT64:
        return null;
      case BaseType.UINT8Z:
        return 0x00;
      case BaseType.UINT16Z:
        return 0x0000;
      case BaseType.UINT32Z:
        return 0x00000000;
      case BaseType.BYTE:
        return 0x00;
      case BaseType.SINT64:
        return sint64Min;
      case BaseType.UINT64:
        return BigInt.zero;
      case BaseType.UINT64Z:
        return BigInt.zero;
    }
  }

  static BaseType fromValue(int value) {
    switch (value) {
      case 0x00:
        return BaseType.ENUM;
      case 0x01:
        return BaseType.SINT8;
      case 0x02:
        return BaseType.UINT8;
      case 0x83:
        return BaseType.SINT16;
      case 0x84:
        return BaseType.UINT16;
      case 0x85:
        return BaseType.SINT32;
      case 0x86:
        return BaseType.UINT32;
      case 0x07:
        return BaseType.STRING;
      case 0x88:
        return BaseType.FLOAT32;
      case 0x89:
        return BaseType.FLOAT64;
      case 0x0A:
        return BaseType.UINT8Z;
      case 0x8B:
        return BaseType.UINT16Z;
      case 0x8C:
        return BaseType.UINT32Z;
      case 0x0D:
        return BaseType.BYTE;
      case 0x8E:
        return BaseType.SINT64;
      case 0x8F:
        return BaseType.UINT64;
      case 0x90:
        return BaseType.UINT64Z;
      default:
        throw ArgumentError.value(value, 'value', 'Not a valid base type');
    }
  }
}
