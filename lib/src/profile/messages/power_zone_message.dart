/// Autogenerated. Do not modify.
///
/// Profile: 21.60
import 'dart:typed_data';

import '../../base_type.dart';
import '../../data_message.dart';
import '../../definition_message.dart';
import '../../errors.dart';
import '../../field.dart';
import 'common_fields.dart';

// ignore_for_file: constant_identifier_names

class PowerZoneMessage extends DataMessage {
  PowerZoneMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: PowerZoneMessage.NAME,
            globalId: PowerZoneMessage.ID,
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
              PowerZoneHighValueField(
                  size: definitionMessage
                          ?.getFieldDefinition(PowerZoneHighValueField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              PowerZoneNameField(
                  size: definitionMessage
                          ?.getFieldDefinition(PowerZoneNameField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  /// The Global ID of the message. In the FIT documentation this is referred to as the "Global Message Number".
  static const ID = 9;
  static const NAME = 'power_zone';

  final bool growable;

  /// Returns an instance of PowerZoneMessage from a bytes list.
  static PowerZoneMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = PowerZoneMessage(definitionMessage: definitionMessage);
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

  /// Returns the value of the highValue field. Returns null if the field is not defined in the message.
  int? get highValue {
    final field = getField(PowerZoneHighValueField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the highValue field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set highValue(int? value) {
    final field = getField(PowerZoneHighValueField.ID);

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

  /// Returns the value of the powerZoneName field. Returns null if the field is not defined in the message.
  String? get powerZoneName {
    final field = getField(PowerZoneNameField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the powerZoneName field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set powerZoneName(String? value) {
    final field = getField(PowerZoneNameField.ID);

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

class PowerZoneHighValueField extends Field {
  PowerZoneHighValueField({int size = 0, bool growable = true})
      : super(
            name: 'high_value',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'watts',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 1;
}

class PowerZoneNameField extends Field {
  PowerZoneNameField({int size = 0, bool growable = true})
      : super(
            name: 'name',
            id: ID,
            type: BaseType.STRING,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 2;
}
