A library for reading and writing Garmin FIT files.

## Background
> The Flexible and Interoperable Data Transfer (FIT) protocol is designed specifically for the storing and sharing of data that originates from sport, fitness and health devices. The FIT protocol defines a set of data storage templates (FIT messages) that can be used to store information such as user profiles, activity data, courses, and workouts. It is specifically designed to be compact, interoperable and extensible.

[More info...](https://developer.garmin.com/fit/overview/)

## Usage

Here are some examples on how to use fit_tool:

* [Reading a FIT file](#reading-a-fit-file)
* [Writing a FIT file](#writing-a-fit-file)

More examples can be found in the [example](https://bitbucket.org/stagescycling/fit_tool/src/main/example/) directory.

> &#x26a0;&#xfe0f; Note that in the following examples, we often refer to files in the `test/data` directory. To 
> actually run these examples successfully you may need to modify the file paths.

### Reading a FIT file

A FIT file can be read in essentially two ways. The first is by reading all the bytes in the file all at once and decoding the bytes
in one batch, the second is by reading the file as a stream. The first method is the easiest to implement, but might not be the most
efficient for very large FIT files. The following code reads all the bytes from a file and then decodes these bytes to
create a FIT file object. We then convert the FIT data to a human-readable CSV file.

```dart
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file.dart';

Future<void> main() async {
  final file = File('./test/data/sdk/Activity.fit');
  final bytes = await file.readAsBytes();
  final fitFile = FitFile.fromBytes(bytes);

  final outFile = File('./test/data/sdk/Activity.csv');
  final csv = const ListToCsvConverter().convert(fitFile.toRows());
  await outFile.writeAsString(csv);
}
```



In this next example we read a file by using Dart [streams](https://dart.dev/tutorials/language/streams) which can be a 
very powerful way to process FIT data. In the following example we open a FIT file as a byte stream and then transform
this stream to a message stream using the provided `FitDecoder`.

```dart
import 'dart:io';

import 'package:fit_tool/src/fit_decoder.dart';
import 'package:fit_tool/src/profile/messages/record_message.dart';

Future<void> main() async {
  final file = File('./test/data/palisade.fit');
  var byteStream = file.openRead();
  final messageStream = byteStream.transform(FitDecoder());

  // Filter stream to retrieve only Record messages, then
  // extract lat,lon position.
  await messageStream
      .where((message) => message is RecordMessage)
      .forEach((message) {
    message as RecordMessage;
    if (message.positionLat != null && message.positionLong != null) {
      print('position: ${message.positionLat}, ${message.positionLong}');
    }
  });
}
```


### Writing a FIT file

The following code writes a workout as a FIT file.

```dart
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file_builder.dart';
import 'package:fit_tool/src/profile/messages/file_id_message.dart';
import 'package:fit_tool/src/profile/messages/workout_message.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/profile/profile_type.dart';
import 'package:fit_tool/src/utils/conversions.dart';

Future<void> main() async {
  final fileIdMessage = FileIdMessage()
    ..type = FileType.workout
    ..manufacturer = Manufacturer.development.value
    ..product = 0
    ..timeCreated =
    toSecondsSince1989Epoch(DateTime
        .now()
        .millisecondsSinceEpoch)
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
    ..add(fileIdMessage)..add(workoutMessage)
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


