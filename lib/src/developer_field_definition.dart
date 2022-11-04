import 'dart:math';
import 'dart:typed_data';

import 'base_type.dart';
import 'developer_field.dart';

class DeveloperFieldDefinition {
  /// Defines a developer field definition used in a definition message.
  ///
  /// In the definition message each developer field is defined in 3 bytes, with
  /// the following data: [id] (referred to as "Field Definition Number"),
  /// [size], and [developerDataIndex]. [developerDataIndex] and [id] map to
  /// the developer field description previously defined in a
  /// [FieldDescriptionMessage] message in the FIT file. A FIT file can contain
  /// up to 255 unique fields per developer. [size] describes how big the field
  /// is in bytes.  Note that the [size] may be a multiple of the underlying
  /// Base Type size indicating the field contains multiple elements represented
  /// as an array.
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
