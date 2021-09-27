import 'package:fit_tool/src/definition_message.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/record.dart';
import 'package:test/test.dart';

void main() {
  group('Record tests', () {
    setUp(() {});

    test('Normal header byte conversions', () {
      final header1 = RecordHeader(
          isDefinition: true, localId: RecordHeader.maxNormalLocalId);
      final bytes1 = header1.toBytes();

      final header2 = RecordHeader.fromBytes(bytes1);
      final bytes2 = header2.toBytes();

      expect(bytes2, bytes1);
    });

    test('Normal header bad local id', () {
      expect(() => RecordHeader(isDefinition: true, localId: -1),
          throwsA(TypeMatcher<ArgumentError>()));
      expect(
          () => RecordHeader(
              isDefinition: true, localId: RecordHeader.maxNormalLocalId + 1),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Time compressed header byte conversions', () {
      final header1 = RecordHeader(
          isTimeCompressed: true,
          localId: RecordHeader.maxTimeCompressedLocalId);
      final bytes1 = header1.toBytes();

      final header2 = RecordHeader.fromBytes(bytes1);
      final bytes2 = header2.toBytes();

      expect(bytes2, bytes1);
    });

    test('Time compressed header bad local id', () {
      expect(() => RecordHeader(isTimeCompressed: true, localId: -1),
          throwsA(TypeMatcher<ArgumentError>()));
      expect(
          () => RecordHeader(
              isTimeCompressed: true,
              localId: RecordHeader.maxTimeCompressedLocalId + 1),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('conversion', () {
      final localId = 15;
      final dm1 = WorkoutStepMessage(localId: localId)
        ..workoutStepName = 'test';

      final record1 = Record.fromMessage(dm1);

      final bytes1 = record1.toBytes();

      final definitionMessage = DefinitionMessage.fromDataMessage(dm1);
      final record2 = Record.fromBytes({localId: definitionMessage}, bytes1);

      expect(record2.toBytes(), bytes1);
    });

    test('toRow', () {
      final localId = 15;
      final dm1 = WorkoutStepMessage(localId: localId)
        ..workoutStepName = 'test';

      final record1 = Record.fromMessage(dm1);

      record1.toRow();
    });
  });
}
