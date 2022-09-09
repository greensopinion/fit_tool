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

  var distance = 0.0;
  final coursePoints = <CoursePointMessage>[];
  final haversineDistance = HaversineDistance();

  Location? prevCoordinate;
  Location? currentCoordinate;

  for (var trackPoint in xmlGpx.trks[0].trksegs[0].trkpts) {
    // calculate distance from previous coordinate and accumulate distance
    currentCoordinate = Location(trackPoint.lat!, trackPoint.lon!);
    final double delta;
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
