@TestOn('vm')
import 'dart:io';

import 'package:fit_tool/fit_tool.dart';
import 'package:test/test.dart';

void main() {
  group('workout file tests', () {
    setUp(() {});

    test('Decode workout repeat greater than step file', () async {
      final file = File('./test/data/trainerroad_744490.fit');
      final bytes = await file.readAsBytes();
      final fitFile = FitFile.fromBytes(bytes);

      for (var record in fitFile.records) {
        final message = record.message;

        if (message is WorkoutStepMessage) {
          // print(message.toRow());

          switch (message.targetType) {
            case WorkoutStepTarget.powerLap:
              // print(
              //     'low power: ${message.customTargetPowerLow}, low value: ${message.customTargetValueLow}');
              // print(
              //     'high power: ${message.customTargetPowerHigh}, high value: ${message.customTargetValueHigh}');
              break;
            default:
          }

          switch (message.durationType) {
            case WorkoutStepDuration.time:
              // print('duration time: ${message.durationTime}');
              break;

            case WorkoutStepDuration.open:
              // print('duration open: ${message.durationValue}');
              break;
            default:
          }
        }
      }
    });

    test('Decode workout file with multiple dev data indexes', () async {
      final file = File('./test/data/stagesLink_25622166.fit');
      final bytes = await file.readAsBytes();
      FitFile.fromBytes(bytes);
    });
  });
}
