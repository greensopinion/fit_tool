import 'package:test/test.dart';

void main() {
  group('FIT tests', () {
    setUp(() {});

    // test('String Conversion', () {
    //   var encoded = utf8.encode('test');
    //
    //   var test2 = <int>[];
    //   test2.addAll(encoded);
    //   test2.add(0);
    //   test2.addAll(encoded);
    //
    //   var output = utf8.decode(test2, allowMalformed: true);
    //
    //   final strings = output.split('\u0000');
    //   print('output: $output $strings');
    // });

    //
    // test('uint8list', () {
    //   final bytes1 = Uint8List.fromList([1,2,3,4]);
    //
    //   final bytes2 = Uint8List.sublistView(bytes1, 2);
    //   bytes2[0] = 0xff;
    //   print(bytes1);
    //
    //   print(bytes2);
    // });
    //

    test('uint8list', () {
      // var index = 0;
      // Sink<String> outSink = ChunkedConversionSink<String>.withCallback((chunks) {
      //   print('$index: [${chunks.join(',')}]');
      //   index++;
      // });
      //
      // var inSink = utf8.decoder.startChunkedConversion(outSink);
      // var list = [0xF0, 0x9D];
      // inSink.addSlice(list, 0, 2, false);
      // // Since we used `addSlice` we are allowed to reuse the list.
      // list[0] = 0x85;
      // list[1] = 0xA1;
      // inSink.addSlice(list, 0, 2, true);
      //
      //
      //
      //
      // final file = File('./test/data/Activity.fit');
      //
      // file.openRead().transform(streamTransformer)

      // var lines = utf8.decoder
      //     .bind(file.openRead());
      //
      //
      // Map<String, dynamic> user = jsonDecode('{}');
    });
  });
}
