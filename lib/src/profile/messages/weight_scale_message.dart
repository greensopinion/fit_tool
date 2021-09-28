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

class WeightScaleMessage extends DataMessage {
  WeightScaleMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: WeightScaleMessage.NAME,
            globalId: WeightScaleMessage.ID,
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
              WeightScaleWeightField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeightScaleWeightField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScalePercentFatField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeightScalePercentFatField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScalePercentHydrationField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WeightScalePercentHydrationField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleVisceralFatMassField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WeightScaleVisceralFatMassField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleBoneMassField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeightScaleBoneMassField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleMuscleMassField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeightScaleMuscleMassField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleBasalMetField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeightScaleBasalMetField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScalePhysiqueRatingField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WeightScalePhysiqueRatingField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleActiveMetField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeightScaleActiveMetField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleMetabolicAgeField(
                  size: definitionMessage
                          ?.getFieldDefinition(WeightScaleMetabolicAgeField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleVisceralFatRatingField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WeightScaleVisceralFatRatingField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WeightScaleUserProfileIndexField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WeightScaleUserProfileIndexField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 30;
  static const NAME = 'weight_scale';

  final bool growable;

  static WeightScaleMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = WeightScaleMessage(definitionMessage: definitionMessage);
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

  double? get weight {
    final field = getField(WeightScaleWeightField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set weight(double? value) {
    final field = getField(WeightScaleWeightField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get percentFat {
    final field = getField(WeightScalePercentFatField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set percentFat(double? value) {
    final field = getField(WeightScalePercentFatField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get percentHydration {
    final field = getField(WeightScalePercentHydrationField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set percentHydration(double? value) {
    final field = getField(WeightScalePercentHydrationField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get visceralFatMass {
    final field = getField(WeightScaleVisceralFatMassField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set visceralFatMass(double? value) {
    final field = getField(WeightScaleVisceralFatMassField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get boneMass {
    final field = getField(WeightScaleBoneMassField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set boneMass(double? value) {
    final field = getField(WeightScaleBoneMassField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get muscleMass {
    final field = getField(WeightScaleMuscleMassField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set muscleMass(double? value) {
    final field = getField(WeightScaleMuscleMassField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get basalMet {
    final field = getField(WeightScaleBasalMetField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set basalMet(double? value) {
    final field = getField(WeightScaleBasalMetField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get physiqueRating {
    final field = getField(WeightScalePhysiqueRatingField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set physiqueRating(int? value) {
    final field = getField(WeightScalePhysiqueRatingField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get activeMet {
    final field = getField(WeightScaleActiveMetField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set activeMet(double? value) {
    final field = getField(WeightScaleActiveMetField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get metabolicAge {
    final field = getField(WeightScaleMetabolicAgeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set metabolicAge(int? value) {
    final field = getField(WeightScaleMetabolicAgeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get visceralFatRating {
    final field = getField(WeightScaleVisceralFatRatingField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set visceralFatRating(int? value) {
    final field = getField(WeightScaleVisceralFatRatingField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get userProfileIndex {
    final field = getField(WeightScaleUserProfileIndexField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set userProfileIndex(int? value) {
    final field = getField(WeightScaleUserProfileIndexField.ID);

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

class WeightScaleWeightField extends Field {
  WeightScaleWeightField({int size = 0, bool growable = true})
      : super(
            name: 'weight',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 100,
            size: size,
            units: 'kg',
            mainTypeName: 'weight',
            growable: growable,
            subFields: []);

  static const ID = 0;
}

class WeightScalePercentFatField extends Field {
  WeightScalePercentFatField({int size = 0, bool growable = true})
      : super(
            name: 'percent_fat',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 100,
            size: size,
            units: '%',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 1;
}

class WeightScalePercentHydrationField extends Field {
  WeightScalePercentHydrationField({int size = 0, bool growable = true})
      : super(
            name: 'percent_hydration',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 100,
            size: size,
            units: '%',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 2;
}

class WeightScaleVisceralFatMassField extends Field {
  WeightScaleVisceralFatMassField({int size = 0, bool growable = true})
      : super(
            name: 'visceral_fat_mass',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 100,
            size: size,
            units: 'kg',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 3;
}

class WeightScaleBoneMassField extends Field {
  WeightScaleBoneMassField({int size = 0, bool growable = true})
      : super(
            name: 'bone_mass',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 100,
            size: size,
            units: 'kg',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 4;
}

class WeightScaleMuscleMassField extends Field {
  WeightScaleMuscleMassField({int size = 0, bool growable = true})
      : super(
            name: 'muscle_mass',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 100,
            size: size,
            units: 'kg',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 5;
}

class WeightScaleBasalMetField extends Field {
  WeightScaleBasalMetField({int size = 0, bool growable = true})
      : super(
            name: 'basal_met',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 4,
            size: size,
            units: 'kcal/day',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 7;
}

class WeightScalePhysiqueRatingField extends Field {
  WeightScalePhysiqueRatingField({int size = 0, bool growable = true})
      : super(
            name: 'physique_rating',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 8;
}

class WeightScaleActiveMetField extends Field {
  WeightScaleActiveMetField({int size = 0, bool growable = true})
      : super(
            name: 'active_met',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 4,
            size: size,
            units: 'kcal/day',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 9;
}

class WeightScaleMetabolicAgeField extends Field {
  WeightScaleMetabolicAgeField({int size = 0, bool growable = true})
      : super(
            name: 'metabolic_age',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            units: 'years',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 10;
}

class WeightScaleVisceralFatRatingField extends Field {
  WeightScaleVisceralFatRatingField({int size = 0, bool growable = true})
      : super(
            name: 'visceral_fat_rating',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 11;
}

class WeightScaleUserProfileIndexField extends Field {
  WeightScaleUserProfileIndexField({int size = 0, bool growable = true})
      : super(
            name: 'user_profile_index',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 12;
}
