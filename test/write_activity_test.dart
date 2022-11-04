@TestOn('vm')
import 'dart:io';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:fit_tool/fit_tool.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';

void main() {
  group('activity tests', () {
    setUp(() {
      Logger.level = Level.debug;
    });

    test('Write activity with developer data fields', () async {
      // We set autoDefine to true, so that the builder creates the required
      // Definition Messages for us.
      final builder = FitFileBuilder(autoDefine: true, minStringSize: 50);

      final fileIdMessage = FileIdMessage()
        ..type = FileType.activity
        ..manufacturer = Manufacturer.development.value
        ..product = 1231
        ..timeCreated = DateTime.now().millisecondsSinceEpoch
        ..serialNumber = 0x12345678;
      builder.add(fileIdMessage);

      final developerDataIndex = 0;
      var message = DeveloperDataIdMessage();
      message.applicationId = Uint8List.fromList([1, 2, 3, 4, 5, 6]);
      message.developerDataIndex = developerDataIndex;
      builder.add(message);

      // Define the developer field
      final doughnutsEarnedFieldName = 'doughnuts_earned';
      final doughnutsEarnedFieldUnits = 'doughnuts';
      final fieldDescriptionMessage = FieldDescriptionMessage();
      fieldDescriptionMessage.developerDataIndex = developerDataIndex;
      fieldDescriptionMessage.fieldDefinitionNumber = 0;
      fieldDescriptionMessage.fitBaseTypeId = BaseType.SINT8.value;
      fieldDescriptionMessage.fieldName = doughnutsEarnedFieldName;
      fieldDescriptionMessage.units = doughnutsEarnedFieldUnits;
      builder.add(fieldDescriptionMessage);

      // Define a float developer field
      final beersEarnedFieldName = 'beers_earned';
      final beersEarnedFieldUnits = 'beers';
      final fieldDescriptionMessage2 = FieldDescriptionMessage();
      fieldDescriptionMessage2.developerDataIndex = developerDataIndex;
      fieldDescriptionMessage2.fieldDefinitionNumber = 1;
      fieldDescriptionMessage2.fitBaseTypeId = BaseType.FLOAT32.value;
      fieldDescriptionMessage2.fieldName = beersEarnedFieldName;
      fieldDescriptionMessage2.units = beersEarnedFieldUnits;
      builder.add(fieldDescriptionMessage2);

      // Add a record message with an addition doughnuts earned developer field
      final devField1 = DeveloperField(
          developerDataIndex: developerDataIndex,
          id: 0,
          size: BaseType.SINT8.size,
          type: BaseType.SINT8);
      devField1.setValue(0, 5, null);

      final devField2 = DeveloperField(
          developerDataIndex: developerDataIndex,
          id: 1,
          size: BaseType.FLOAT32.size,
          type: BaseType.FLOAT32);
      devField2.setValue(0, .67, null);

      final recordMessage =
          RecordMessage(developerFields: [devField1, devField2]);
      recordMessage.distance = 0;
      recordMessage.power = 100;
      builder.add(recordMessage);

      /// Finally build the FIT file object and write it to a file
      final fitFile = builder.build();

      final outFile =
          await File('./test/out/activity_with_developer_fields.fit')
              .create(recursive: true);
      await outFile.writeAsBytes(fitFile.toBytes());

      final bytes = await outFile.readAsBytes();
      final fitFile2 = FitFile.fromBytes(bytes);

      final csvOutFile = File('./test/out/activity_with_developer_fields.csv');
      final csv = const ListToCsvConverter().convert(fitFile2.toRows());
      await csvOutFile.writeAsString(csv);
    });
  });
}
