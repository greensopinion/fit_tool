import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:fit_tool/src/profile/messages/field_description_message.dart';
import 'package:fit_tool/src/profile/messages/workout_step_message.dart';
import 'package:fit_tool/src/record.dart';
import 'package:fit_tool/src/utils/crc.dart';

import 'base_type.dart';
import 'definition_message.dart';
import 'developer_field.dart';
import 'fit_file.dart';
import 'fit_file_header.dart';

class FitDecoder extends Converter<List<int>, Message> {
  FitDecoder({this.checkCrc = true});

  final bool checkCrc;

  @override
  Message convert(List<int> input) {
    return WorkoutStepMessage();
  }

  @override
  Sink<List<int>> startChunkedConversion(Sink<Message> sink) {
    return MessageConversionSink(sink, checkCrc: checkCrc);
  }

  @override
  Stream<Message> bind(Stream<List<int>> stream) => super.bind(stream);
}

class MessageConversionSink extends ByteConversionSink {
  MessageConversionSink(this._outSink, {this.checkCrc = true});

  final Sink<Message> _outSink;
  final bool checkCrc;
  var crc = 0;
  final headerBuilder = BytesBuilder();
  var bytesCount = 0;
  var chunkCount = 0;

  var headerSize = 0;
  FitFileHeader? header;

  int recordIndex = 0;
  int recordsBytesRemainingCount = 0;
  var partialBytes = Uint8List(0);

  final definitionMessageMap = <int, DefinitionMessage>{};
  final developerFieldsById = <int, DeveloperField>{};

  int? fileCrc;

  @override
  void add(List<int> chunk) {
    if (chunk.isEmpty) {
      return;
    }

    var byteOffset = 0;
    var bytesRemainingCount = chunk.length;
    final chunkBytes = Uint8List.fromList(chunk);

    final Uint8List combinedBytes;

    if (partialBytes.isNotEmpty) {
      var bb = BytesBuilder();
      bb.add(partialBytes);
      bb.add(chunkBytes);
      combinedBytes = bb.toBytes();
      partialBytes = Uint8List(0);
    } else {
      combinedBytes = Uint8List.sublistView(chunkBytes);
    }

    if (header == null) {
      if (chunkCount == 0) {
        headerSize = chunk[0];
      }

      var bytesNeededCount = headerSize - headerBuilder.length;
      var bytesAddedCount = min(bytesNeededCount, bytesRemainingCount);
      headerBuilder.add(
          Uint8List.sublistView(combinedBytes, byteOffset, bytesAddedCount));
      byteOffset += bytesAddedCount;
      bytesRemainingCount -= combinedBytes.length - byteOffset;

      if (headerBuilder.length == headerSize) {
        final headerBytes = headerBuilder.toBytes();
        header = FitFileHeader.fromBytes(headerBytes);
        crc = crc16(headerBytes, initial: crc);
        recordsBytesRemainingCount = header!.recordsSize;
      }
    }

    if (header != null) {
      while (bytesRemainingCount > 0 && recordsBytesRemainingCount > 0) {
        // read records
        final bytes = Uint8List.sublistView(combinedBytes, byteOffset);

        try {
          final record = Record.fromBytes(definitionMessageMap, bytes,
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
              type: BaseTypeExtension.fromValue(message.fitBaseTypeId ?? 0),
              scale: message.scale,
              offset: message.offset,
              units: message.units,
            );
            developerFieldsById[developerField.id] = developerField;
          }

          final definitionMessage = definitionMessageMap[record.localId];
          final recordSize = record.size;
          final definedSize = record.definedSize(definitionMessage!);
          final recordSize1 = record.toBytes().length;

          if (recordSize != definedSize || recordSize != recordSize1) {
            print(
                'Warning: record $recordIndex, ${record.message}: size ($recordSize) != defined size ($definedSize). Some fields were not read correctly.');
          }

          final actualBytes = Uint8List.sublistView(bytes, 0, definedSize);
          crc = crc16(actualBytes, initial: crc);
          recordsBytesRemainingCount -= definedSize;

          if (true) {
            final recordBytes = record.toBytes();

            if (!listEqual(actualBytes, recordBytes)) {
              print('- $recordIndex -');
              print('actual: $actualBytes');
              print('record: $recordBytes');
            }
          }

          byteOffset += definedSize;
          bytesRemainingCount = combinedBytes.length - byteOffset;

          recordIndex++;

          _outSink.add(record.message);
        } catch (error) {
          // partial record
          // print(error);
          partialBytes = combinedBytes.sublist(byteOffset);
          break;
        }
      }
    }

    if (header != null &&
        recordsBytesRemainingCount == 0 &&
        fileCrc == null &&
        bytesRemainingCount > 0) {
      // read crc
      if (bytesRemainingCount == 2) {
        final byteData = ByteData.sublistView(combinedBytes, byteOffset);
        fileCrc = byteData.getUint16(0, Endian.little);

        if (crc != fileCrc) {
          final message =
              'Calculated crc (0x${crc.toRadixString(16)}) does match crc in file (0x${fileCrc!.toRadixString(16)}).';
          if (checkCrc) {
            throw Exception(message);
          } else {
            print(message);
          }
        }
      } else {
        partialBytes = combinedBytes.sublist(byteOffset);
      }
    }

    chunkCount += 1;
    bytesCount += chunk.length;
  }

  @override
  void close() {
    _outSink.close();
  }

  @override
  void addSlice(List<int> chunk, int start, int end, bool isLast) {}
}
