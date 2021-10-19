import 'dart:io';
import 'dart:typed_data';

import 'definition_message.dart';
import 'developer_field.dart';
import 'field.dart';
import 'profile/messages/message_factory.dart';
import 'utils/iterable.dart';

abstract class DataMessage extends Message {
  DataMessage({
    this.name = '',
    globalId = 0,
    localId = 0,
    endian = Endian.little,
    this.definitionMessage,
    List<Field>? fields,
    List<DeveloperField>? developerFields,
  })  : fields = fields ?? [],
        developerFields = developerFields ?? [],
        super(globalId: globalId, localId: localId, endian: endian);

  final String name;
  final List<Field> fields;
  final List<DeveloperField> developerFields;
  DefinitionMessage? definitionMessage;

  static DataMessage fromDefinition(DefinitionMessage definitionMessage,
      List<DeveloperField> developerFields) {
    return MessageFactory.fromDefinition(definitionMessage, developerFields);
  }

  static DataMessage fromBytes(DefinitionMessage definitionMessage,
      List<DeveloperField> developerFields, Uint8List bytes) {
    final message =
        DataMessage.fromDefinition(definitionMessage, developerFields);
    message.readFromBytes(bytes);
    return message;
  }

  void setDefinitionMessage(DefinitionMessage definition) {
    definitionMessage = definition;

    for (var field in fields) {
      var fieldDefinition = definition.getFieldDefinition(field.id);
      if (fieldDefinition == null) {
        field.size = 0;
      } else {
        field.size = fieldDefinition.size;
      }
    }

    for (var field in developerFields) {
      var fieldDefinition = definition.getDeveloperFieldDefinition(field.id);
      if (fieldDefinition == null) {
        field.size = 0;
      } else {
        field.size = fieldDefinition.size;
      }
    }
  }

  Field? getField(int id) {
    return fields.firstWhereOrNull((field) => field.id == id);
  }

  Field? getFieldByName(String name) {
    return fields.firstWhereOrNull((field) => field.name == name);
  }

  void clearFieldById(int id) {
    final field = getField(id);
    if (field != null) {
      field.clear();
      if (definitionMessage != null) {
        definitionMessage!.removeField(id);
      }
    }
  }

  @override
  void removeField(int id) {
    clearFieldById(id);
  }

  DeveloperField? getDeveloperField(int id) {
    return developerFields.firstWhereOrNull((field) => field.id == id);
  }

  DeveloperField? getDeveloperFieldByName(String name) {
    return developerFields.firstWhereOrNull((field) => field.name == name);
  }

  void readFromBytes(Uint8List bytes) {
    var start = 0;

    if (definitionMessage == null) {
      throw Exception('DefinitionMessage cannot be null.');
    }

    for (var fieldDefinition in definitionMessage!.fieldDefinitions) {
      final field = getField(fieldDefinition.id);

      if (field == null) {
        // throw Exception('Field id: ${fieldDefinition.id} is not defined for message $name:$globalId');
        print(
            'WARNING: Field id: ${fieldDefinition.id} is not defined for message $name:$globalId. Skipping this field');
        start += fieldDefinition.size;
        continue;
      }

      if (field.isValid()) {
        final fieldBytes =
            Uint8List.sublistView(bytes, start, start + field.size);

        var subField = field.getValidSubField(fields);
        field.readAllFromBytes(fieldBytes, subField: subField, endian: endian);
        start += field.size;
      } else {
        throw Exception('Field ${field.name} is empty');
      }
    }

    for (var developerFieldDefinition
        in definitionMessage!.developerFieldDefinitions) {
      final field = getDeveloperField(developerFieldDefinition.id);

      if (field == null) {
        throw Exception(
            'Developer Field id: ${developerFieldDefinition.id} is not defined for message $name:$globalId');
      }
      if (field.isValid()) {
        final fieldBytes =
            Uint8List.sublistView(bytes, start, start + field.size);

        var subField = field.getValidSubField(fields);
        field.readAllFromBytes(fieldBytes, subField: subField, endian: endian);
        start += field.size;
      } else {
        throw Exception('Developer Field ${field.name} is empty');
      }
    }
  }

  @override
  int get size {
    var count = 0;
    for (var field in fields) {
      if (field.isValid()) {
        count += field.size;
      }
    }
    for (var field in developerFields) {
      if (field.isValid()) {
        count += field.size;
      }
    }
    return count;
  }

  @override
  List<dynamic> toRow() {
    final row = <dynamic>[];
    row.add(name);

    if (definitionMessage == null) {
      for (var field in fields) {
        if (field.isValid()) {
          var subField = field.getValidSubField(fields);
          row.addAll(field.toRow(subField: subField));
        }
      }
      for (var field in developerFields) {
        if (field.isValid()) {
          var subField = field.getValidSubField(fields);
          row.addAll(field.toRow(subField: subField));
        }
      }
    } else {
      for (var fieldDefinition in definitionMessage!.fieldDefinitions) {
        final field = getField(fieldDefinition.id);
        if (field == null) {
          throw Exception('Field for id: ${fieldDefinition.id} not found.');
        }

        if (field.isValid()) {
          var subField = field.getValidSubField(fields);
          row.addAll(field.toRow(subField: subField));
        } else {
          throw Exception('Field for id: ${fieldDefinition.id} is not valid.');
        }
      }

      for (var fieldDefinition
          in definitionMessage!.developerFieldDefinitions) {
        final field = getDeveloperField(fieldDefinition.id);

        if (field == null) {
          throw Exception(
              'Developer field for id: ${fieldDefinition.id} not found.');
        }
        if (field.isValid()) {
          var subField = field.getValidSubField(fields);
          row.addAll(field.toRow(subField: subField));
        } else {
          throw Exception(
              'Developer field for id: ${fieldDefinition.id} is not valid.');
        }
      }
    }

    return row;
  }

  @override
  Uint8List toBytes() {
    final bb = BytesBuilder();

    if (definitionMessage == null) {
      for (var field in fields) {
        if (field.isValid()) {
          bb.add(field.toBytes(endian: endian));
        }
      }
      for (var field in developerFields) {
        if (field.isValid()) {
          bb.add(field.toBytes(endian: endian));
        }
      }
    } else {
      for (var fieldDefinition in definitionMessage!.fieldDefinitions) {
        final field = getField(fieldDefinition.id);
        if (field == null) {
          // throw Exception('Field for id: ${fieldDefinition.id} not found.');
          print(
              'WARNING: Field for id: ${fieldDefinition.id} not found. Skipping.');
          continue;
        }

        if (field.isValid()) {
          bb.add(field.toBytes(endian: endian));
        } else {
          throw Exception('Field for id: ${fieldDefinition.id} is not valid.');
        }
      }

      for (var fieldDefinition
          in definitionMessage!.developerFieldDefinitions) {
        final field = getDeveloperField(fieldDefinition.id);

        if (field == null) {
          throw Exception(
              'Developer field for id: ${fieldDefinition.id} not found.');
        }
        if (field.isValid()) {
          bb.add(field.toBytes(endian: endian));
        } else {
          throw Exception(
              'Developer field for id: ${fieldDefinition.id} is not valid.');
        }
      }
    }

    return bb.toBytes();
  }

  @override
  bool hasDeveloperFields() {
    return developerFields.isNotEmpty;
  }
}
