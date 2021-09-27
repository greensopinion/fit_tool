import 'package:fit_tool/src/fit_file_header.dart';
import 'package:fit_tool/src/utils/type_sizes.dart';
import 'package:test/test.dart';

void main() {
  group('Fit file header tests', () {
    setUp(() {});

    test('Conversion without crc', () {
      final header1 = FitFileHeader(
          protocolVersion: ProtocolVersion(2, 3),
          profileVersion: ProfileVersion(21, 60),
          recordsSize: maxUint32);
      final bytes1 = header1.toBytes();

      final header2 = FitFileHeader.fromBytes(bytes1);
      final bytes2 = header2.toBytes();

      expect(bytes2, bytes1);
    });

    test('Conversion with crc', () {
      final header1 = FitFileHeader(
          protocolVersion: ProtocolVersion(2, 3),
          profileVersion: ProfileVersion(21, 60),
          recordsSize: 20,
          crc: 500);
      final bytes1 = header1.toBytes();

      final header2 = FitFileHeader.fromBytes(bytes1);
      final bytes2 = header2.toBytes();

      expect(bytes2, bytes1);
    });

    test('Argument errors', () {
      final protocolVersion = ProtocolVersion(2, 3);
      final profileVersion = ProfileVersion(21, 60);
      expect(
          () => FitFileHeader(
              protocolVersion: protocolVersion,
              profileVersion: profileVersion,
              recordsSize: -1),
          throwsA(TypeMatcher<ArgumentError>()));

      expect(
          () => FitFileHeader(
              protocolVersion: protocolVersion,
              profileVersion: profileVersion,
              recordsSize: maxUint32 + 1),
          throwsA(TypeMatcher<ArgumentError>()));

      expect(
          () => FitFileHeader(
              protocolVersion: protocolVersion,
              profileVersion: profileVersion,
              recordsSize: maxUint32,
              crc: -1),
          throwsA(TypeMatcher<ArgumentError>()));

      expect(
          () => FitFileHeader(
              protocolVersion: protocolVersion,
              profileVersion: profileVersion,
              recordsSize: maxUint32,
              crc: maxUint16 + 1),
          throwsA(TypeMatcher<ArgumentError>()));
    });
  });
}
