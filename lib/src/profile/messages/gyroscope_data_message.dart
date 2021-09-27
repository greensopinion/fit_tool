/// Autogenerated. Do not modify.
///
/// Profile: 21.60
import 'dart:typed_data';

import '../../base_type.dart';
import '../../data_message.dart';
import '../../definition_message.dart';
import '../../field.dart';
import '../../sub_field.dart';
import '../profile_type.dart';
import 'common_fields.dart';

class GyroscopeDataMessage extends DataMessage {

   GyroscopeDataMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: GyroscopeDataMessage.NAME,
            globalId: GyroscopeDataMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              TimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataTimestampMsField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataTimestampMsField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataSampleTimeOffsetField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataSampleTimeOffsetField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataGyroXField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataGyroXField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataGyroYField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataGyroYField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataGyroZField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataGyroZField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataCalibratedGyroXField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataCalibratedGyroXField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataCalibratedGyroYField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataCalibratedGyroYField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              GyroscopeDataCalibratedGyroZField(
                  size: definitionMessage?.getFieldDefinition(GyroscopeDataCalibratedGyroZField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 164;
  static const NAME = 'gyroscope_data';

  final bool growable;

  static GyroscopeDataMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = GyroscopeDataMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }


  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
  int? get timestamp {
     final field = getField(TimestampField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
   set timestamp(int? value) {
    final field = getField(TimestampField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get timestampMs {
     final field = getField(GyroscopeDataTimestampMsField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set timestampMs(int? value) {
    final field = getField(GyroscopeDataTimestampMsField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get sampleTimeOffset {
     final field = getField(GyroscopeDataSampleTimeOffsetField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set sampleTimeOffset(int? value) {
    final field = getField(GyroscopeDataSampleTimeOffsetField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get gyroX {
     final field = getField(GyroscopeDataGyroXField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set gyroX(int? value) {
    final field = getField(GyroscopeDataGyroXField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get gyroY {
     final field = getField(GyroscopeDataGyroYField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set gyroY(int? value) {
    final field = getField(GyroscopeDataGyroYField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get gyroZ {
     final field = getField(GyroscopeDataGyroZField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set gyroZ(int? value) {
    final field = getField(GyroscopeDataGyroZField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get calibratedGyroX {
     final field = getField(GyroscopeDataCalibratedGyroXField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set calibratedGyroX(double? value) {
    final field = getField(GyroscopeDataCalibratedGyroXField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get calibratedGyroY {
     final field = getField(GyroscopeDataCalibratedGyroYField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set calibratedGyroY(double? value) {
    final field = getField(GyroscopeDataCalibratedGyroYField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get calibratedGyroZ {
     final field = getField(GyroscopeDataCalibratedGyroZField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set calibratedGyroZ(double? value) {
    final field = getField(GyroscopeDataCalibratedGyroZField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }



}



class GyroscopeDataTimestampMsField extends Field {
 GyroscopeDataTimestampMsField({int size = 0, bool growable = true})
      : super(
            name: 'timestamp_ms',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'ms',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 0;
}
class GyroscopeDataSampleTimeOffsetField extends Field {
 GyroscopeDataSampleTimeOffsetField({int size = 0, bool growable = true})
      : super(
            name: 'sample_time_offset',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'ms',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 1;
}
class GyroscopeDataGyroXField extends Field {
 GyroscopeDataGyroXField({int size = 0, bool growable = true})
      : super(
            name: 'gyro_x',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'counts',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 2;
}
class GyroscopeDataGyroYField extends Field {
 GyroscopeDataGyroYField({int size = 0, bool growable = true})
      : super(
            name: 'gyro_y',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'counts',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 3;
}
class GyroscopeDataGyroZField extends Field {
 GyroscopeDataGyroZField({int size = 0, bool growable = true})
      : super(
            name: 'gyro_z',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'counts',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 4;
}
class GyroscopeDataCalibratedGyroXField extends Field {
 GyroscopeDataCalibratedGyroXField({int size = 0, bool growable = true})
      : super(
            name: 'calibrated_gyro_x',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'deg/s',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 5;
}
class GyroscopeDataCalibratedGyroYField extends Field {
 GyroscopeDataCalibratedGyroYField({int size = 0, bool growable = true})
      : super(
            name: 'calibrated_gyro_y',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'deg/s',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 6;
}
class GyroscopeDataCalibratedGyroZField extends Field {
 GyroscopeDataCalibratedGyroZField({int size = 0, bool growable = true})
      : super(
            name: 'calibrated_gyro_z',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'deg/s',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 7;
}