/// Autogenerated. Do not modify.
///
/// Profile: 21.60
import 'dart:typed_data';

import '../../base_type.dart';
import '../../data_message.dart';
import '../../definition_message.dart';
import '../../errors.dart';
import '../../field.dart';
import 'common_fields.dart';

// ignore_for_file: constant_identifier_names

class ExerciseTitleMessage extends DataMessage {
  ExerciseTitleMessage(
      {definitionMessage,
      developerFields,
      int localId = 0,
      Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: ExerciseTitleMessage.NAME,
            globalId: ExerciseTitleMessage.ID,
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
              ExerciseTitleExerciseCategoryField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ExerciseTitleExerciseCategoryField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ExerciseTitleExerciseNameField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ExerciseTitleExerciseNameField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null),
              ExerciseTitleWorkoutStepNameField(
                  size: definitionMessage
                          ?.getFieldDefinition(
                              ExerciseTitleWorkoutStepNameField.ID)
                          ?.size ??
                      0,
                  growable: definitionMessage == null)
            ]);

  /// The Global ID of the message. In the FIT documentation this is referred to as the "Global Message Number".
  static const ID = 264;
  static const NAME = 'exercise_title';

  final bool growable;

  /// Returns an instance of ExerciseTitleMessage from a bytes list.
  static ExerciseTitleMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = ExerciseTitleMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }

  /// Returns the value of the messageIndex field. Returns null if the field is not defined in the message.
  int? get messageIndex {
    final field = getField(MessageIndexField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the messageIndex field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set messageIndex(int? value) {
    final field = getField(MessageIndexField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Returns the value of the exerciseCategory field. Returns null if the field is not defined in the message.
  int? get exerciseCategory {
    final field = getField(ExerciseTitleExerciseCategoryField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the exerciseCategory field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set exerciseCategory(int? value) {
    final field = getField(ExerciseTitleExerciseCategoryField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Returns the value of the exerciseName field. Returns null if the field is not defined in the message.
  int? get exerciseName {
    final field = getField(ExerciseTitleExerciseNameField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the exerciseName field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set exerciseName(int? value) {
    final field = getField(ExerciseTitleExerciseNameField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }

  /// Returns the value of the workoutStepName field. Returns null if the field is not defined in the message.
  String? get workoutStepName {
    final field = getField(ExerciseTitleWorkoutStepNameField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }

  /// Sets the workoutStepName field with [value]. Throws [FieldNotDefinedError] if the field is not defined in the message.
  set workoutStepName(String? value) {
    final field = getField(ExerciseTitleWorkoutStepNameField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    } else {
      throw FieldNotDefinedError(field!.name);
    }
  }
}

class ExerciseTitleExerciseCategoryField extends Field {
  ExerciseTitleExerciseCategoryField({int size = 0, bool growable = true})
      : super(
            name: 'exercise_category',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 0;
}

class ExerciseTitleExerciseNameField extends Field {
  ExerciseTitleExerciseNameField({int size = 0, bool growable = true})
      : super(
            name: 'exercise_name',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 1;
}

class ExerciseTitleWorkoutStepNameField extends Field {
  ExerciseTitleWorkoutStepNameField({int size = 0, bool growable = true})
      : super(
            name: 'wkt_step_name',
            id: ID,
            type: BaseType.STRING,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: []);

  static const ID = 2;
}
