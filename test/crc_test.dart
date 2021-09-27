import 'dart:convert';

import 'package:fit_tool/src/utils/crc.dart';
import 'package:test/test.dart';

void main() {
  group('CRC tests', () {
    setUp(() {});

    test('CRC16', () {
      final data = utf8.encode('123456789');
      final result = crc16(data);
      expect(result, 0xBB3D);
    });
  });
}
