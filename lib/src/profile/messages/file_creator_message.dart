/// Autogenerated. Do not modify.
///
/// Profile: 21.60
import 'dart:typed_data';

import '../../base_type.dart';
import '../../data_message.dart';
import '../../definition_message.dart';
import '../../field.dart';
import '../../sub_field.dart';
import '../profile_type.dart';
import 'common_fields.dart';

class FileCreatorMessage extends DataMessage {

   FileCreatorMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: FileCreatorMessage.NAME,
            globalId: FileCreatorMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              FileCreatorSoftwareVersionField(
                  size: definitionMessage?.getFieldDefinition(FileCreatorSoftwareVersionField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              FileCreatorHardwareVersionField(
                  size: definitionMessage?.getFieldDefinition(FileCreatorHardwareVersionField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 49;
  static const NAME = 'file_creator';

  final bool growable;

  static FileCreatorMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = FileCreatorMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }


  int? get softwareVersion {
     final field = getField(FileCreatorSoftwareVersionField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set softwareVersion(int? value) {
    final field = getField(FileCreatorSoftwareVersionField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get hardwareVersion {
     final field = getField(FileCreatorHardwareVersionField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set hardwareVersion(int? value) {
    final field = getField(FileCreatorHardwareVersionField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }



}



class FileCreatorSoftwareVersionField extends Field {
 FileCreatorSoftwareVersionField({int size = 0, bool growable = true})
      : super(
            name: 'software_version',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 0;
}
class FileCreatorHardwareVersionField extends Field {
 FileCreatorHardwareVersionField({int size = 0, bool growable = true})
      : super(
            name: 'hardware_version',
            id: ID,
            type: BaseType.UINT8,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 1;
}