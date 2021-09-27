import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file.dart';
import 'package:fit_tool/src/fit_file_builder.dart';
import 'package:fit_tool/src/profile/messages/record_message.dart';

/// The following code reads all the bytes from a FIT formatted file and then
/// decodes these bytes to create a FIT file object. We then build a modified FIT file
/// based on a variety of criteria (see comments below). Finally we convert
/// the FIT data to a human-readable CSV file.
Future<void> main() async {
  final file = File('./test/data/sdk/Activity.fit');
  final bytes = await file.readAsBytes();
  final fitFile = FitFile.fromBytes(bytes);

  final builder = FitFileBuilder(autoDefine: false);
  for (var record in fitFile.records) {
    final message = record.message;

    var includeRecord = true;

    if (message.globalId == RecordMessage.ID) {
      // Remove the heart rate field from all record definition and data messages
      message.removeField(RecordHeartRateField.ID);

      if (message is RecordMessage) {
        // Remove records where the power is too high
        final powerField = message.getField(RecordPowerField.ID);
        if (powerField != null && powerField.isValid()) {
          final power = powerField.getValue();
          if (power > 800) {
            includeRecord = false;
          }
        }
      }
    }

    if (includeRecord) {
      builder.add(message);
    }
  }

  final modifiedFitFile = builder.build();
  final outFile =
      await File('./test/out/modified_activity.csv').create(recursive: true);
  final csv = const ListToCsvConverter().convert(modifiedFitFile.toRows());
  await outFile.writeAsString(csv);
}
