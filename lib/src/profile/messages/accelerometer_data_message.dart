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

class AccelerometerDataMessage extends DataMessage {

   AccelerometerDataMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: AccelerometerDataMessage.NAME,
            globalId: AccelerometerDataMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              TimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataTimestampMsField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataTimestampMsField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataSampleTimeOffsetField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataSampleTimeOffsetField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataAccelXField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataAccelXField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataAccelYField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataAccelYField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataAccelZField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataAccelZField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataCalibratedAccelXField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataCalibratedAccelXField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataCalibratedAccelYField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataCalibratedAccelYField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataCalibratedAccelZField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataCalibratedAccelZField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataCompressedCalibratedAccelXField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataCompressedCalibratedAccelXField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataCompressedCalibratedAccelYField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataCompressedCalibratedAccelYField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              AccelerometerDataCompressedCalibratedAccelZField(
                  size: definitionMessage?.getFieldDefinition(AccelerometerDataCompressedCalibratedAccelZField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 165;
  static const NAME = 'accelerometer_data';

  final bool growable;

  static AccelerometerDataMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = AccelerometerDataMessage(definitionMessage: definitionMessage);
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
     final field = getField(AccelerometerDataTimestampMsField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set timestampMs(int? value) {
    final field = getField(AccelerometerDataTimestampMsField.ID);

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
     final field = getField(AccelerometerDataSampleTimeOffsetField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set sampleTimeOffset(int? value) {
    final field = getField(AccelerometerDataSampleTimeOffsetField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get accelX {
     final field = getField(AccelerometerDataAccelXField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set accelX(int? value) {
    final field = getField(AccelerometerDataAccelXField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get accelY {
     final field = getField(AccelerometerDataAccelYField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set accelY(int? value) {
    final field = getField(AccelerometerDataAccelYField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get accelZ {
     final field = getField(AccelerometerDataAccelZField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set accelZ(int? value) {
    final field = getField(AccelerometerDataAccelZField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get calibratedAccelX {
     final field = getField(AccelerometerDataCalibratedAccelXField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set calibratedAccelX(double? value) {
    final field = getField(AccelerometerDataCalibratedAccelXField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get calibratedAccelY {
     final field = getField(AccelerometerDataCalibratedAccelYField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set calibratedAccelY(double? value) {
    final field = getField(AccelerometerDataCalibratedAccelYField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get calibratedAccelZ {
     final field = getField(AccelerometerDataCalibratedAccelZField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set calibratedAccelZ(double? value) {
    final field = getField(AccelerometerDataCalibratedAccelZField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get compressedCalibratedAccelX {
     final field = getField(AccelerometerDataCompressedCalibratedAccelXField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set compressedCalibratedAccelX(int? value) {
    final field = getField(AccelerometerDataCompressedCalibratedAccelXField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get compressedCalibratedAccelY {
     final field = getField(AccelerometerDataCompressedCalibratedAccelYField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set compressedCalibratedAccelY(int? value) {
    final field = getField(AccelerometerDataCompressedCalibratedAccelYField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get compressedCalibratedAccelZ {
     final field = getField(AccelerometerDataCompressedCalibratedAccelZField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set compressedCalibratedAccelZ(int? value) {
    final field = getField(AccelerometerDataCompressedCalibratedAccelZField.ID);

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



class AccelerometerDataTimestampMsField extends Field {
 AccelerometerDataTimestampMsField({int size = 0, bool growable = true})
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
class AccelerometerDataSampleTimeOffsetField extends Field {
 AccelerometerDataSampleTimeOffsetField({int size = 0, bool growable = true})
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
class AccelerometerDataAccelXField extends Field {
 AccelerometerDataAccelXField({int size = 0, bool growable = true})
      : super(
            name: 'accel_x',
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
class AccelerometerDataAccelYField extends Field {
 AccelerometerDataAccelYField({int size = 0, bool growable = true})
      : super(
            name: 'accel_y',
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
class AccelerometerDataAccelZField extends Field {
 AccelerometerDataAccelZField({int size = 0, bool growable = true})
      : super(
            name: 'accel_z',
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
class AccelerometerDataCalibratedAccelXField extends Field {
 AccelerometerDataCalibratedAccelXField({int size = 0, bool growable = true})
      : super(
            name: 'calibrated_accel_x',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'g',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 5;
}
class AccelerometerDataCalibratedAccelYField extends Field {
 AccelerometerDataCalibratedAccelYField({int size = 0, bool growable = true})
      : super(
            name: 'calibrated_accel_y',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'g',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 6;
}
class AccelerometerDataCalibratedAccelZField extends Field {
 AccelerometerDataCalibratedAccelZField({int size = 0, bool growable = true})
      : super(
            name: 'calibrated_accel_z',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'g',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 7;
}
class AccelerometerDataCompressedCalibratedAccelXField extends Field {
 AccelerometerDataCompressedCalibratedAccelXField({int size = 0, bool growable = true})
      : super(
            name: 'compressed_calibrated_accel_x',
            id: ID,
            type: BaseType.SINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'mG',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 8;
}
class AccelerometerDataCompressedCalibratedAccelYField extends Field {
 AccelerometerDataCompressedCalibratedAccelYField({int size = 0, bool growable = true})
      : super(
            name: 'compressed_calibrated_accel_y',
            id: ID,
            type: BaseType.SINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'mG',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 9;
}
class AccelerometerDataCompressedCalibratedAccelZField extends Field {
 AccelerometerDataCompressedCalibratedAccelZField({int size = 0, bool growable = true})
      : super(
            name: 'compressed_calibrated_accel_z',
            id: ID,
            type: BaseType.SINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 'mG',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 10;
}