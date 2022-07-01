import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:fit_tool/src/utils/logger.dart';

import 'data_message.dart';
import 'developer_field.dart';
import 'developer_field_definition.dart';
import 'field_definition.dart';
import 'profile/messages/message_factory.dart';
import 'utils/type_sizes.dart';

abstract class Message {
  Message(
      {this.localId = 0,
      this.globalId = 0,
      this.endian = Endian.little,
      this.size = 0}) {
    RangeError.checkValueInInterval(globalId, 0, maxUint16, 'globalId');
    RangeError.checkValueInInterval(localId, 0, maxUint8, 'localId');
  }

  // ID that provides an association between the definition message,
  // data message and the FIT message in the Global FIT Profile.
  int localId;

  // ID of the FIT message in the Global FIT Profile.
  final int globalId;

  final Endian endian;

  int size;

  Uint8List toBytes();

  bool hasDeveloperFields();

  List<dynamic> toRow();

  void removeField(int id);
  void removeDeveloperField(int developerDataIndex, int id);
}

class DefinitionMessage extends Message {
  DefinitionMessage({
    endian = Endian.little,
    globalId = 0,
    localId = 0,
    List<FieldDefinition>? fieldDefinitions,
    List<DeveloperFieldDefinition>? developerFieldDefinitions,
  })  : fieldDefinitions = fieldDefinitions ?? [],
        developerFieldDefinitions = developerFieldDefinitions ?? [],
        super(
            localId: localId,
            globalId: globalId,
            endian: endian,
            size: calculateSize(fieldDefinitions, developerFieldDefinitions));

  final List<FieldDefinition> fieldDefinitions;
  final List<DeveloperFieldDefinition> developerFieldDefinitions;

  int get definedDataSize {
    var size = 0;
    for (var fieldDefinition in fieldDefinitions) {
      size += fieldDefinition.size;
    }

    for (var developerFieldDefinition in developerFieldDefinitions) {
      size += developerFieldDefinition.size;
    }

    return size;
  }

  FieldDefinition? getFieldDefinition(int id) {
    return fieldDefinitions.firstWhereOrNull((element) => element.id == id);
  }

  @override
  void removeField(int id) {
    fieldDefinitions.removeWhere((fieldDefinition) => fieldDefinition.id == id);
    size = calculateSize(fieldDefinitions, developerFieldDefinitions);
  }

  @override
  void removeDeveloperField(int developerDataIndex, int id) {
    developerFieldDefinitions.removeWhere((fieldDefinition) =>
        fieldDefinition.developerDataIndex == developerDataIndex &&
        fieldDefinition.id == id);
    size = calculateSize(fieldDefinitions, developerFieldDefinitions);
  }

  void addFieldDefinition(FieldDefinition definition) {
    fieldDefinitions.add(definition);
  }

  DeveloperFieldDefinition? getDeveloperFieldDefinition(int id) {
    return developerFieldDefinitions
        .firstWhereOrNull((element) => element.id == id);
  }

  void addDeveloperFieldDefinition(DeveloperFieldDefinition definition) {
    developerFieldDefinitions.add(definition);
  }

  @override
  List<dynamic> toRow() {
    final values = <dynamic>[];
    final message = MessageFactory.fromDefinition(this, []);
    values.add(message.name);

    for (var fieldDefinition in fieldDefinitions) {
      final field = message.getField(fieldDefinition.id);

      if (field == null) {
        logger.w(
            'Field id:${fieldDefinition.id} could not be found in ${message.name}.');
        continue;
      }
      values.add(field.name);
      values.add(fieldDefinition.size);
      values.add('bytes');
    }

    return values;
  }

  @override
  Uint8List toBytes() {
    final bb = BytesBuilder();

    // reserved
    bb.addByte(0);

    // architecture
    bb.addByte(endian == Endian.little ? 0 : 1);

    // global id
    final byteData = ByteData(2);
    byteData.setUint16(0, globalId, endian);
    bb.add(byteData.buffer.asUint8List());

    //field count
    bb.addByte(fieldDefinitions.length);

    //field definitions
    for (var fd in fieldDefinitions) {
      bb.add(fd.toBytes());
    }

    //developer field definitions
    if (developerFieldDefinitions.isNotEmpty) {
      bb.addByte(developerFieldDefinitions.length);

      //developer field definitions
      for (var fd in developerFieldDefinitions) {
        bb.add(fd.toBytes());
      }
    }

    return bb.toBytes();
  }

  static DefinitionMessage fromBytes(Uint8List bytes,
      {bool hasDeveloperFields = false}) {
    final bd = ByteData.sublistView(bytes);
    var offset = 0;

    // reserved
    offset += 1;

    // architecture
    final endian;
    if (bd.getUint8(offset) == 0) {
      endian = Endian.little;
    } else {
      endian = Endian.big;
    }
    offset += 1;

    // global id
    final globalId = bd.getUint16(offset, endian);
    offset += 2;

    // number of fields
    final fieldCount = bd.getUint8(offset);
    offset += 1;

    // Field definitions;
    final fieldDefinitions = <FieldDefinition>[];
    for (var i = 0; i < fieldCount; i++) {
      final fdBytes = Uint8List.sublistView(
          bytes, offset, offset + FieldDefinition.fieldDefinitionSize);
      final fieldDefinition = FieldDefinition.fromBytes(fdBytes);
      fieldDefinitions.add(fieldDefinition);
      offset += FieldDefinition.fieldDefinitionSize;
    }

    final developerFieldDefinitions = <DeveloperFieldDefinition>[];
    if (hasDeveloperFields) {
      // number of developer fields
      final devFieldCount = bd.getUint8(offset);
      offset += 1;

      for (var i = 0; i < devFieldCount; i++) {
        final fdBytes = Uint8List.sublistView(bytes, offset,
            offset + DeveloperFieldDefinition.fieldDefinitionSize);
        final fieldDefinition = DeveloperFieldDefinition.fromBytes(fdBytes);
        developerFieldDefinitions.add(fieldDefinition);
        offset += DeveloperFieldDefinition.fieldDefinitionSize;
      }
    }

    return DefinitionMessage(
        endian: endian,
        globalId: globalId,
        fieldDefinitions: fieldDefinitions,
        developerFieldDefinitions: developerFieldDefinitions);
  }

  static DefinitionMessage fromDataMessage(DataMessage dataMessage,
      {int minStringSize = 0}) {
    final fieldDefinitions = <FieldDefinition>[];

    for (var field in dataMessage.fields) {
      if (field.isValid()) {
        fieldDefinitions.add(
            FieldDefinition.fromField(field, minStringSize: minStringSize));
      }
    }

    final developerFieldDefinitions = <DeveloperFieldDefinition>[];
    for (var field in dataMessage.developerFields) {
      if (field.isValid()) {
        developerFieldDefinitions.add(DeveloperFieldDefinition.fromField(field,
            minStringSize: minStringSize));
      }
    }

    return DefinitionMessage(
        endian: dataMessage.endian,
        globalId: dataMessage.globalId,
        localId: dataMessage.localId,
        fieldDefinitions: fieldDefinitions,
        developerFieldDefinitions: developerFieldDefinitions);
  }

  @override
  bool hasDeveloperFields() {
    return developerFieldDefinitions.isNotEmpty;
  }

  static int calculateSize(List<FieldDefinition>? fieldDefinitions,
      List<DeveloperFieldDefinition>? developerFieldDefinitions) {
    final fieldDefinitionsCount = fieldDefinitions?.length ?? 0;
    final developerFieldsCount = developerFieldDefinitions?.length ?? 0;

    if (developerFieldsCount == 0) {
      return 5 +
          FieldDefinition.fieldDefinitionSize * fieldDefinitionsCount +
          DeveloperFieldDefinition.fieldDefinitionSize * developerFieldsCount;
    } else {
      return 5 +
          FieldDefinition.fieldDefinitionSize * fieldDefinitionsCount +
          1 +
          DeveloperFieldDefinition.fieldDefinitionSize * developerFieldsCount;
    }
  }

  bool supports(DefinitionMessage other) {
    if (globalId != other.globalId) {
      return false;
    }
    if (localId != other.localId) {
      return false;
    }
    if (endian != other.endian) {
      return false;
    }

    if (fieldDefinitions.length != other.fieldDefinitions.length) {
      return false;
    }

    for (var i = 0; i < fieldDefinitions.length; i++) {
      final fieldDefinition = fieldDefinitions[i];
      final otherFieldDefinition = other.fieldDefinitions[i];

      if (fieldDefinition.id != otherFieldDefinition.id) {
        return false;
      }
      if (fieldDefinition.type != otherFieldDefinition.type) {
        return false;
      }
      if (fieldDefinition.size < otherFieldDefinition.size) {
        return false;
      }
    }

    if (developerFieldDefinitions.length !=
        other.developerFieldDefinitions.length) {
      return false;
    }

    for (var i = 0; i < developerFieldDefinitions.length; i++) {
      final fieldDefinition = developerFieldDefinitions[i];
      final otherFieldDefinition = other.developerFieldDefinitions[i];

      if (fieldDefinition.id != otherFieldDefinition.id) {
        return false;
      }

      if (fieldDefinition.size < otherFieldDefinition.size) {
        return false;
      }
    }

    return true;
  }

  List<DeveloperField> getDeveloperFields(
      Map<int, Map<int, DeveloperField>> developerFieldsById) {
    final developerFields = <DeveloperField>[];

    for (var fieldDefinition in developerFieldDefinitions) {
      final developerField = developerFieldsById[
          fieldDefinition.developerDataIndex]![fieldDefinition.id];

      if (developerField != null) {
        final sizedDeveloperField =
            DeveloperField.from(developerField, size: fieldDefinition.size);
        developerFields.add(sizedDeveloperField);
      }
    }

    return developerFields;
  }
}
