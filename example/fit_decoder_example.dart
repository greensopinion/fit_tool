import 'dart:io';

import 'package:fit_tool/src/fit_decoder.dart';
import 'package:fit_tool/src/profile/messages/record_message.dart';

Future<void> main() async {
  final file = File('./test/data/palisade.fit');
  var byteStream = file.openRead();
  final messageStream = byteStream.transform(FitDecoder());

  // Filter stream to retrieve only Record messages, then
  // extract lat,lon position.
  await messageStream
      .where((message) => message is RecordMessage)
      .forEach((message) {
    message as RecordMessage;
    if (message.positionLat != null && message.positionLong != null) {
      print('position: ${message.positionLat}, ${message.positionLong}');
    }
  });
}
