import 'package:fit_tool/src/definition_message.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';
import 'package:test/test.dart';

void main() {
  group('Data message tests', () {
    setUp(() {});

    test('conversions', () {
      final dm1 = WorkoutStepMessage();
      dm1.workoutStepName = 'test';
      final bytes1 = dm1.toBytes();

      final definitionMesg = DefinitionMessage.fromDataMessage(dm1);

      final dm2 = WorkoutStepMessage(definitionMessage: definitionMesg);
      dm2.readFromBytes(bytes1);
      final bytes2 = dm2.toBytes();

      expect(bytes2, bytes1);
    });

    test('toRow', () {
      final dm1 = WorkoutStepMessage();
      dm1.workoutStepName = 'test';
      dm1.durationType = WorkoutStepDuration.distance;
      dm1.toRow();
    });
  });
}
