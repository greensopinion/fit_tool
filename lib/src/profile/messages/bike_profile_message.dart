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

class BikeProfileMessage extends DataMessage {

   BikeProfileMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: BikeProfileMessage.NAME,
            globalId: BikeProfileMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              MessageIndexField(
                  size: definitionMessage?.getFieldDefinition(MessageIndexField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileNameField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileNameField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileSportField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileSportField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileSubSportField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileSubSportField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileOdometerField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileOdometerField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikeSpdAntIdField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikeSpdAntIdField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikeCadAntIdField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikeCadAntIdField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikeSpdcadAntIdField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikeSpdcadAntIdField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikePowerAntIdField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikePowerAntIdField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileCustomWheelsizeField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileCustomWheelsizeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileAutoWheelsizeField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileAutoWheelsizeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikeWeightField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikeWeightField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfilePowerCalFactorField(
                  size: definitionMessage?.getFieldDefinition(BikeProfilePowerCalFactorField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileAutoWheelCalField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileAutoWheelCalField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileAutoPowerZeroField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileAutoPowerZeroField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileIdField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileIdField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileSpdEnabledField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileSpdEnabledField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileCadEnabledField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileCadEnabledField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileSpdcadEnabledField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileSpdcadEnabledField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfilePowerEnabledField(
                  size: definitionMessage?.getFieldDefinition(BikeProfilePowerEnabledField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileCrankLengthField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileCrankLengthField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileEnabledField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileEnabledField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikeSpdAntIdTransTypeField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikeSpdAntIdTransTypeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikeCadAntIdTransTypeField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikeCadAntIdTransTypeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikeSpdcadAntIdTransTypeField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikeSpdcadAntIdTransTypeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileBikePowerAntIdTransTypeField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileBikePowerAntIdTransTypeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileOdometerRolloverField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileOdometerRolloverField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileFrontGearNumField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileFrontGearNumField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileFrontGearField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileFrontGearField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileRearGearNumField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileRearGearNumField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileRearGearField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileRearGearField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              BikeProfileShimanoDi2EnabledField(
                  size: definitionMessage?.getFieldDefinition(BikeProfileShimanoDi2EnabledField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 6;
  static const NAME = 'bike_profile';

  final bool growable;

  static BikeProfileMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = BikeProfileMessage(definitionMessage: definitionMessage);
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
  String? get bikeProfileName {
     final field = getField(BikeProfileNameField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeProfileName(String? value) {
    final field = getField(BikeProfileNameField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  Sport? get sport {
     final field = getField(BikeProfileSportField.ID);
 if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return SportExt.fromValue(value);
    } else {
      return null;
    }
  }
   set sport(Sport? value) {
    final field = getField(BikeProfileSportField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }
  SubSport? get subSport {
     final field = getField(BikeProfileSubSportField.ID);
 if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return SubSportExt.fromValue(value);
    } else {
      return null;
    }
  }
   set subSport(SubSport? value) {
    final field = getField(BikeProfileSubSportField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }
  double? get odometer {
     final field = getField(BikeProfileOdometerField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set odometer(double? value) {
    final field = getField(BikeProfileOdometerField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikeSpdAntId {
     final field = getField(BikeProfileBikeSpdAntIdField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeSpdAntId(int? value) {
    final field = getField(BikeProfileBikeSpdAntIdField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikeCadAntId {
     final field = getField(BikeProfileBikeCadAntIdField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeCadAntId(int? value) {
    final field = getField(BikeProfileBikeCadAntIdField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikeSpdcadAntId {
     final field = getField(BikeProfileBikeSpdcadAntIdField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeSpdcadAntId(int? value) {
    final field = getField(BikeProfileBikeSpdcadAntIdField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikePowerAntId {
     final field = getField(BikeProfileBikePowerAntIdField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikePowerAntId(int? value) {
    final field = getField(BikeProfileBikePowerAntIdField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get customWheelsize {
     final field = getField(BikeProfileCustomWheelsizeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set customWheelsize(double? value) {
    final field = getField(BikeProfileCustomWheelsizeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get autoWheelsize {
     final field = getField(BikeProfileAutoWheelsizeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set autoWheelsize(double? value) {
    final field = getField(BikeProfileAutoWheelsizeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get bikeWeight {
     final field = getField(BikeProfileBikeWeightField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeWeight(double? value) {
    final field = getField(BikeProfileBikeWeightField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get powerCalFactor {
     final field = getField(BikeProfilePowerCalFactorField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set powerCalFactor(double? value) {
    final field = getField(BikeProfilePowerCalFactorField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get autoWheelCal {
     final field = getField(BikeProfileAutoWheelCalField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set autoWheelCal(bool? value) {
    final field = getField(BikeProfileAutoWheelCalField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get autoPowerZero {
     final field = getField(BikeProfileAutoPowerZeroField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set autoPowerZero(bool? value) {
    final field = getField(BikeProfileAutoPowerZeroField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get id {
     final field = getField(BikeProfileIdField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set id(int? value) {
    final field = getField(BikeProfileIdField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get spdEnabled {
     final field = getField(BikeProfileSpdEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set spdEnabled(bool? value) {
    final field = getField(BikeProfileSpdEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get cadEnabled {
     final field = getField(BikeProfileCadEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set cadEnabled(bool? value) {
    final field = getField(BikeProfileCadEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get spdcadEnabled {
     final field = getField(BikeProfileSpdcadEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set spdcadEnabled(bool? value) {
    final field = getField(BikeProfileSpdcadEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get powerEnabled {
     final field = getField(BikeProfilePowerEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set powerEnabled(bool? value) {
    final field = getField(BikeProfilePowerEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  double? get crankLength {
     final field = getField(BikeProfileCrankLengthField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set crankLength(double? value) {
    final field = getField(BikeProfileCrankLengthField.ID);

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
     final field = getField(BikeProfileEnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set enabled(bool? value) {
    final field = getField(BikeProfileEnabledField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikeSpdAntIdTransType {
     final field = getField(BikeProfileBikeSpdAntIdTransTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeSpdAntIdTransType(int? value) {
    final field = getField(BikeProfileBikeSpdAntIdTransTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikeCadAntIdTransType {
     final field = getField(BikeProfileBikeCadAntIdTransTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeCadAntIdTransType(int? value) {
    final field = getField(BikeProfileBikeCadAntIdTransTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikeSpdcadAntIdTransType {
     final field = getField(BikeProfileBikeSpdcadAntIdTransTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikeSpdcadAntIdTransType(int? value) {
    final field = getField(BikeProfileBikeSpdcadAntIdTransTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get bikePowerAntIdTransType {
     final field = getField(BikeProfileBikePowerAntIdTransTypeField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set bikePowerAntIdTransType(int? value) {
    final field = getField(BikeProfileBikePowerAntIdTransTypeField.ID);

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
     final field = getField(BikeProfileOdometerRolloverField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set odometerRollover(int? value) {
    final field = getField(BikeProfileOdometerRolloverField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get frontGearNum {
     final field = getField(BikeProfileFrontGearNumField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set frontGearNum(int? value) {
    final field = getField(BikeProfileFrontGearNumField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get frontGear {
     final field = getField(BikeProfileFrontGearField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set frontGear(int? value) {
    final field = getField(BikeProfileFrontGearField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get rearGearNum {
     final field = getField(BikeProfileRearGearNumField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set rearGearNum(int? value) {
    final field = getField(BikeProfileRearGearNumField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get rearGear {
     final field = getField(BikeProfileRearGearField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set rearGear(int? value) {
    final field = getField(BikeProfileRearGearField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  bool? get shimanoDi2Enabled {
     final field = getField(BikeProfileShimanoDi2EnabledField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set shimanoDi2Enabled(bool? value) {
    final field = getField(BikeProfileShimanoDi2EnabledField.ID);

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



class BikeProfileNameField extends Field {
 BikeProfileNameField({int size = 0, bool growable = true})
      : super(
            name: 'name',
            id: ID,
            type: BaseType.STRING,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 0;
}
class BikeProfileSportField extends Field {
 BikeProfileSportField({int size = 0, bool growable = true})
      : super(
            name: 'sport',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 1;
}
class BikeProfileSubSportField extends Field {
 BikeProfileSubSportField({int size = 0, bool growable = true})
      : super(
            name: 'sub_sport',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 2;
}
class BikeProfileOdometerField extends Field {
 BikeProfileOdometerField({int size = 0, bool growable = true})
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
class BikeProfileBikeSpdAntIdField extends Field {
 BikeProfileBikeSpdAntIdField({int size = 0, bool growable = true})
      : super(
            name: 'bike_spd_ant_id',
            id: ID,
            type: BaseType.UINT16Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 4;
}
class BikeProfileBikeCadAntIdField extends Field {
 BikeProfileBikeCadAntIdField({int size = 0, bool growable = true})
      : super(
            name: 'bike_cad_ant_id',
            id: ID,
            type: BaseType.UINT16Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 5;
}
class BikeProfileBikeSpdcadAntIdField extends Field {
 BikeProfileBikeSpdcadAntIdField({int size = 0, bool growable = true})
      : super(
            name: 'bike_spdcad_ant_id',
            id: ID,
            type: BaseType.UINT16Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 6;
}
class BikeProfileBikePowerAntIdField extends Field {
 BikeProfileBikePowerAntIdField({int size = 0, bool growable = true})
      : super(
            name: 'bike_power_ant_id',
            id: ID,
            type: BaseType.UINT16Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 7;
}
class BikeProfileCustomWheelsizeField extends Field {
 BikeProfileCustomWheelsizeField({int size = 0, bool growable = true})
      : super(
            name: 'custom_wheelsize',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1000,
            size: size,
            units: 'm',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 8;
}
class BikeProfileAutoWheelsizeField extends Field {
 BikeProfileAutoWheelsizeField({int size = 0, bool growable = true})
      : super(
            name: 'auto_wheelsize',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1000,
            size: size,
            units: 'm',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 9;
}
class BikeProfileBikeWeightField extends Field {
 BikeProfileBikeWeightField({int size = 0, bool growable = true})
      : super(
            name: 'bike_weight',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 10,
            size: size,
            units: 'kg',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 10;
}
class BikeProfilePowerCalFactorField extends Field {
 BikeProfilePowerCalFactorField({int size = 0, bool growable = true})
      : super(
            name: 'power_cal_factor',
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

  static const ID = 11;
}
class BikeProfileAutoWheelCalField extends Field {
 BikeProfileAutoWheelCalField({int size = 0, bool growable = true})
      : super(
            name: 'auto_wheel_cal',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 12;
}
class BikeProfileAutoPowerZeroField extends Field {
 BikeProfileAutoPowerZeroField({int size = 0, bool growable = true})
      : super(
            name: 'auto_power_zero',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 13;
}
class BikeProfileIdField extends Field {
 BikeProfileIdField({int size = 0, bool growable = true})
      : super(
            name: 'id',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 14;
}
class BikeProfileSpdEnabledField extends Field {
 BikeProfileSpdEnabledField({int size = 0, bool growable = true})
      : super(
            name: 'spd_enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 15;
}
class BikeProfileCadEnabledField extends Field {
 BikeProfileCadEnabledField({int size = 0, bool growable = true})
      : super(
            name: 'cad_enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 16;
}
class BikeProfileSpdcadEnabledField extends Field {
 BikeProfileSpdcadEnabledField({int size = 0, bool growable = true})
      : super(
            name: 'spdcad_enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 17;
}
class BikeProfilePowerEnabledField extends Field {
 BikeProfilePowerEnabledField({int size = 0, bool growable = true})
      : super(
            name: 'power_enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 18;
}
class BikeProfileCrankLengthField extends Field {
 BikeProfileCrankLengthField({int size = 0, bool growable = true})
      : super(
            name: 'crank_length',
            id: ID,
            type: BaseType.UINT8,
            offset: -110,
            scale: 2,
            size: size,
            units: 'mm',
            mainTypeName: '',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 19;
}
class BikeProfileEnabledField extends Field {
 BikeProfileEnabledField({int size = 0, bool growable = true})
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

  static const ID = 20;
}
class BikeProfileBikeSpdAntIdTransTypeField extends Field {
 BikeProfileBikeSpdAntIdTransTypeField({int size = 0, bool growable = true})
      : super(
            name: 'bike_spd_ant_id_trans_type',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 21;
}
class BikeProfileBikeCadAntIdTransTypeField extends Field {
 BikeProfileBikeCadAntIdTransTypeField({int size = 0, bool growable = true})
      : super(
            name: 'bike_cad_ant_id_trans_type',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 22;
}
class BikeProfileBikeSpdcadAntIdTransTypeField extends Field {
 BikeProfileBikeSpdcadAntIdTransTypeField({int size = 0, bool growable = true})
      : super(
            name: 'bike_spdcad_ant_id_trans_type',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 23;
}
class BikeProfileBikePowerAntIdTransTypeField extends Field {
 BikeProfileBikePowerAntIdTransTypeField({int size = 0, bool growable = true})
      : super(
            name: 'bike_power_ant_id_trans_type',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 24;
}
class BikeProfileOdometerRolloverField extends Field {
 BikeProfileOdometerRolloverField({int size = 0, bool growable = true})
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

  static const ID = 37;
}
class BikeProfileFrontGearNumField extends Field {
 BikeProfileFrontGearNumField({int size = 0, bool growable = true})
      : super(
            name: 'front_gear_num',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 38;
}
class BikeProfileFrontGearField extends Field {
 BikeProfileFrontGearField({int size = 0, bool growable = true})
      : super(
            name: 'front_gear',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 39;
}
class BikeProfileRearGearNumField extends Field {
 BikeProfileRearGearNumField({int size = 0, bool growable = true})
      : super(
            name: 'rear_gear_num',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 40;
}
class BikeProfileRearGearField extends Field {
 BikeProfileRearGearField({int size = 0, bool growable = true})
      : super(
            name: 'rear_gear',
            id: ID,
            type: BaseType.UINT8Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 41;
}
class BikeProfileShimanoDi2EnabledField extends Field {
 BikeProfileShimanoDi2EnabledField({int size = 0, bool growable = true})
      : super(
            name: 'shimano_di2_enabled',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 44;
}