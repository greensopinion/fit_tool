import 'dart:math';
import 'dart:typed_data';

import 'base_type.dart';
import 'field.dart';

class FieldDefinition {
  FieldDefinition({this.id = 0, this.size = 0, this.type = BaseType.ENUM});

  final int id;
  final int size;
  final BaseType type;

  static const fieldDefinitionSize = 3;

  static FieldDefinition fromField(Field field, {int minStringSize = 0}) {
    final size;
    if (field.type == BaseType.STRING) {
      size = max(field.size, minStringSize);
    } else {
      size = field.size;
    }
    return FieldDefinition(id: field.id, size: size, type: field.type);
  }

  static FieldDefinition fromBytes(Uint8List bytes) {
    final bd = ByteData.sublistView(bytes);
    final id = bd.getUint8(0);
    final size = bd.getUint8(1);
    final type = BaseTypeExtension.fromValue(bd.getUint8(2));

    return FieldDefinition(id: id, size: size, type: type);
  }

  Uint8List toBytes() {
    final bb = BytesBuilder()..addByte(id)..addByte(size)..addByte(type.value);
    return bb.toBytes();
  }
}
