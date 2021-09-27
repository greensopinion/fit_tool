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

class TimestampCorrelationMessage extends DataMessage {

   TimestampCorrelationMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: TimestampCorrelationMessage.NAME,
            globalId: TimestampCorrelationMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              TimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TimestampCorrelationFractionalTimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampCorrelationFractionalTimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TimestampCorrelationSystemTimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampCorrelationSystemTimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TimestampCorrelationFractionalSystemTimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampCorrelationFractionalSystemTimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TimestampCorrelationLocalTimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampCorrelationLocalTimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TimestampCorrelationTimestampMsField(
                  size: definitionMessage?.getFieldDefinition(TimestampCorrelationTimestampMsField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TimestampCorrelationSystemTimestampMsField(
                  size: definitionMessage?.getFieldDefinition(TimestampCorrelationSystemTimestampMsField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 162;
  static const NAME = 'timestamp_correlation';

  final bool growable;

  static TimestampCorrelationMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = TimestampCorrelationMessage(definitionMessage: definitionMessage);
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
  double? get fractionalTimestamp {
     final field = getField(TimestampCorrelationFractionalTimestampField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set fractionalTimestamp(double? value) {
    final field = getField(TimestampCorrelationFractionalTimestampField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
  int? get systemTimestamp {
     final field = getField(TimestampCorrelationSystemTimestampField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
   set systemTimestamp(int? value) {
    final field = getField(TimestampCorrelationSystemTimestampField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get fractionalSystemTimestamp {
     final field = getField(TimestampCorrelationFractionalSystemTimestampField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set fractionalSystemTimestamp(double? value) {
    final field = getField(TimestampCorrelationFractionalSystemTimestampField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get localTimestamp {
     final field = getField(TimestampCorrelationLocalTimestampField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set localTimestamp(int? value) {
    final field = getField(TimestampCorrelationLocalTimestampField.ID);

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
     final field = getField(TimestampCorrelationTimestampMsField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set timestampMs(int? value) {
    final field = getField(TimestampCorrelationTimestampMsField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get systemTimestampMs {
     final field = getField(TimestampCorrelationSystemTimestampMsField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set systemTimestampMs(int? value) {
    final field = getField(TimestampCorrelationSystemTimestampMsField.ID);

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



class TimestampCorrelationFractionalTimestampField extends Field {
 TimestampCorrelationFractionalTimestampField({int size = 0, bool growable = true})
      : super(
            name: 'fractional_timestamp',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 32768,
            size: size,
            units: 's',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 0;
}
class TimestampCorrelationSystemTimestampField extends Field {
 TimestampCorrelationSystemTimestampField({int size = 0, bool growable = true})
      : super(
            name: 'system_timestamp',
            id: ID,
            type: BaseType.UINT32,
            offset: -631065600000,
            scale: 0.001,
            size: size,
            units: 'ms',
            mainTypeName: 'date_time',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 1;
}
class TimestampCorrelationFractionalSystemTimestampField extends Field {
 TimestampCorrelationFractionalSystemTimestampField({int size = 0, bool growable = true})
      : super(
            name: 'fractional_system_timestamp',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 32768,
            size: size,
            units: 's',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 2;
}
class TimestampCorrelationLocalTimestampField extends Field {
 TimestampCorrelationLocalTimestampField({int size = 0, bool growable = true})
      : super(
            name: 'local_timestamp',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 's',
            mainTypeName: 'local_date_time',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 3;
}
class TimestampCorrelationTimestampMsField extends Field {
 TimestampCorrelationTimestampMsField({int size = 0, bool growable = true})
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

  static const ID = 4;
}
class TimestampCorrelationSystemTimestampMsField extends Field {
 TimestampCorrelationSystemTimestampMsField({int size = 0, bool growable = true})
      : super(
            name: 'system_timestamp_ms',
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

  static const ID = 5;
}