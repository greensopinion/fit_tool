import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file.dart';
import 'package:test/test.dart';

void main() {
  group('SDK decode files tests', () {
    setUp(() {});

    ///
    /// DEVELOPER DATA
    ///
    test('Decode developer data file', () async {
      final file = File('./test/data/sdk/DeveloperData.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    ///
    /// ACTIVITY
    ///
    test('Decode activity file', () async {
      final file = File('./test/data/sdk/Activity.fit');
      final bytes = await file.readAsBytes();
      final fitFile = FitFile.fromBytes(bytes);

      final outFile = File('./test/out/Activity.csv');
      final csv = const ListToCsvConverter().convert(fitFile.toRows());
      await outFile.writeAsString(csv);
    });

    test('Decode link activity file', () async {
      final file = File('./test/data/palisade.fit');
      final bytes = await file.readAsBytes();
      final fitFile = FitFile.fromBytes(bytes);

      final outFile = File('./test/out/palisade.csv');
      final csv = const ListToCsvConverter().convert(fitFile.toRows());
      await outFile.writeAsString(csv);
    });

    test('Decode activity low battery file', () async {
      final file = File('./test/data/sdk/activity_lowbattery.fit');

      final bytes = await file.readAsBytes();

      final fitFile = FitFile.fromBytes(bytes);

      final outFile = File('./test/out/activity_lowbattery.csv');
      final csv = const ListToCsvConverter().convert(fitFile.toRows());
      await outFile.writeAsString(csv);
    });

    test('Decode activity multisport file', () async {
      final file = File('./test/data/sdk/activity_multisport.fit');

      final bytes = await file.readAsBytes();

      final fitFile = FitFile.fromBytes(bytes);

      final outFile = File('./test/out/activity_multisport.csv');
      final csv = const ListToCsvConverter().convert(fitFile.toRows());
      await outFile.writeAsString(csv);
    });

    test('Decode activity pool swim with hr file', () async {
      final file = File('./test/data/sdk/activity_poolswim_with_hr.fit');

      final bytes = await file.readAsBytes();

      final fitFile = FitFile.fromBytes(bytes);

      final outFile = File('./test/out/activity_poolswim_with_hr.csv');
      final csv = const ListToCsvConverter().convert(fitFile.toRows());
      await outFile.writeAsString(csv);
    });

    test('Decode activity pool swim file', () async {
      final file = File('./test/data/sdk/activity_poolswim.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    test('Decode activity truncated', () async {
      final file = File('./test/data/sdk/activity_truncated.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    ///
    /// MISC
    ///
    test('Decode monitoring file', () async {
      final file = File('./test/data/sdk/MonitoringFile.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    test('Decode settings file', () async {
      final file = File('./test/data/sdk/Settings.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    test('Decode weight scale multi user file', () async {
      final file = File('./test/data/sdk/WeightScaleMultiUser.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    test('Decode weight scale single user file', () async {
      final file = File('./test/data/sdk/WeightScaleSingleUser.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    ///
    /// WORKOUTS
    ///
    test('Decode workout individual steps file', () async {
      final file = File('./test/data/sdk/WorkoutIndividualSteps.fit');

      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    test('Decode workout custom target values file', () async {
      final file = File('./test/data/sdk/WorkoutCustomTargetValues.fit');
      final bytes = await file.readAsBytes();

      FitFile.fromBytes(bytes);
    });

    test('Decode workout repeat greater than step file', () async {
      final file = File('./test/data/sdk/WorkoutRepeatGreaterThanStep.fit');
      final bytes = await file.readAsBytes();
      FitFile.fromBytes(bytes);
    });

    test('Decode workout repeat steps file', () async {
      final file = File('./test/data/sdk/WorkoutRepeatSteps.fit');
      final bytes = await file.readAsBytes();
      FitFile.fromBytes(bytes);
    });
  });
}
