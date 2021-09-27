import 'package:fit_tool/src/base_type.dart';
import 'package:fit_tool/src/field.dart';
import 'package:fit_tool/src/field_definition.dart';
import 'package:test/test.dart';

void main() {
  group('Field tests', () {
    setUp(() {});

    test('Field definition conversions', () {
      final fd1 = FieldDefinition(id: 255, size: 20, type: BaseType.UINT16);
      final bytes1 = fd1.toBytes();
      final fd2 = FieldDefinition.fromBytes(bytes1);
      final bytes2 = fd2.toBytes();

      expect(bytes2, bytes1);
    });

    test('Field integer conversions', () {
      for (var type in BaseType.values) {
        if (type.isFloat() || type.isBig() || type.isString()) {
          continue;
        }
        final field = Field(type: type);
        var minValue = type.min;
        var maxValue = type.max;
        if (minValue != null && maxValue != null) {
          var value = minValue;
          var bytes = field.encodedValueToBytes(value);
          var valueFromBytes = field.getEncodedValueFromBytes(bytes);
          expect(valueFromBytes, value);

          value = maxValue;
          bytes = field.encodedValueToBytes(value);
          valueFromBytes = field.getEncodedValueFromBytes(bytes);
          expect(valueFromBytes, value);
        }
      }
    });

    test('Field string conversion', () {
      final field = Field(type: BaseType.STRING);
      var value = 'test12345';
      var bytes = field.encodedValueToBytes(value);
      var valueFromBytes = field.getEncodedValueFromBytes(bytes);
      expect(valueFromBytes, value);
    });

    test('Field float conversions', () {
      var field = Field(type: BaseType.FLOAT32);
      var value = 3.14;
      var bytes = field.encodedValueToBytes(value);
      var valueFromBytes = field.getEncodedValueFromBytes(bytes);
      var bytes2 = field.encodedValueToBytes(valueFromBytes);

      expect(valueFromBytes, closeTo(value, 3));
      expect(bytes2, bytes);

      field = Field(type: BaseType.FLOAT64);
      value = 3.14;
      bytes = field.encodedValueToBytes(value);
      valueFromBytes = field.getEncodedValueFromBytes(bytes);
      bytes2 = field.encodedValueToBytes(valueFromBytes);

      expect(valueFromBytes, closeTo(value, 3));
      expect(bytes2, bytes);
    });

    test('Field string toRow', () {
      final field = Field(name: 'title', type: BaseType.STRING, growable: true);
      var value = 'test12345';
      field.setEncodedValue(0, value);
      field.toRow();
    });
  });
}
