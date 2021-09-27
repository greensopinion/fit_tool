import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/definition_message.dart';
import 'package:fit_tool/src/fit_file.dart';
import 'package:fit_tool/src/fit_file_builder.dart';
import 'package:fit_tool/src/profile/messages/file_id_message.dart';
import 'package:fit_tool/src/profile/messages/workout_message.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';
import 'package:fit_tool/src/utils/conversions.dart';
import 'package:test/test.dart';

void main() {
  group('Fit file tests', () {
    setUp(() {});

    test('Conversion: simple', () {
      final mesg = WorkoutStepMessage(localId: 0)
        ..workoutStepName = '1st step'
        ..durationType = WorkoutStepDuration.distance;

      final defMesg = DefinitionMessage.fromDataMessage(mesg);

      final builder = FitFileBuilder(autoDefine: false)
        ..add(defMesg)
        ..add(mesg);

      final fitFile = builder.build();

      final bytes1 = fitFile.toBytes();

      final fitFile2 = FitFile.fromBytes(bytes1);
      final bytes2 = fitFile2.toBytes();

      // print('$bytes1');
      // print('$bytes2');
      expect(bytes2, bytes1);
    });

    test('Fit builder with autoDefine', () {
      final mesg1 = WorkoutStepMessage(
        localId: 0,
      )
        ..workoutStepName = 'test'
        ..durationType = WorkoutStepDuration.distance;

      final mesg2 = WorkoutStepMessage(localId: 0)
        ..workoutStepName = 'tesatseatae'
        ..durationType = WorkoutStepDuration.distance;

      final builder = FitFileBuilder(autoDefine: true, minStringSize: 50)
        ..add(mesg1)
        ..add(mesg2);

      final fitFile = builder.build();

      expect(fitFile.records.length, 3);
    });

    test('Create a workout', () async {

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

      final builder = FitFileBuilder(autoDefine: true, minStringSize: 50)
        ..add(fileIdMessage)
        ..add(workoutMessage)
        ..addAll(workoutSteps);

      final fitFile = builder.build();

      final outFile = await File('./test/out/tempo_bike_workout.fit').create(recursive: true);
      await outFile.writeAsBytes(fitFile.toBytes());

      final csvOutFile = File('./test/out/tempo_bike_workout.csv');
      final csv = const ListToCsvConverter().convert(fitFile.toRows());
      await csvOutFile.writeAsString(csv);

    });

    test('Argument errors', () {
      // final protocolVersion = ProtocolVersion(2, 3);
      // final profileVersion = ProfileVersion(21, 60);
      // expect(
      //         () => FitFileHeader(
      //         protocolVersion: protocolVersion,
      //         profileVersion: profileVersion,
      //         recordsLength: -1),
      //     throwsA(TypeMatcher<ArgumentError>()));
      //
      // expect(
      //         () => FitFileHeader(
      //         protocolVersion: protocolVersion,
      //         profileVersion: profileVersion,
      //         recordsLength: maxUint32 + 1),
      //     throwsA(TypeMatcher<ArgumentError>()));
      //
      // expect(
      //         () => FitFileHeader(
      //         protocolVersion: protocolVersion,
      //         profileVersion: profileVersion,
      //         recordsLength: maxUint32,
      //         crc: -1),
      //     throwsA(TypeMatcher<ArgumentError>()));
      //
      // expect(
      //         () => FitFileHeader(
      //         protocolVersion: protocolVersion,
      //         profileVersion: profileVersion,
      //         recordsLength: maxUint32,
      //         crc: maxUint16 + 1),
      //     throwsA(TypeMatcher<ArgumentError>()));
    });
  });
}
