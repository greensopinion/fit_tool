import 'dart:typed_data';

import 'package:fit_tool/src/base_type.dart';
import 'package:fit_tool/src/definition_message.dart';
import 'package:fit_tool/src/field_definition.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';
import 'package:fit_tool/src/utils/type_sizes.dart';
import 'package:test/test.dart';

void main() {
  group('Definition message tests', () {
    setUp(() {});

    test('conversions', () {
      final dm1 = DefinitionMessage(
          globalId: 555,
          localId: 2,
          fieldDefinitions: [
            FieldDefinition(id: 100, size: 5, type: BaseType.STRING)
          ]);
      final bytes1 = dm1.toBytes();

      final dm2 = DefinitionMessage.fromBytes(bytes1);
      final bytes2 = dm2.toBytes();

      expect(bytes2, bytes1);
    });

    test('big endian conversion', () {
      final dm1 = DefinitionMessage(
          globalId: 555,
          localId: 2,
          endian: Endian.big,
          fieldDefinitions: [
            FieldDefinition(id: 100, size: 5, type: BaseType.STRING)
          ]);
      final bytes1 = dm1.toBytes();

      final dm2 = DefinitionMessage.fromBytes(bytes1);
      final bytes2 = dm2.toBytes();

      expect(bytes2, bytes1);
      expect(dm2.endian, Endian.big);
    });

    test('valid id ranges', () {
      expect(() => DefinitionMessage(localId: -1),
          throwsA(TypeMatcher<ArgumentError>()));
      expect(() => DefinitionMessage(localId: maxUint8 + 1),
          throwsA(TypeMatcher<ArgumentError>()));
      expect(() => DefinitionMessage(globalId: -1),
          throwsA(TypeMatcher<ArgumentError>()));
      expect(() => DefinitionMessage(globalId: maxUint16 + 1),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('toRow', () {
      final dm1 = WorkoutStepMessage();
      dm1.workoutStepName = 'test';
      dm1.durationType = WorkoutStepDuration.distance;

      final definition = DefinitionMessage.fromDataMessage(dm1);
      definition.toRow();
      // final row = definition.toRow();
      // print(row);
    });
  });
}
