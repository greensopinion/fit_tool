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

class ThreeDSensorCalibrationMessage extends DataMessage {
  ThreeDSensorCalibrationMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: ThreeDSensorCalibrationMessage.NAME,
            globalId: ThreeDSensorCalibrationMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              TimestampField(
                  size: definitionMessage
                          ?.getFieldDefinition(TimestampField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ThreeDSensorCalibrationSensorTypeField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ThreeDSensorCalibrationSensorTypeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ThreeDSensorCalibrationCalibrationFactorField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ThreeDSensorCalibrationCalibrationFactorField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ThreeDSensorCalibrationCalibrationDivisorField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ThreeDSensorCalibrationCalibrationDivisorField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ThreeDSensorCalibrationLevelShiftField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ThreeDSensorCalibrationLevelShiftField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ThreeDSensorCalibrationOffsetCalField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ThreeDSensorCalibrationOffsetCalField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ThreeDSensorCalibrationOrientationMatrixField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ThreeDSensorCalibrationOrientationMatrixField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  /// The Global ID of the message. In the FIT documentation this is referred to as the "Global Message Number".
  static const ID = 167;
  static const NAME = 'three_d_sensor_calibration';

  final bool growable;

  /// Returns an instance of ThreeDSensorCalibrationMessage from a bytes list.
  static ThreeDSensorCalibrationMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message =
        ThreeDSensorCalibrationMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }

  /// Returns the value of the timestamp field in  milliseconds since January 1st, 1970 at 00:00:00 UTC
  int? get timestamp {
    final field = getField(TimestampField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the timestamp field. [value] is milliseconds since January 1st, 1970 at 00:00:00 UTC. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set timestamp(int? value) {
    final field = getField(TimestampField.ID);

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

  /// Returns the value of the sensorType field. Returns null if the field is not defined in the message.
  SensorType? get sensorType {
    final field = getField(ThreeDSensorCalibrationSensorTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return SensorTypeExt.fromValue(value);
    } else {
      return null;
    }
  }

  /// Sets the sensorType field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set sensorType(SensorType? value) {
    final field = getField(ThreeDSensorCalibrationSensorTypeField.ID);

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

  /// Returns the value of the calibrationFactor field. Returns null if the field is not defined in the message.
  int? get calibrationFactor {
    final field = getField(ThreeDSensorCalibrationCalibrationFactorField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the calibrationFactor field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set calibrationFactor(int? value) {
    final field = getField(ThreeDSensorCalibrationCalibrationFactorField.ID);

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

  /// Get the value of the subfield accelCalFactor
  int? get accelCalFactor {
    final field = getField(ThreeDSensorCalibrationCalibrationFactorField.ID);
    final typeField = getField(ThreeDSensorCalibrationSensorTypeField.ID);

    final isSubFieldValid =
        typeField != null && [0].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the calibrationFactor subfield with [value]. Throws [FieldNotDefinedError] if the subfield is not defined in the message.
  set accelCalFactor(int? value) {
    final field = getField(ThreeDSensorCalibrationCalibrationFactorField.ID);
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

  /// Get the value of the subfield gyroCalFactor
  int? get gyroCalFactor {
    final field = getField(ThreeDSensorCalibrationCalibrationFactorField.ID);
    final typeField = getField(ThreeDSensorCalibrationSensorTypeField.ID);

    final isSubFieldValid =
        typeField != null && [1].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the calibrationFactor subfield with [value]. Throws [FieldNotDefinedError] if the subfield is not defined in the message.
  set gyroCalFactor(int? value) {
    final field = getField(ThreeDSensorCalibrationCalibrationFactorField.ID);
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

  /// Returns the value of the calibrationDivisor field. Returns null if the field is not defined in the message.
  int? get calibrationDivisor {
    final field = getField(ThreeDSensorCalibrationCalibrationDivisorField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the calibrationDivisor field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set calibrationDivisor(int? value) {
    final field = getField(ThreeDSensorCalibrationCalibrationDivisorField.ID);

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

  /// Returns the value of the levelShift field. Returns null if the field is not defined in the message.
  int? get levelShift {
    final field = getField(ThreeDSensorCalibrationLevelShiftField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the levelShift field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set levelShift(int? value) {
    final field = getField(ThreeDSensorCalibrationLevelShiftField.ID);

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

  /// Returns the value of the offsetCal field. Returns null if the field is not defined in the message.
  int? get offsetCal {
    final field = getField(ThreeDSensorCalibrationOffsetCalField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the offsetCal field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set offsetCal(int? value) {
    final field = getField(ThreeDSensorCalibrationOffsetCalField.ID);

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

  /// Returns the value of the orientationMatrix field. Returns null if the field is not defined in the message.
  double? get orientationMatrix {
    final field = getField(ThreeDSensorCalibrationOrientationMatrixField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the orientationMatrix field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set orientationMatrix(double? value) {
    final field = getField(ThreeDSensorCalibrationOrientationMatrixField.ID);

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

class ThreeDSensorCalibrationSensorTypeField extends Field {
  ThreeDSensorCalibrationSensorTypeField({int size = 0, bool growable = true})
      : super(
            name: 'sensor_type',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 0;
}

class ThreeDSensorCalibrationCalibrationFactorField extends Field {
  ThreeDSensorCalibrationCalibrationFactorField(
      {int size = 0, bool growable = true})
      : super(
            name: 'calibration_factor',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
              SubField(
                  name: 'accel_cal_factor',
                  type: BaseType.UINT32,
                  scale: 1,
                  offset: 0,
                  units: 'g',
                  referenceMap: {
                    ThreeDSensorCalibrationSensorTypeField.ID: [0]
                  }),
              SubField(
                  name: 'gyro_cal_factor',
                  type: BaseType.UINT32,
                  scale: 1,
                  offset: 0,
                  units: 'deg/s',
                  referenceMap: {
                    ThreeDSensorCalibrationSensorTypeField.ID: [1]
                  })
            ]);

  static const ID = 1;
}

class ThreeDSensorCalibrationCalibrationDivisorField extends Field {
  ThreeDSensorCalibrationCalibrationDivisorField(
      {int size = 0, bool growable = true})
      : super(
            name: 'calibration_divisor',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'counts',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 2;
}

class ThreeDSensorCalibrationLevelShiftField extends Field {
  ThreeDSensorCalibrationLevelShiftField({int size = 0, bool growable = true})
      : super(
            name: 'level_shift',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 3;
}

class ThreeDSensorCalibrationOffsetCalField extends Field {
  ThreeDSensorCalibrationOffsetCalField({int size = 0, bool growable = true})
      : super(
            name: 'offset_cal',
            id: ID,
            type: BaseType.SINT32,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 4;
}

class ThreeDSensorCalibrationOrientationMatrixField extends Field {
  ThreeDSensorCalibrationOrientationMatrixField(
      {int size = 0, bool growable = true})
      : super(
            name: 'orientation_matrix',
            id: ID,
            type: BaseType.SINT32,
            offset: 0,
            scale: 65535,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 5;
}
