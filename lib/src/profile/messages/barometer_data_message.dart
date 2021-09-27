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

class BarometerDataMessage extends DataMessage {

   BarometerDataMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: BarometerDataMessage.NAME,
            globalId: BarometerDataMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              TimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BarometerDataTimestampMsField(
                  size: definitionMessage?.getFieldDefinition(BarometerDataTimestampMsField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BarometerDataSampleTimeOffsetField(
                  size: definitionMessage?.getFieldDefinition(BarometerDataSampleTimeOffsetField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BarometerDataBaroPresField(
                  size: definitionMessage?.getFieldDefinition(BarometerDataBaroPresField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 209;
  static const NAME = 'barometer_data';

  final bool growable;

  static BarometerDataMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = BarometerDataMessage(definitionMessage: definitionMessage);
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
     final field = getField(BarometerDataTimestampMsField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set timestampMs(int? value) {
    final field = getField(BarometerDataTimestampMsField.ID);

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
     final field = getField(BarometerDataSampleTimeOffsetField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set sampleTimeOffset(int? value) {
    final field = getField(BarometerDataSampleTimeOffsetField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get baroPres {
     final field = getField(BarometerDataBaroPresField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set baroPres(int? value) {
    final field = getField(BarometerDataBaroPresField.ID);

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



class BarometerDataTimestampMsField extends Field {
 BarometerDataTimestampMsField({int size = 0, bool growable = true})
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
class BarometerDataSampleTimeOffsetField extends Field {
 BarometerDataSampleTimeOffsetField({int size = 0, bool growable = true})
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
class BarometerDataBaroPresField extends Field {
 BarometerDataBaroPresField({int size = 0, bool growable = true})
      : super(
            name: 'baro_pres',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'Pa',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 2;
}