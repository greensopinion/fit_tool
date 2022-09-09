import 'dart:typed_data';

import 'data_message.dart';
import 'definition_message.dart';
import 'developer_field.dart';

class RecordHeader {
  RecordHeader(
      {this.isTimeCompressed = false,
      this.isDefinition = true,
      this.hasDeveloperFields = false,
      this.localId = 0,
      this.timeOffsetSeconds = 0}) {
    if (!isTimeCompressed && (localId < 0 || localId > maxNormalLocalId)) {
      throw ArgumentError.value(localId, 'localId');
    }

    if (isTimeCompressed &&
        (localId < 0 || localId > maxTimeCompressedLocalId)) {
      throw ArgumentError.value(localId, 'localId');
    }
  }

  final bool
      isTimeCompressed; // time compressed  if true, otherwise normal header
  final bool
      isDefinition; // if true body contains a definition message, otherwise  body contains a data message
  final bool
      hasDeveloperFields; // if true messages also contain developer fields
  final int localId;
  final int timeOffsetSeconds; // only valid if this is a time compressed header

  static const isTimeCompressedBitMask = 0x80; // bits 7
  static const isDefinitionBitMask = 0x40; // bits 6
  static const hasDeveloperFieldsBitMask = 0x20; // bits 5

  static const normalLocalIdBitMask = 0x0f; // bits 0-3
  static const timeCompressedLocalIdBitMask = 0x60; // bits 5-6 (0b0110 0000)
  static const timeOffsetBitMask = 0x1f; // bits 0-4 (0b0001 1111)

  static const maxNormalLocalId = 15;
  static const maxTimeCompressedLocalId = 3;
  static const headerSize = 1;

  int get size => headerSize;

  static RecordHeader fromBytes(Uint8List bytes) {
    final byte = bytes[0];

    final isTimeCompressed =
        (byte & isTimeCompressedBitMask) == isTimeCompressedBitMask;
    if (isTimeCompressed) {
      final localId = (byte & timeCompressedLocalIdBitMask) >> 5;
      final timeOffsetSeconds = byte & timeOffsetBitMask;

      return RecordHeader(
          isTimeCompressed: true,
          localId: localId,
          timeOffsetSeconds: timeOffsetSeconds);
    } else {
      final isDefinition = (byte & isDefinitionBitMask) == isDefinitionBitMask;
      final hasDeveloperFields =
          (byte & hasDeveloperFieldsBitMask) == hasDeveloperFieldsBitMask;
      final localId = byte & normalLocalIdBitMask;

      return RecordHeader(
          isDefinition: isDefinition,
          hasDeveloperFields: hasDeveloperFields,
          localId: localId);
    }
  }

  Uint8List toBytes() {
    var byte = 0x00;

    if (isTimeCompressed) {
      byte |= isTimeCompressedBitMask;
      byte |= (localId << 5) & timeCompressedLocalIdBitMask;
      byte |= timeOffsetSeconds & timeOffsetBitMask;
    } else {
      // normal header
      if (isDefinition) {
        byte |= isDefinitionBitMask;
        if (hasDeveloperFields) {
          byte |= hasDeveloperFieldsBitMask;
        }
      }
      byte |= (localId & normalLocalIdBitMask);
    }

    final bb = BytesBuilder()..addByte(byte);
    return bb.toBytes();
  }

  static RecordHeader fromMessage(Message message) {
    final hasDeveloperFields =
        message is DefinitionMessage && message.hasDeveloperFields();
    final timeOffsetSeconds = 0;

    return RecordHeader(
        isTimeCompressed: false,
        isDefinition: message is DefinitionMessage,
        hasDeveloperFields: hasDeveloperFields,
        localId: message.localId,
        timeOffsetSeconds: timeOffsetSeconds);
  }

  List<dynamic> toRow() {
    final headerString = isDefinition ? 'Definition' : 'Data';
    return [headerString, localId];
  }
}

class Record {
  Record(this.header, this.message);

  final RecordHeader header;
  final Message message;

  int get localId => header.localId;

  bool get isDefinition => header.isDefinition;

  int get size => header.size + message.size;

  Uint8List toBytes() {
    final bb = BytesBuilder();
    bb.add(header.toBytes());
    bb.add(message.toBytes());

    return bb.toBytes();
  }

  List<dynamic> toRow() {
    final row = <dynamic>[];
    row.addAll(header.toRow());
    row.addAll(message.toRow());
    return row;
  }

  static Record fromMessage(Message message) {
    final header = RecordHeader.fromMessage(message);
    return Record(header, message);
  }

  static Record fromBytes(
      Map<int, DefinitionMessage> definitionMessageMap, Uint8List bytes,
      {Map<int, Map<int, DeveloperField>> developerFieldsById = const {}}) {
    final header = RecordHeader.fromBytes(bytes);

    final messageBytes = bytes.sublist(RecordHeader.headerSize);
    final Message message;
    if (header.isDefinition) {
      message = DefinitionMessage.fromBytes(messageBytes,
          hasDeveloperFields: header.hasDeveloperFields);
    } else {
      final definitionMessage = definitionMessageMap[header.localId];
      if (definitionMessage == null) {
        throw Exception(
            'DefinitionMessage not defined for localId: ${header.localId}');
      }
      final developerFields =
          definitionMessage.getDeveloperFields(developerFieldsById);
      message = DataMessage.fromBytes(
          definitionMessage, developerFields, messageBytes);
    }

    return Record(header, message);
  }

  int definedSize(DefinitionMessage? definitionMessage) {
    if (header.isDefinition) {
      return size;
    } else {
      if (definitionMessage == null) {
        return 0;
      } else {
        return header.size + definitionMessage.definedDataSize;
      }
    }
  }
}
