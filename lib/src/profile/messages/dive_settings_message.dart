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

class DiveSettingsMessage extends DataMessage {
  DiveSettingsMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: DiveSettingsMessage.NAME,
            globalId: DiveSettingsMessage.ID,
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
              DiveSettingsNameField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsNameField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsModelField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsModelField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsGfLowField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsGfLowField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsGfHighField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsGfHighField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsWaterTypeField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsWaterTypeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsWaterDensityField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsWaterDensityField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsPo2WarnField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsPo2WarnField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsPo2CriticalField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsPo2CriticalField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsPo2DecoField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsPo2DecoField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsSafetyStopEnabledField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsSafetyStopEnabledField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsBottomDepthField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsBottomDepthField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsBottomTimeField(
                  size: definitionMessage
                          ?.getFieldDefinition(DiveSettingsBottomTimeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsApneaCountdownEnabledField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsApneaCountdownEnabledField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsApneaCountdownTimeField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsApneaCountdownTimeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsBacklightModeField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsBacklightModeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsBacklightBrightnessField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsBacklightBrightnessField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsBacklightTimeoutField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsBacklightTimeoutField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsRepeatDiveIntervalField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsRepeatDiveIntervalField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsSafetyStopTimeField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsSafetyStopTimeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsHeartRateSourceTypeField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsHeartRateSourceTypeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              DiveSettingsHeartRateSourceField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              DiveSettingsHeartRateSourceField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 258;
  static const NAME = 'dive_settings';

  final bool growable;

  static DiveSettingsMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = DiveSettingsMessage(definitionMessage: definitionMessage);
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

  String? get diveSettingsName {
    final field = getField(DiveSettingsNameField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set diveSettingsName(String? value) {
    final field = getField(DiveSettingsNameField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  TissueModelType? get model {
    final field = getField(DiveSettingsModelField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return TissueModelTypeExt.fromValue(value);
    } else {
      return null;
    }
  }

  set model(TissueModelType? value) {
    final field = getField(DiveSettingsModelField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }

  int? get gfLow {
    final field = getField(DiveSettingsGfLowField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set gfLow(int? value) {
    final field = getField(DiveSettingsGfLowField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get gfHigh {
    final field = getField(DiveSettingsGfHighField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set gfHigh(int? value) {
    final field = getField(DiveSettingsGfHighField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  WaterType? get waterType {
    final field = getField(DiveSettingsWaterTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return WaterTypeExt.fromValue(value);
    } else {
      return null;
    }
  }

  set waterType(WaterType? value) {
    final field = getField(DiveSettingsWaterTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }

  double? get waterDensity {
    final field = getField(DiveSettingsWaterDensityField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set waterDensity(double? value) {
    final field = getField(DiveSettingsWaterDensityField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get po2Warn {
    final field = getField(DiveSettingsPo2WarnField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set po2Warn(double? value) {
    final field = getField(DiveSettingsPo2WarnField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get po2Critical {
    final field = getField(DiveSettingsPo2CriticalField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set po2Critical(double? value) {
    final field = getField(DiveSettingsPo2CriticalField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get po2Deco {
    final field = getField(DiveSettingsPo2DecoField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set po2Deco(double? value) {
    final field = getField(DiveSettingsPo2DecoField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  bool? get safetyStopEnabled {
    final field = getField(DiveSettingsSafetyStopEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set safetyStopEnabled(bool? value) {
    final field = getField(DiveSettingsSafetyStopEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get bottomDepth {
    final field = getField(DiveSettingsBottomDepthField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set bottomDepth(double? value) {
    final field = getField(DiveSettingsBottomDepthField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get bottomTime {
    final field = getField(DiveSettingsBottomTimeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set bottomTime(int? value) {
    final field = getField(DiveSettingsBottomTimeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  bool? get apneaCountdownEnabled {
    final field = getField(DiveSettingsApneaCountdownEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set apneaCountdownEnabled(bool? value) {
    final field = getField(DiveSettingsApneaCountdownEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get apneaCountdownTime {
    final field = getField(DiveSettingsApneaCountdownTimeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set apneaCountdownTime(int? value) {
    final field = getField(DiveSettingsApneaCountdownTimeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  DiveBacklightMode? get backlightMode {
    final field = getField(DiveSettingsBacklightModeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return DiveBacklightModeExt.fromValue(value);
    } else {
      return null;
    }
  }

  set backlightMode(DiveBacklightMode? value) {
    final field = getField(DiveSettingsBacklightModeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }

  int? get backlightBrightness {
    final field = getField(DiveSettingsBacklightBrightnessField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set backlightBrightness(int? value) {
    final field = getField(DiveSettingsBacklightBrightnessField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get backlightTimeout {
    final field = getField(DiveSettingsBacklightTimeoutField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set backlightTimeout(int? value) {
    final field = getField(DiveSettingsBacklightTimeoutField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get repeatDiveInterval {
    final field = getField(DiveSettingsRepeatDiveIntervalField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set repeatDiveInterval(int? value) {
    final field = getField(DiveSettingsRepeatDiveIntervalField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get safetyStopTime {
    final field = getField(DiveSettingsSafetyStopTimeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set safetyStopTime(int? value) {
    final field = getField(DiveSettingsSafetyStopTimeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  SourceType? get heartRateSourceType {
    final field = getField(DiveSettingsHeartRateSourceTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return SourceTypeExt.fromValue(value);
    } else {
      return null;
    }
  }

  set heartRateSourceType(SourceType? value) {
    final field = getField(DiveSettingsHeartRateSourceTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }

  int? get heartRateSource {
    final field = getField(DiveSettingsHeartRateSourceField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set heartRateSource(int? value) {
    final field = getField(DiveSettingsHeartRateSourceField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get heartRateAntplusDeviceType {
    final field = getField(DiveSettingsHeartRateSourceField.ID);
    final typeField = getField(DiveSettingsHeartRateSourceTypeField.ID);

    final isSubFieldValid =
        typeField != null && [1].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set heartRateAntplusDeviceType(int? value) {
    final field = getField(DiveSettingsHeartRateSourceField.ID);
    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get heartRateLocalDeviceType {
    final field = getField(DiveSettingsHeartRateSourceField.ID);
    final typeField = getField(DiveSettingsHeartRateSourceTypeField.ID);

    final isSubFieldValid =
        typeField != null && [5].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set heartRateLocalDeviceType(int? value) {
    final field = getField(DiveSettingsHeartRateSourceField.ID);
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

class DiveSettingsNameField extends Field {
  DiveSettingsNameField({int size = 0, bool growable = true})
      : super(
            name: 'name',
            id: ID,
            type: BaseType.STRING,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 0;
}

class DiveSettingsModelField extends Field {
  DiveSettingsModelField({int size = 0, bool growable = true})
      : super(
            name: 'model',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 1;
}

class DiveSettingsGfLowField extends Field {
  DiveSettingsGfLowField({int size = 0, bool growable = true})
      : super(
            name: 'gf_low',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            units: 'percent',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 2;
}

class DiveSettingsGfHighField extends Field {
  DiveSettingsGfHighField({int size = 0, bool growable = true})
      : super(
            name: 'gf_high',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            units: 'percent',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 3;
}

class DiveSettingsWaterTypeField extends Field {
  DiveSettingsWaterTypeField({int size = 0, bool growable = true})
      : super(
            name: 'water_type',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 4;
}

class DiveSettingsWaterDensityField extends Field {
  DiveSettingsWaterDensityField({int size = 0, bool growable = true})
      : super(
            name: 'water_density',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            units: 'kg/m^3',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 5;
}

class DiveSettingsPo2WarnField extends Field {
  DiveSettingsPo2WarnField({int size = 0, bool growable = true})
      : super(
            name: 'po2_warn',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 100,
            size: size,
            units: 'percent',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 6;
}

class DiveSettingsPo2CriticalField extends Field {
  DiveSettingsPo2CriticalField({int size = 0, bool growable = true})
      : super(
            name: 'po2_critical',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 100,
            size: size,
            units: 'percent',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 7;
}

class DiveSettingsPo2DecoField extends Field {
  DiveSettingsPo2DecoField({int size = 0, bool growable = true})
      : super(
            name: 'po2_deco',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 100,
            size: size,
            units: 'percent',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 8;
}

class DiveSettingsSafetyStopEnabledField extends Field {
  DiveSettingsSafetyStopEnabledField({int size = 0, bool growable = true})
      : super(
            name: 'safety_stop_enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 9;
}

class DiveSettingsBottomDepthField extends Field {
  DiveSettingsBottomDepthField({int size = 0, bool growable = true})
      : super(
            name: 'bottom_depth',
            id: ID,
            type: BaseType.FLOAT32,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 10;
}

class DiveSettingsBottomTimeField extends Field {
  DiveSettingsBottomTimeField({int size = 0, bool growable = true})
      : super(
            name: 'bottom_time',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 11;
}

class DiveSettingsApneaCountdownEnabledField extends Field {
  DiveSettingsApneaCountdownEnabledField({int size = 0, bool growable = true})
      : super(
            name: 'apnea_countdown_enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 12;
}

class DiveSettingsApneaCountdownTimeField extends Field {
  DiveSettingsApneaCountdownTimeField({int size = 0, bool growable = true})
      : super(
            name: 'apnea_countdown_time',
            id: ID,
            type: BaseType.UINT32,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 13;
}

class DiveSettingsBacklightModeField extends Field {
  DiveSettingsBacklightModeField({int size = 0, bool growable = true})
      : super(
            name: 'backlight_mode',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 14;
}

class DiveSettingsBacklightBrightnessField extends Field {
  DiveSettingsBacklightBrightnessField({int size = 0, bool growable = true})
      : super(
            name: 'backlight_brightness',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 15;
}

class DiveSettingsBacklightTimeoutField extends Field {
  DiveSettingsBacklightTimeoutField({int size = 0, bool growable = true})
      : super(
            name: 'backlight_timeout',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 16;
}

class DiveSettingsRepeatDiveIntervalField extends Field {
  DiveSettingsRepeatDiveIntervalField({int size = 0, bool growable = true})
      : super(
            name: 'repeat_dive_interval',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 's',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 17;
}

class DiveSettingsSafetyStopTimeField extends Field {
  DiveSettingsSafetyStopTimeField({int size = 0, bool growable = true})
      : super(
            name: 'safety_stop_time',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            units: 's',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 18;
}

class DiveSettingsHeartRateSourceTypeField extends Field {
  DiveSettingsHeartRateSourceTypeField({int size = 0, bool growable = true})
      : super(
            name: 'heart_rate_source_type',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 19;
}

class DiveSettingsHeartRateSourceField extends Field {
  DiveSettingsHeartRateSourceField({int size = 0, bool growable = true})
      : super(
            name: 'heart_rate_source',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
              SubField(
                  name: 'heart_rate_antplus_device_type',
                  type: BaseType.UINT8,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                    DiveSettingsHeartRateSourceTypeField.ID: [1]
                  }),
              SubField(
                  name: 'heart_rate_local_device_type',
                  type: BaseType.UINT8,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                    DiveSettingsHeartRateSourceTypeField.ID: [5]
                  })
            ]);

  static const ID = 20;
}
