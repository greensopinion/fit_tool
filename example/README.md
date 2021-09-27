

## Writing an activity  file
The following is an example on how to build an activity FIT file.

```dart
import 'dart:io';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file_builder.dart';
import 'package:fit_tool/src/profile/messages/event_message.dart';
import 'package:fit_tool/src/profile/messages/file_id_message.dart';
import 'package:fit_tool/src/profile/messages/lap_message.dart';
import 'package:fit_tool/src/profile/messages/record_message.dart';
import 'package:fit_tool/src/profile/messages/session_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';
import 'package:gpx/gpx.dart';

Future<void> main() async {
  // We set autoDefine to true, so that the builder creates the required
  // Definition Messages for us.
  final builder = FitFileBuilder(autoDefine: true, minStringSize: 50);

  // Read position data from a GPX file
  final gpxFile = File('./test/data/old_stage_left_hand_lee.gpx');
  final gpxString = await gpxFile.readAsString();
  final xmlGpx = GpxReader().fromString(gpxString);

  final fileIdMessage = FileIdMessage()
    ..type = FileType.activity
    ..manufacturer = Manufacturer.development.value
    ..product = 0
    ..timeCreated = DateTime.now().millisecondsSinceEpoch
    ..serialNumber = 0x12345678;
  builder.add(fileIdMessage);

  // Timer Events are a best practice for FIT activity files
  final startTimestamp = DateTime.now().millisecondsSinceEpoch;
  var timestamp = startTimestamp;
  final eventMessage = EventMessage()
    ..event = Event.timer
    ..eventType = EventType.start
    ..timestamp = startTimestamp;
  builder.add(eventMessage);

  final records = <RecordMessage>[];
  var recordIndex = 0;
  for (var trackPoint in xmlGpx.trks[0].trksegs[0].trkpts) {
    timestamp += 10000;
    records.add(RecordMessage()
      ..timestamp = timestamp
      ..positionLong = trackPoint.lon
      ..positionLat = trackPoint.lat
      ..altitude = trackPoint.ele
      ..power = (20 * sin(2 * pi * recordIndex / 50) + 200).round());
    recordIndex++;
  }
  builder.addAll(records);

  // Every FIT activity file MUST contain at least one Lap message
  final elapsedTime = (timestamp - startTimestamp).toDouble();
  final lapMessage = LapMessage()
    ..timestamp = timestamp
    ..startTime = startTimestamp
    ..totalElapsedTime = elapsedTime
    ..totalTimerTime = elapsedTime;
  builder.add(lapMessage);

  // Every FIT activity file MUST contain at least one Session message
  final sessionMessage = SessionMessage()
    ..timestamp = timestamp
    ..startTime = startTimestamp
    ..totalElapsedTime = elapsedTime
    ..totalTimerTime = elapsedTime
    ..sport = Sport.cycling
    ..subSport = SubSport.exercise
    ..firstLapIndex = 0
    ..numLaps = 1;
  builder.add(sessionMessage);

  /// Finally build the FIT file object and write it to a file
  final fitFile = builder.build();

  final outFile =
  await File('./test/out/old_stage_activity.fit').create(recursive: true);
  await outFile.writeAsBytes(fitFile.toBytes());

  final csvOutFile = File('./test/out/old_stage_activity.csv');
  final csv = const ListToCsvConverter().convert(fitFile.toRows());
  await csvOutFile.writeAsString(csv);
}
```

## Writing a course file
The following is an example on how to build a course FIT file.

```dart
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file_builder.dart';
import 'package:fit_tool/src/profile/messages/course_message.dart';
import 'package:fit_tool/src/profile/messages/course_point_message.dart';
import 'package:fit_tool/src/profile/messages/event_message.dart';
import 'package:fit_tool/src/profile/messages/file_id_message.dart';
import 'package:fit_tool/src/profile/messages/lap_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';
import 'package:gpx/gpx.dart';
import 'package:haversine_distance/haversine_distance.dart';

Future<void> main() async {
  // We set autoDefine to true, so that the builder creates the required
  // Definition Messages for us.
  final builder = FitFileBuilder(autoDefine: true, minStringSize: 50);

  // Read position data from a GPX file
  final gpxFile = File('./test/data/old_stage_left_hand_lee.gpx');
  final gpxString = await gpxFile.readAsString();
  final xmlGpx = GpxReader().fromString(gpxString);

  builder.add(FileIdMessage()
    ..type = FileType.course
    ..manufacturer = Manufacturer.development.value
    ..product = 0
    ..timeCreated = DateTime.now().millisecondsSinceEpoch
    ..serialNumber = 0x12345678);

  // Every FIT course file MUST contain a Course message
  builder.add(CourseMessage()
    ..courseName = 'old stage'
    ..sport = Sport.cycling);

  // Timer Events are REQUIRED for FIT course files
  final startTimestamp = DateTime.now().millisecondsSinceEpoch;
  var timestamp = startTimestamp;
  builder.add(EventMessage()
    ..event = Event.timer
    ..eventType = EventType.start
    ..timestamp = startTimestamp);

  var trackPointIndex = 0;
  var distance = 0.0;
  final coursePoints = <CoursePointMessage>[];
  final haversineDistance = HaversineDistance();

  Location? prevCoordinate;
  Location? currentCoordinate;

  for (var trackPoint in xmlGpx.trks[0].trksegs[0].trkpts) {
    // calculate distance from previous coordinate and accumulate distance
    currentCoordinate = Location(trackPoint.lat!, trackPoint.lon!);
    final delta;
    if (prevCoordinate == null) {
      delta = 0.0;
    } else {
      delta = haversineDistance.haversine(
          prevCoordinate, currentCoordinate, Unit.METER);
    }
    distance += delta;

    coursePoints.add(CoursePointMessage()
      ..timestamp = timestamp
      ..positionLong = trackPoint.lon
      ..positionLat = trackPoint.lat
      ..distance = distance);

    timestamp += 10000;
    prevCoordinate = currentCoordinate;
    trackPointIndex++;
  }
  builder.addAll(coursePoints);

  builder.add(EventMessage()
    ..event = Event.timer
    ..eventType = EventType.stopAll
    ..timestamp = timestamp);

  // Every FIT course file MUST contain a Lap message
  final elapsedTime = (timestamp - startTimestamp).toDouble();
  builder.add(LapMessage()
    ..timestamp = timestamp
    ..startTime = startTimestamp
    ..totalElapsedTime = elapsedTime
    ..totalTimerTime = elapsedTime
    ..startPositionLat = coursePoints.first.positionLat
    ..startPositionLong = coursePoints.first.positionLong
    ..endPositionLat = coursePoints.last.positionLat
    ..endPositionLong = coursePoints.last.positionLong
    ..totalDistance = coursePoints.last.distance);

  /// Finally build the FIT file object and write it to a file
  final fitFile = builder.build();

  final outFile =
      await File('./test/out/old_stage_course.fit').create(recursive: true);
  await outFile.writeAsBytes(fitFile.toBytes());

  final csvOutFile = File('./test/out/old_stage_course.csv');
  final csv = const ListToCsvConverter().convert(fitFile.toRows());
  await csvOutFile.writeAsString(csv);
}
```

## Writing a workout
```dart
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
```
