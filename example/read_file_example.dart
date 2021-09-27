import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file.dart';

///The following code reads all the bytes from a FIT formatted file and then decodes these bytes to
// create a FIT file object. We then convert the FIT data to a human-readable CSV file.
Future<void> main() async {
  final file = File('./test/data/sdk/Activity.fit');
  final bytes = await file.readAsBytes();
  final fitFile = FitFile.fromBytes(bytes);

  final outFile = File('./test/data/sdk/Activity.csv');
  final csv = const ListToCsvConverter().convert(fitFile.toRows());
  await outFile.writeAsString(csv);
}
