import 'dart:typed_data';

import 'data_message.dart';
import 'definition_message.dart';
import 'field.dart';

class GenericMessage extends DataMessage {
  GenericMessage({
    required definitionMessage,
    developerFields,
  })  : growable = false,
        super(
            name: GenericMessage.NAME,
            globalId: definitionMessage.globalId,
            localId: definitionMessage.localId,
            endian: definitionMessage.endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: definitionMessage.fieldDefinitions
                .map<Field>((fieldDefinition) =>
                    Field.fromFieldDefinition(fieldDefinition))
                .toList());

  static const NAME = 'generic';

  final bool growable;

  static GenericMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = GenericMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }
}
