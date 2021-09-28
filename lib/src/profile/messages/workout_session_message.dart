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

class WorkoutSessionMessage extends DataMessage {
  WorkoutSessionMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: WorkoutSessionMessage.NAME,
            globalId: WorkoutSessionMessage.ID,
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
              WorkoutSessionSportField(
                  size: definitionMessage
                          ?.getFieldDefinition(WorkoutSessionSportField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WorkoutSessionSubSportField(
                  size: definitionMessage
                          ?.getFieldDefinition(WorkoutSessionSubSportField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WorkoutSessionNumValidStepsField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WorkoutSessionNumValidStepsField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WorkoutSessionFirstStepIndexField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WorkoutSessionFirstStepIndexField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WorkoutSessionPoolLengthField(
                  size: definitionMessage
                          ?.getFieldDefinition(WorkoutSessionPoolLengthField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              WorkoutSessionPoolLengthUnitField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              WorkoutSessionPoolLengthUnitField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 158;
  static const NAME = 'workout_session';

  final bool growable;

  static WorkoutSessionMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = WorkoutSessionMessage(definitionMessage: definitionMessage);
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

  Sport? get sport {
    final field = getField(WorkoutSessionSportField.ID);
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
    final field = getField(WorkoutSessionSportField.ID);

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
    final field = getField(WorkoutSessionSubSportField.ID);
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
    final field = getField(WorkoutSessionSubSportField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }

  int? get numValidSteps {
    final field = getField(WorkoutSessionNumValidStepsField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set numValidSteps(int? value) {
    final field = getField(WorkoutSessionNumValidStepsField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get firstStepIndex {
    final field = getField(WorkoutSessionFirstStepIndexField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set firstStepIndex(int? value) {
    final field = getField(WorkoutSessionFirstStepIndexField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  double? get poolLength {
    final field = getField(WorkoutSessionPoolLengthField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  set poolLength(double? value) {
    final field = getField(WorkoutSessionPoolLengthField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  DisplayMeasure? get poolLengthUnit {
    final field = getField(WorkoutSessionPoolLengthUnitField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return DisplayMeasureExt.fromValue(value);
    } else {
      return null;
    }
  }

  set poolLengthUnit(DisplayMeasure? value) {
    final field = getField(WorkoutSessionPoolLengthUnitField.ID);

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

class WorkoutSessionSportField extends Field {
  WorkoutSessionSportField({int size = 0, bool growable = true})
      : super(
            name: 'sport',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 0;
}

class WorkoutSessionSubSportField extends Field {
  WorkoutSessionSubSportField({int size = 0, bool growable = true})
      : super(
            name: 'sub_sport',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 1;
}

class WorkoutSessionNumValidStepsField extends Field {
  WorkoutSessionNumValidStepsField({int size = 0, bool growable = true})
      : super(
            name: 'num_valid_steps',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 2;
}

class WorkoutSessionFirstStepIndexField extends Field {
  WorkoutSessionFirstStepIndexField({int size = 0, bool growable = true})
      : super(
            name: 'first_step_index',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 3;
}

class WorkoutSessionPoolLengthField extends Field {
  WorkoutSessionPoolLengthField({int size = 0, bool growable = true})
      : super(
            name: 'pool_length',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 100,
            size: size,
            units: 'm',
            mainTypeName: '',
            growable: growable,
            subFields: []);

  static const ID = 4;
}

class WorkoutSessionPoolLengthUnitField extends Field {
  WorkoutSessionPoolLengthUnitField({int size = 0, bool growable = true})
      : super(
            name: 'pool_length_unit',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 5;
}
