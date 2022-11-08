import 'dart:typed_data';

import 'package:fit_tool/src/base_type.dart';
import 'package:fit_tool/src/field.dart';
import 'package:fit_tool/src/field_definition.dart';
import 'package:fixnum/fixnum.dart';
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

    test('Field 64 bit conversions', () {
      var field = Field(type: BaseType.SINT64);
      var bigIntValue = BigInt.from(-1);
      var bytes = field.encodedValueToBytes(bigIntValue);
      var valueFromBytes = field.getEncodedValueFromBytes(bytes);
      var bytes2 = field.encodedValueToBytes(valueFromBytes);

      expect(valueFromBytes, bigIntValue);
      expect(bytes2, bytes);

      field = Field(type: BaseType.UINT64);
      bigIntValue = BigInt.from(-1).toUnsigned(64);
      bytes = field.encodedValueToBytes(bigIntValue);
      valueFromBytes = field.getEncodedValueFromBytes(bytes);
      bytes2 = field.encodedValueToBytes(valueFromBytes);

      expect(valueFromBytes, bigIntValue);
      expect(bytes2, bytes);

      field = Field(type: BaseType.UINT64);
      bigIntValue = BigInt.from(-1).toUnsigned(64);
      bytes = field.encodedValueToBytes(bigIntValue, endian: Endian.big);
      valueFromBytes =
          field.getEncodedValueFromBytes(bytes, endian: Endian.big);
      bytes2 = field.encodedValueToBytes(valueFromBytes);

      expect(valueFromBytes, bigIntValue);
      expect(bytes2, bytes);
    });

    test('Field string toRow', () {
      final field = Field(name: 'title', type: BaseType.STRING, growable: true);
      var value = 'test12345';
      field.setEncodedValue(0, value);
      field.toRow();
    });

    test('Bigint conversions', () {
      final value = Int64.parseRadix('ffffffffffffffff', 16);
      final bigValue = BigInt.parse(value.toString()).toUnsigned(64);
      expect(BigInt.parse('18446744073709551615'), bigValue);
    });

    test('Array field encoding', () {
      final field = Field(
          name: 'title',
          type: BaseType.UINT32,
          offset: 0.0,
          scale: 1000.0,
          units: 's',
          growable: true);
      field.setValues([1.0, 2.0, 3.0]);

      expect(field.encodedValues, [1000, 2000, 3000]);
    });
  });
}
