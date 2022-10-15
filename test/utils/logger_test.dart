import 'dart:convert';

import 'package:fit_tool/src/utils/logger.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';

void main() {
  group('logger', () {
    tearDown(() {
      logger = createDefaultLogger();
    });

    test('does not evaluate a lazy message that is not logged', () {
      logger = Logger(level: Level.nothing, output: _NoOpLogOutput());
      bool wasEvaluated = false;
      logger.i(LogMessage(() {
        wasEvaluated = true;
        return 'should not have evaluated message';
      }));
      expect(wasEvaluated, false);
    });

    test('evaluates a lazy message that is logged', () {
      logger = Logger(level: Level.warning, output: _NoOpLogOutput());
      bool wasEvaluated = false;
      logger.w(LogMessage(() {
        wasEvaluated = true;
        return 'should have evaluated message';
      }));
      expect(wasEvaluated, true);
    });
  });
}

class _NoOpLogOutput extends LogOutput {
  @override
  void output(OutputEvent event) {}
}
