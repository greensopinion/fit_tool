import 'dart:math';
import 'dart:typed_data';

import 'base_type.dart';
import 'developer_field.dart';

class DeveloperFieldDefinition {
  DeveloperFieldDefinition(
      {this.id = 0, this.size = 0, this.developerDataIndex = 0});

  final int id;
  final int size;
  final int developerDataIndex;

  static const fieldDefinitionSize = 3;

  static DeveloperFieldDefinition fromField(DeveloperField field,
      {int minStringSize = 0}) {
    final int size;

    if (field.type == BaseType.STRING) {
      size = max(field.size, minStringSize);
    } else {
      size = field.size;
    }
    return DeveloperFieldDefinition(
        id: field.id, size: size, developerDataIndex: field.developerDataIndex);
  }

  static DeveloperFieldDefinition fromBytes(Uint8List bytes) {
    final bd = ByteData.sublistView(bytes);
    final fieldNumber = bd.getUint8(0);
    final size = bd.getUint8(1);
    final developerDataIndex = bd.getUint8(2);

    return DeveloperFieldDefinition(
        id: fieldNumber, size: size, developerDataIndex: developerDataIndex);
  }

  Uint8List toBytes() {
    final bb = BytesBuilder()
      ..addByte(id)
      ..addByte(size)
      ..addByte(developerDataIndex);
    return bb.toBytes();
  }
}
