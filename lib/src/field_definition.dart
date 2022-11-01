import 'dart:math';
import 'dart:typed_data';

import 'base_type.dart';
import 'field.dart';

class FieldDefinition {
  /// Defines a field definition used in a definition message.
  ///
  /// In the definition message each field is defined in 3 bytes, with the
  /// following data: [id] (referred to as "Field Definition Number"), [size],
  /// and [type] (referred to as "Base Type").  [id] is the field definition
  /// number, [size] is how big the field is in bytes, and [type] is the Base
  /// Type of the field. Note that the [size] may be a multiple of the
  /// underlying Base Type size indicating the field contains multiple elements
  /// represented as an array.
  FieldDefinition({this.id = 0, this.size = 0, this.type = BaseType.ENUM});

  final int id;
  final int size;
  final BaseType type;

  static const fieldDefinitionSize = 3;

  static FieldDefinition fromField(Field field, {int minStringSize = 0}) {
    final int size;
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
    final bb = BytesBuilder()
      ..addByte(id)
      ..addByte(size)
      ..addByte(type.value);
    return bb.toBytes();
  }
}
