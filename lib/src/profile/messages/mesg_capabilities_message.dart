/// Autogenerated. Do not modify.
///
/// Profile: 21.60
import 'dart:typed_data';

import '../../base_type.dart';
import '../../data_message.dart';
import '../../definition_message.dart';
import '../../errors.dart';
import '../../field.dart';
import '../../sub_field.dart';
import '../profile_type.dart';
import 'common_fields.dart';

// ignore_for_file: constant_identifier_names

class MesgCapabilitiesMessage extends DataMessage {
  MesgCapabilitiesMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: MesgCapabilitiesMessage.NAME,
            globalId: MesgCapabilitiesMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              MessageIndexField(
                  size: definitionMessage
                          ?.getFieldDefinition(MessageIndexField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              MesgCapabilitiesFileField(
                  size: definitionMessage
                          ?.getFieldDefinition(MesgCapabilitiesFileField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              MesgCapabilitiesMesgNumField(
                  size: definitionMessage
                          ?.getFieldDefinition(MesgCapabilitiesMesgNumField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              MesgCapabilitiesCountTypeField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              MesgCapabilitiesCountTypeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              MesgCapabilitiesCountField(
                  size: definitionMessage
                          ?.getFieldDefinition(MesgCapabilitiesCountField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  /// The Global ID of the message. In the FIT documentation this is referred to as the "Global Message Number".
  static const ID = 38;
  static const NAME = 'mesg_capabilities';

  final bool growable;

  /// Returns an instance of MesgCapabilitiesMessage from a bytes list.
  static MesgCapabilitiesMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message =
        MesgCapabilitiesMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }

  /// Returns the value of the messageIndex field. Returns null if the field is not defined in the message.
  int? get messageIndex {
    final field = getField(MessageIndexField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the messageIndex field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set messageIndex(int? value) {
    final field = getField(MessageIndexField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Returns the value of the file field. Returns null if the field is not defined in the message.
  FileType? get file {
    final field = getField(MesgCapabilitiesFileField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return FileTypeExt.fromValue(value);
    } else {
      return null;
    }
  }

  /// Sets the file field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set file(FileType? value) {
    final field = getField(MesgCapabilitiesFileField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Returns the value of the mesgNum field. Returns null if the field is not defined in the message.
  int? get mesgNum {
    final field = getField(MesgCapabilitiesMesgNumField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the mesgNum field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set mesgNum(int? value) {
    final field = getField(MesgCapabilitiesMesgNumField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Returns the value of the countType field. Returns null if the field is not defined in the message.
  MesgCount? get countType {
    final field = getField(MesgCapabilitiesCountTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return MesgCountExt.fromValue(value);
    } else {
      return null;
    }
  }

  /// Sets the countType field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set countType(MesgCount? value) {
    final field = getField(MesgCapabilitiesCountTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Returns the value of the count field. Returns null if the field is not defined in the message.
  int? get count {
    final field = getField(MesgCapabilitiesCountField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the count field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set count(int? value) {
    final field = getField(MesgCapabilitiesCountField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Get the value of the subfield numPerFile
  int? get numPerFile {
    final field = getField(MesgCapabilitiesCountField.ID);
    final typeField = getField(MesgCapabilitiesCountTypeField.ID);

    final isSubFieldValid =
        typeField != null && [0].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the count subfield with [value]. Throws [FieldNotDefinedError] if the subfield is not defined in the message.
  set numPerFile(int? value) {
    final field = getField(MesgCapabilitiesCountField.ID);
    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Get the value of the subfield maxPerFile
  int? get maxPerFile {
    final field = getField(MesgCapabilitiesCountField.ID);
    final typeField = getField(MesgCapabilitiesCountTypeField.ID);

    final isSubFieldValid =
        typeField != null && [1].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the count subfield with [value]. Throws [FieldNotDefinedError] if the subfield is not defined in the message.
  set maxPerFile(int? value) {
    final field = getField(MesgCapabilitiesCountField.ID);
    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Get the value of the subfield maxPerFileType
  int? get maxPerFileType {
    final field = getField(MesgCapabilitiesCountField.ID);
    final typeField = getField(MesgCapabilitiesCountTypeField.ID);

    final isSubFieldValid =
        typeField != null && [2].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the count subfield with [value]. Throws [FieldNotDefinedError] if the subfield is not defined in the message.
  set maxPerFileType(int? value) {
    final field = getField(MesgCapabilitiesCountField.ID);
    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }
}

class MesgCapabilitiesFileField extends Field {
  MesgCapabilitiesFileField({int size = 0, bool growable = true})
      : super(
            name: 'file',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 0;
}

class MesgCapabilitiesMesgNumField extends Field {
  MesgCapabilitiesMesgNumField({int size = 0, bool growable = true})
      : super(
            name: 'mesg_num',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 1;
}

class MesgCapabilitiesCountTypeField extends Field {
  MesgCapabilitiesCountTypeField({int size = 0, bool growable = true})
      : super(
            name: 'count_type',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 2;
}

class MesgCapabilitiesCountField extends Field {
  MesgCapabilitiesCountField({int size = 0, bool growable = true})
      : super(
            name: 'count',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
              SubField(
                  name: 'num_per_file',
                  type: BaseType.UINT16,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                    MesgCapabilitiesCountTypeField.ID: [0]
                  }),
              SubField(
                  name: 'max_per_file',
                  type: BaseType.UINT16,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                    MesgCapabilitiesCountTypeField.ID: [1]
                  }),
              SubField(
                  name: 'max_per_file_type',
                  type: BaseType.UINT16,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                    MesgCapabilitiesCountTypeField.ID: [2]
                  })
            ]);

  static const ID = 3;
}
