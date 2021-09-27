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
