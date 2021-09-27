import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file_builder.dart';
import 'package:fit_tool/src/profile/messages/file_id_message.dart';
import 'package:fit_tool/src/profile/messages/workout_message.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';

Future<void> main() async {
  final fileIdMessage = FileIdMessage()
    ..type = FileType.workout
    ..manufacturer = Manufacturer.development.value
    ..product = 0
    ..timeCreated = DateTime.now().millisecondsSinceEpoch
    ..serialNumber = 0x12345678;

  final workoutSteps = [
    WorkoutStepMessage()
      ..workoutStepName = 'Warm up 10min in Heart Rate Zone 1'
      ..intensity = Intensity.warmup
      ..durationType = WorkoutStepDuration.time
      ..durationTime = 600.0
      ..targetType = WorkoutStepTarget.heartRate
      ..targetHrZone = 1,
    WorkoutStepMessage()
      ..workoutStepName = 'Bike 40min Power Zone 3'
      ..intensity = Intensity.active
      ..durationType = WorkoutStepDuration.time
      ..durationTime = 24000.0
      ..targetType = WorkoutStepTarget.power
      ..targetPowerZone = 3,
    WorkoutStepMessage()
      ..workoutStepName = 'Cool Down Until Lap Button Pressed'
      ..intensity = Intensity.cooldown
      ..durationType = WorkoutStepDuration.open
      ..durationValue = 0
      ..targetType = WorkoutStepTarget.open
      ..targetValue = 0,
  ];

  final workoutMessage = WorkoutMessage()
    ..workoutName = 'Tempo Bike'
    ..sport = Sport.cycling
    ..numValidSteps = workoutSteps.length;

  // We set autoDefine to true, so that the builder creates the required
  // Definition Messages for us.
  final builder = FitFileBuilder(autoDefine: true, minStringSize: 50)
    ..add(fileIdMessage)
    ..add(workoutMessage)
    ..addAll(workoutSteps);

  final fitFile = builder.build();

  final outFile =
      await File('./test/out/tempo_bike_workout.fit').create(recursive: true);
  await outFile.writeAsBytes(fitFile.toBytes());

  final csvOutFile = File('./test/out/tempo_bike_workout.csv');
  final csv = const ListToCsvConverter().convert(fitFile.toRows());
  await csvOutFile.writeAsString(csv);
}
