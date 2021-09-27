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

class SlaveDeviceMessage extends DataMessage {

   SlaveDeviceMessage(
      {definitionMessage, developerFields, int localId = 0, Endian endian = Endian.little})
      : growable = definitionMessage == null,
        super(
            name: SlaveDeviceMessage.NAME,
            globalId: SlaveDeviceMessage.ID,
            localId: definitionMessage?.localId ?? localId,
            endian: definitionMessage?.endian ?? endian,
            definitionMessage: definitionMessage,
            developerFields: developerFields,
            fields: [
              SlaveDeviceManufacturerField(
                  size: definitionMessage?.getFieldDefinition(SlaveDeviceManufacturerField.ID)?.size ?? 0,
                  growable: definitionMessage == null),
              SlaveDeviceProductField(
                  size: definitionMessage?.getFieldDefinition(SlaveDeviceProductField.ID)?.size ?? 0,
                  growable: definitionMessage == null)
            ]);

  static const ID = 106;
  static const NAME = 'slave_device';

  final bool growable;

  static SlaveDeviceMessage fromBytes(
      DefinitionMessage definitionMessage, Uint8List bytes) {
    final message = SlaveDeviceMessage(definitionMessage: definitionMessage);
    message.readFromBytes(bytes);
    return message;
  }


  int? get manufacturer {
     final field = getField(SlaveDeviceManufacturerField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set manufacturer(int? value) {
    final field = getField(SlaveDeviceManufacturerField.ID);

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
     final field = getField(SlaveDeviceProductField.ID);
    if (field != null && field.isValid()) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField: subField);
    } else {
      return null;
    }
  }
   set product(int? value) {
    final field = getField(SlaveDeviceProductField.ID);

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
     final field = getField(SlaveDeviceProductField.ID);
     final typeField = getField(SlaveDeviceManufacturerField.ID);

     final isSubFieldValid = typeField != null && [263].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField:subField);
    } else {
      return null;
    }
  }

  set faveroProduct(int? value) {
    final field = getField(SlaveDeviceProductField.ID);
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
     final field = getField(SlaveDeviceProductField.ID);
     final typeField = getField(SlaveDeviceManufacturerField.ID);

     final isSubFieldValid = typeField != null && [1, 15, 13, 89].contains(typeField.getValue());
    if (field != null && field.isValid() && isSubFieldValid) {
      var subField = field.getValidSubField(fields);
      return field.getValue(subField:subField);
    } else {
      return null;
    }
  }

  set garminProduct(int? value) {
    final field = getField(SlaveDeviceProductField.ID);
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



class SlaveDeviceManufacturerField extends Field {
 SlaveDeviceManufacturerField({int size = 0, bool growable = true})
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

  static const ID = 0;
}
class SlaveDeviceProductField extends Field {
 SlaveDeviceProductField({int size = 0, bool growable = true})
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
                  SlaveDeviceManufacturerField.ID: [263]
                  }),
       SubField(
                  name: 'garmin_product',
                  type: BaseType.UINT16,
                  scale: 1,
                  offset: 0,
                  referenceMap: {
                  SlaveDeviceManufacturerField.ID: [1, 15, 13, 89]
                  })
            ]
 );

  static const ID = 1;
}