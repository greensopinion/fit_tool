import 'package:fit_tool/src/definition_message.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';
import 'package:test/test.dart';

void main() {
  group('WorkoutStepMessage tests', () {
    setUp(() {});

    test('Set/Get fields 1', () {
      final mesg = WorkoutStepMessage();
      final name = 'tttt';
      mesg.workoutStepName = name;
      expect(mesg.workoutStepName, name);

      mesg.targetType = WorkoutStepTarget.speed;
      expect(mesg.targetType, WorkoutStepTarget.speed);

      final zone = 5;
      mesg.targetSpeedZone = zone;
      expect(mesg.targetSpeedZone, zone);

      final expectedBytes = mesg.toBytes();

      final mesg2 = WorkoutStepMessage.fromBytes(
          DefinitionMessage.fromDataMessage(mesg), expectedBytes);
      final actualBytes = mesg2.toBytes();

      expect(actualBytes, expectedBytes);
    });

    test('Set/Get repeatTime', () {
      final mesg = WorkoutStepMessage();

      final durationType = WorkoutStepDuration.repeatUntilTime;
      mesg.durationType = durationType;
      expect(mesg.durationType, durationType);

      final targetRepeatTime = 5.0;
      mesg.durationType = WorkoutStepDuration.repeatUntilTime;
      mesg.targetRepeatTime = targetRepeatTime;
      expect(mesg.targetRepeatTime, targetRepeatTime);

      final expectedBytes = mesg.toBytes();

      final mesg2 = WorkoutStepMessage.fromBytes(
          DefinitionMessage.fromDataMessage(mesg), expectedBytes);
      final actualBytes = mesg2.toBytes();
      expect(actualBytes, expectedBytes);
      expect(mesg2.targetRepeatTime, targetRepeatTime);
    });
  });
}
