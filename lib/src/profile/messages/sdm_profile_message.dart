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

class SdmProfileMessage extends DataMessage {

   SdmProfileMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: SdmProfileMessage.NAME,
            globalId: SdmProfileMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              MessageIndexField(
                  size: definitionMessage?.getFieldDefinition(MessageIndexField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SdmProfileEnabledField(
                  size: definitionMessage?.getFieldDefinition(SdmProfileEnabledField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SdmProfileSdmAntIdField(
                  size: definitionMessage?.getFieldDefinition(SdmProfileSdmAntIdField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SdmProfileSdmCalFactorField(
                  size: definitionMessage?.getFieldDefinition(SdmProfileSdmCalFactorField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SdmProfileOdometerField(
                  size: definitionMessage?.getFieldDefinition(SdmProfileOdometerField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SdmProfileSpeedSourceField(
                  size: definitionMessage?.getFieldDefinition(SdmProfileSpeedSourceField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SdmProfileSdmAntIdTransTypeField(
                  size: definitionMessage?.getFieldDefinition(SdmProfileSdmAntIdTransTypeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SdmProfileOdometerRolloverField(
                  size: definitionMessage?.getFieldDefinition(SdmProfileOdometerRolloverField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 5;
  static const NAME = 'sdm_profile';

  final bool growable;

  static SdmProfileMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = SdmProfileMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }


  int? get messageIndex {
     final field = getField(MessageIndexField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set messageIndex(int? value) {
    final field = getField(MessageIndexField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get enabled {
     final field = getField(SdmProfileEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set enabled(bool? value) {
    final field = getField(SdmProfileEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get sdmAntId {
     final field = getField(SdmProfileSdmAntIdField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set sdmAntId(int? value) {
    final field = getField(SdmProfileSdmAntIdField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get sdmCalFactor {
     final field = getField(SdmProfileSdmCalFactorField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set sdmCalFactor(double? value) {
    final field = getField(SdmProfileSdmCalFactorField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get odometer {
     final field = getField(SdmProfileOdometerField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set odometer(double? value) {
    final field = getField(SdmProfileOdometerField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get speedSource {
     final field = getField(SdmProfileSpeedSourceField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set speedSource(bool? value) {
    final field = getField(SdmProfileSpeedSourceField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get sdmAntIdTransType {
     final field = getField(SdmProfileSdmAntIdTransTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set sdmAntIdTransType(int? value) {
    final field = getField(SdmProfileSdmAntIdTransTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get odometerRollover {
     final field = getField(SdmProfileOdometerRolloverField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set odometerRollover(int? value) {
    final field = getField(SdmProfileOdometerRolloverField.ID);

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



class SdmProfileEnabledField extends Field {
 SdmProfileEnabledField({int size = 0, bool growable = true})
      : super(
            name: 'enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 0;
}
class SdmProfileSdmAntIdField extends Field {
 SdmProfileSdmAntIdField({int size = 0, bool growable = true})
      : super(
            name: 'sdm_ant_id',
            id: ID,
            type: BaseType.UINT16Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 1;
}
class SdmProfileSdmCalFactorField extends Field {
 SdmProfileSdmCalFactorField({int size = 0, bool growable = true})
      : super(
            name: 'sdm_cal_factor',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 10,
            size: size,
            units: '%',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 2;
}
class SdmProfileOdometerField extends Field {
 SdmProfileOdometerField({int size = 0, bool growable = true})
      : super(
            name: 'odometer',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 100,
            size: size,
            units: 'm',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 3;
}
class SdmProfileSpeedSourceField extends Field {
 SdmProfileSpeedSourceField({int size = 0, bool growable = true})
      : super(
            name: 'speed_source',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 4;
}
class SdmProfileSdmAntIdTransTypeField extends Field {
 SdmProfileSdmAntIdTransTypeField({int size = 0, bool growable = true})
      : super(
            name: 'sdm_ant_id_trans_type',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 5;
}
class SdmProfileOdometerRolloverField extends Field {
 SdmProfileOdometerRolloverField({int size = 0, bool growable = true})
      : super(
            name: 'odometer_rollover',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 7;
}