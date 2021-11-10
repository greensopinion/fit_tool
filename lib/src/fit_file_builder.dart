import 'data_message.dart';
import 'definition_message.dart';
import 'fit_file.dart';
import 'fit_file_header.dart';
import 'record.dart';
import 'utils/crc.dart';

class FitFileBuilder {
  FitFileBuilder({this.autoDefine = true, this.minStringSize = 0});

  final autoDefine;
  final minStringSize;

  final List<Record> records = [];

  // map from localId to definition message
  final definitionMap = <int, DefinitionMessage>{};

  void add(Message message) {
    if (message is DataMessage) {
      var storedDefinition = definitionMap[message.localId];

      if (storedDefinition == null) {
        if (autoDefine) {
          final newDefinition = DefinitionMessage.fromDataMessage(message,
              minStringSize: minStringSize);
          definitionMap[message.localId] = newDefinition;
          records.add(Record.fromMessage(newDefinition));
        } else {
          throw Exception(
              'Message has not been defined: ${message.name} localId: ${message.localId}');
        }
      } else {
        final newDefinition = DefinitionMessage.fromDataMessage(message,
            minStringSize: minStringSize);
        if (!storedDefinition.supports(newDefinition)) {
          if (autoDefine) {
            definitionMap[newDefinition.localId] = newDefinition;
            records.add(Record.fromMessage(newDefinition));
          } else {
            throw Exception(
                'The definition does not support this message. record:${records.length + 1} name:${message.name} localId:${message.localId}');
          }
        }
      }

      if (message.definitionMessage == null) {
        message.setDefinitionMessage(definitionMap[message.localId]!);
      }
    } else if (message is DefinitionMessage) {
      definitionMap[message.localId] = message;
    }

    final record = Record.fromMessage(message);
    records.add(record);
  }

  void addAll(List<Message> messages) {
    for (var message in messages) {
      add(message);
    }
  }

  FitFile build() {
    final header = FitFileHeader(recordsSize: _calcRecordsSize(records));

    final crc = _calcCrc(header, records);
    return FitFile(header, records, crc);
  }

  int _calcCrc(FitFileHeader header, List<Record> records) {
    var crc = 0;
    crc = crc16(header.toBytes(), initial: crc);

    for (var record in records) {
      crc = crc16(record.toBytes(), initial: crc);
    }
    return crc;
  }

  int _calcRecordsSize(List<Record> records) {
    var size = 0;
    for (var record in records) {
      size += record.size;
    }
    return size;
  }
}
