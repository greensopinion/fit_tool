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

class WeatherAlertMessage extends DataMessage {
  WeatherAlertMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: WeatherAlertMessage.NAME,
            globalId: WeatherAlertMessage.ID,
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
              WeatherAlertReportIdField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeatherAlertReportIdField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeatherAlertIssueTimeField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeatherAlertIssueTimeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeatherAlertExpireTimeField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeatherAlertExpireTimeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeatherAlertSeverityField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeatherAlertSeverityField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeatherAlertTypeField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeatherAlertTypeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 129;
  static const NAME = 'weather_alert';

  final bool growable;

  static WeatherAlertMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = WeatherAlertMessage(definitionMessage: definitionMessage);
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

  String? get reportId {
    final field = getField(WeatherAlertReportIdField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set reportId(String? value) {
    final field = getField(WeatherAlertReportIdField.ID);

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
  int? get issueTime {
    final field = getField(WeatherAlertIssueTimeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
  set issueTime(int? value) {
    final field = getField(WeatherAlertIssueTimeField.ID);

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
  int? get expireTime {
    final field = getField(WeatherAlertExpireTimeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
  set expireTime(int? value) {
    final field = getField(WeatherAlertExpireTimeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  WeatherSeverity? get severity {
    final field = getField(WeatherAlertSeverityField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return WeatherSeverityExt.fromValue(value);
    } else {
      return null;
    }
  }

  set severity(WeatherSeverity? value) {
    final field = getField(WeatherAlertSeverityField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }

  WeatherSevereType? get type {
    final field = getField(WeatherAlertTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return WeatherSevereTypeExt.fromValue(value);
    } else {
      return null;
    }
  }

  set type(WeatherSevereType? value) {
    final field = getField(WeatherAlertTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }
}

class WeatherAlertReportIdField extends Field {
  WeatherAlertReportIdField({int size = 0, bool growable = true})
      : super(
            name: 'report_id',
            id: ID,
            type: BaseType.STRING,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 0;
}

class WeatherAlertIssueTimeField extends Field {
  WeatherAlertIssueTimeField({int size = 0, bool growable = true})
      : super(
            name: 'issue_time',
            id: ID,
            type: BaseType.UINT32,
            offset: -631065600000,
            scale: 0.001,
            size: size,
            units: 'ms',
            mainTypeName: 'date_time',
            growable: growable,
            subFields: []);

  static const ID = 1;
}

class WeatherAlertExpireTimeField extends Field {
  WeatherAlertExpireTimeField({int size = 0, bool growable = true})
      : super(
            name: 'expire_time',
            id: ID,
            type: BaseType.UINT32,
            offset: -631065600000,
            scale: 0.001,
            size: size,
            units: 'ms',
            mainTypeName: 'date_time',
            growable: growable,
            subFields: []);

  static const ID = 2;
}

class WeatherAlertSeverityField extends Field {
  WeatherAlertSeverityField({int size = 0, bool growable = true})
      : super(
            name: 'severity',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 3;
}

class WeatherAlertTypeField extends Field {
  WeatherAlertTypeField({int size = 0, bool growable = true})
      : super(
            name: 'type',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 4;
}
