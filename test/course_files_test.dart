import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fit_tool/fit_tool.dart';
import 'package:fit_tool/src/fit_file.dart';
import 'package:test/test.dart';

void main() {
  group('course file tests', () {
    setUp(() {});

    test('Decode course file with developer fields', () async {
      final file = File('./test/data/stagesLink_28832.fit');
      final bytes = await file.readAsBytes();
      final fitFile = FitFile.fromBytes(bytes);

    });

  });
}
