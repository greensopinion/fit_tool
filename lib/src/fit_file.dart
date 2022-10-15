import 'dart:math';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:fit_tool/src/utils/logger.dart';
import 'package:logger/logger.dart';

import 'base_type.dart';
import 'definition_message.dart';
import 'developer_field.dart';
import 'fit_file_header.dart';
import 'profile/messages/field_description_message.dart';
import 'record.dart';
import 'utils/crc.dart';

Function listEqual = const ListEquality().equals;

class FitFile {
  FitFile(this.header, this.records, this.crc);

  final FitFileHeader header;
  final List<Record> records;
  int? crc; //crc16 of header and records

  Uint8List toBytes({checkCrc = true}) {
    var calculatedCrc = 0;
    final builder = BytesBuilder();

    final bytes = header.toBytes();
    calculatedCrc = crc16(bytes, initial: calculatedCrc);
    builder.add(bytes);

    for (var record in records) {
      final bytes = record.toBytes();
      calculatedCrc = crc16(bytes, initial: calculatedCrc);
      builder.add(bytes);
    }

    crc ??= calculatedCrc;

    if (crc != 0 && crc != calculatedCrc) {
      final message = 'Calculated crc ($calculatedCrc) != defined crc ($crc)';
      if (checkCrc) {
        throw Exception(message);
      } else {
        logger.w(message);
      }
    }

    final bd = ByteData(2);
    bd.setUint16(0, crc!, Endian.little);
    builder.add(bd.buffer.asUint8List());

    return builder.toBytes();
  }

  List<List<dynamic>> toRows() {
    final result = <List<dynamic>>[];

    var maxColumns = 0;
    for (var record in records) {
      final row = record.toRow();
      maxColumns = max(maxColumns, row.length);
      result.add(row);
    }

    // Add header
    final headerRow = ['Type', 'Local ID', 'Message'];

    final maxFields = ((maxColumns - 3) / 3).round();
    for (var i = 0; i < maxFields; i++) {
      headerRow.addAll(['Field $i', 'Value $i', 'Units $i']);
    }

    result.insert(0, headerRow);

    return result;
  }

  static FitFile fromBytes(Uint8List bytes,
      {checkCrc = true, checkRecords = false}) {
    var byteOffset = 0;
    var crc = 0;

    final headerSize = bytes[0];
    final headerBytes =
        Uint8List.sublistView(bytes, byteOffset, byteOffset + headerSize);
    final header = FitFileHeader.fromBytes(headerBytes);
    crc = crc16(headerBytes, initial: crc);
    byteOffset += header.size;

    final records = <Record>[];
    final definitionMessageMap = <int, DefinitionMessage>{};
    final developerFieldsById = <int, Map<int, DeveloperField>>{};

    var recordIndex = 0;
    var recordBytesRemainingCount = header.recordsSize;
    while (recordBytesRemainingCount > 0) {
      // print('Record $recordIndex');
      final remainingBytes = Uint8List.sublistView(bytes, byteOffset);

      final record = Record.fromBytes(definitionMessageMap, remainingBytes,
          developerFieldsById: developerFieldsById);

      if (record.isDefinition) {
        definitionMessageMap[record.localId] =
            record.message as DefinitionMessage;
      } else if (record.message is FieldDescriptionMessage) {
        final message = record.message as FieldDescriptionMessage;

        //TODO(mkt): more work is needed here for more complicated dynamic fields.
        final developerField = DeveloperField(
          developerDataIndex: message.developerDataIndex ?? 0,
          id: message.fieldDefinitionNumber ?? 0,
          name: message.name,
          type: BaseTypeExtension.fromValue(message.fitBaseTypeId ?? 0),
          scale: message.scale?.toDouble(),
          offset: message.offset?.toDouble(),
          units: message.units ?? '',
        );
        if (developerFieldsById[developerField.developerDataIndex] == null) {
          developerFieldsById[developerField.developerDataIndex] = {};
        }
        developerFieldsById[developerField.developerDataIndex]![
            developerField.id] = developerField;
      }

      records.add(record);

      final definitionMessage = definitionMessageMap[record.localId];
      final recordSize = record.size;
      final definedSize = record.definedSize(definitionMessage!);

      crc = crc16(
          Uint8List.sublistView(bytes, byteOffset, byteOffset + definedSize),
          initial: crc);

      if (recordSize != definedSize) {
        logger.w(LogMessage(() =>
            'Record $recordIndex, ${record.message}: size ($recordSize) != defined size ($definedSize). Some fields were not read correctly.'));
      }

      if (checkRecords && Logger.level.index >= Level.warning.index) {
        final actualBytes =
            Uint8List.sublistView(remainingBytes, 0, definedSize);
        final recordBytes = record.toBytes();

        if (!listEqual(actualBytes, recordBytes)) {
          logger.w(
              '- $recordIndex -\nactual: $actualBytes\nrecord: $recordBytes');
          logger.w(LogMessage(() =>
              '- $recordIndex -\nactual: $actualBytes\nrecord: $recordBytes'));
        }
      }

      recordBytesRemainingCount -= definedSize;
      byteOffset += definedSize;

      recordIndex++;
    }

    final byteData = ByteData.sublistView(bytes, byteOffset, byteOffset + 2);
    final fileCrc = byteData.getUint16(0, Endian.little);

    if (crc != fileCrc) {
      final message =
          'Calculated crc (0x${crc.toRadixString(16)}) does match crc in file (0x${fileCrc.toRadixString(16)}).';
      if (checkCrc) {
        throw Exception(message);
      } else {
        logger.w(message);
      }
    }

    return FitFile(header, records, crc);
  }
}
