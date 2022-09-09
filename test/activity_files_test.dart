@TestOn('vm')
import 'dart:io';

import 'package:fit_tool/fit_tool.dart';
import 'package:fit_tool/src/fit_file.dart';
import 'package:fit_tool/src/utils/logger.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';

void main() {
  group('activity tests', () {
    setUp(() {
      Logger.level = Level.nothing;
    });

    test('Decode activity with deprecated messages and fields', () async {
      final file = File('./test/data/activity_deprecated_profile.fit');
      final bytes = await file.readAsBytes();
      final fitFile = FitFile.fromBytes(bytes);
      logger.d('Profile version: ${fitFile.header.profileVersion}');
      fitFile.toRows();
      // for (var row in fitFile.toRows()) {
      //   print(row);
      // }
    });

    test('Decode activity with multiple developer indexes', () async {
      final file = File('./test/data/activity_multiple_developer_index.fit');
      final bytes = await file.readAsBytes();
      final fitFile = FitFile.fromBytes(bytes);
      logger.d('Profile version: ${fitFile.header.profileVersion}');
      fitFile.toRows();
      for (var row in fitFile.toRows()) {
        logger.d(row);
      }
    });
  });
}
