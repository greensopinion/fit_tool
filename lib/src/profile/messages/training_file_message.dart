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

class TrainingFileMessage extends DataMessage {

   TrainingFileMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: TrainingFileMessage.NAME,
            globalId: TrainingFileMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              TimestampField(
                  size: definitionMessage?.getFieldDefinition(TimestampField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TrainingFileTypeField(
                  size: definitionMessage?.getFieldDefinition(TrainingFileTypeField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TrainingFileManufacturerField(
                  size: definitionMessage?.getFieldDefinition(TrainingFileManufacturerField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TrainingFileProductField(
                  size: definitionMessage?.getFieldDefinition(TrainingFileProductField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TrainingFileSerialNumberField(
                  size: definitionMessage?.getFieldDefinition(TrainingFileSerialNumberField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              TrainingFileTimeCreatedField(
                  size: definitionMessage?.getFieldDefinition(TrainingFileTimeCreatedField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 72;
  static const NAME = 'training_file';

  final bool growable;

  static TrainingFileMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = TrainingFileMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }


  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
  int? get timestamp {
     final field = getField(TimestampField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
   set timestamp(int? value) {
    final field = getField(TimestampField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  FileType? get type {
     final field = getField(TrainingFileTypeField.ID);
 if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      final value = field.getValue(subField: subField);
      if (value == null) {
        return null;
      }
      return FileTypeExt.fromValue(value);
    } else {
      return null;
    }
  }
   set type(FileType? value) {
    final field = getField(TrainingFileTypeField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value.value, subField);
      }
    }
  }
  int? get manufacturer {
     final field = getField(TrainingFileManufacturerField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set manufacturer(int? value) {
    final field = getField(TrainingFileManufacturerField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get product {
     final field = getField(TrainingFileProductField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set product(int? value) {
    final field = getField(TrainingFileProductField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get faveroProduct {
     final field = getField(TrainingFileProductField.ID);
     final typeField = getField(TrainingFileManufacturerField.ID);

     final isSubFieldValid = typeField != null && [263].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField:subField);
    } else {
      return null;
    }
  }

  set faveroProduct(int? value) {
    final field = getField(TrainingFileProductField.ID);
       if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }

  int? get garminProduct {
     final field = getField(TrainingFileProductField.ID);
     final typeField = getField(TrainingFileManufacturerField.ID);

     final isSubFieldValid = typeField != null && [1, 15, 13, 89].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField:subField);
    } else {
      return null;
    }
  }

  set garminProduct(int? value) {
    final field = getField(TrainingFileProductField.ID);
       if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  int? get serialNumber {
     final field = getField(TrainingFileSerialNumberField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set serialNumber(int? value) {
    final field = getField(TrainingFileSerialNumberField.ID);

    if (field != null) {
      if (value == null) {
        field.clear();
      } else {
        var subField = field.getValidSubField(fields);
        field.setValue(0, value, subField);
      }
    }
  }
  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
  int? get timeCreated {
     final field = getField(TrainingFileTimeCreatedField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
  // timestamp : milliseconds from January 1st, 1970 at 00:00:00 UTC
   set timeCreated(int? value) {
    final field = getField(TrainingFileTimeCreatedField.ID);

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



class TrainingFileTypeField extends Field {
 TrainingFileTypeField({int size = 0, bool growable = true})
      : super(
            name: 'type',
            id: ID,
            type: BaseType.ENUM,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 0;
}
class TrainingFileManufacturerField extends Field {
 TrainingFileManufacturerField({int size = 0, bool growable = true})
      : super(
            name: 'manufacturer',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 1;
}
class TrainingFileProductField extends Field {
 TrainingFileProductField({int size = 0, bool growable = true})
      : super(
            name: 'product',
            id: ID,
            type: BaseType.UINT16,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
       SubField(
                  name: 'favero_product',
                  type: BaseType.UINT16,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                  TrainingFileManufacturerField.ID: [263]
                  }),
       SubField(
                  name: 'garmin_product',
                  type: BaseType.UINT16,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                  TrainingFileManufacturerField.ID: [1, 15, 13, 89]
                  })
            ]
 );

  static const ID = 2;
}
class TrainingFileSerialNumberField extends Field {
 TrainingFileSerialNumberField({int size = 0, bool growable = true})
      : super(
            name: 'serial_number',
            id: ID,
            type: BaseType.UINT32Z,
            offset: 0,
            scale: 1,
            size: size,
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 3;
}
class TrainingFileTimeCreatedField extends Field {
 TrainingFileTimeCreatedField({int size = 0, bool growable = true})
      : super(
            name: 'time_created',
            id: ID,
            type: BaseType.UINT32,
            offset: -631065600000,
            scale: 0.001,
            size: size,
            units: 'ms',
            mainTypeName: 'date_time',
            growable: growable,
            subFields: [
            ]
 );

  static const ID = 4;
}