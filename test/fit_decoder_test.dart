@TestOn('vm')
import 'dart:io';

import 'package:test/test.dart';

// class RotSink extends ChunkedConversionSink<List<int>> {
//   final _key;
//   final ChunkedConversionSink<List<int>> _outSink;
//   RotSink(this._key, this._outSink);
//
//   @override
//   void add(List<int> data) {
//     addModifiable(Uint8List.fromList(data));
//   }
//
//   void addModifiable(List<int> data) {
//     for (var i = 0; i < data.length; i++) {
//       data[i] = (_key + data[i]) % 256;
//     }
//     _outSink.add(data);
//   }
//
//   @override
//   void close() {
//     _outSink.close();
//   }
// }
// class RotConverter extends Converter<List<int>, List<int>> {
//   const RotConverter(this._key);
//
//   final int _key;
//
//   @override
//   List<int> convert(List<int> data, { int? key }) {
//     key ??= _key;
//     var result = List<int>.filled(data.length, 0);
//     for (var i = 0; i < data.length; i++) {
//       result[i] = (data[i] + key) % 256;
//     }
//     return result;
//   }
// }
//
//
//
// class ToModifiableConverter extends Converter<List<int>, List<int>> {
//   @override
//   List<int> convert(List<int> data) => data;
//
//   @override
//   ToModifiableSink startChunkedConversion(RotSink sink) {
//     return ToModifiableSink(sink);
//   }
// }
//
// class ToModifiableSink extends ChunkedConversionSink<List<int>> {
//   final RotSink sink;
//   ToModifiableSink(this.sink);
//
//   @override
//   void add(List<int> data) { sink.addModifiable(data); }
//
//   @override
//   void close() { sink.close(); }
// }

void main() {
  group('FIT decoder tests', () {
    setUp(() {});

    test('decode', () async {
      //
      // final file = File('./test/data/Activity.fit');
      //
      //
      // // var lines = utf8.decoder
      // //     .bind(file.openRead())
      // //     .transform(LineSplitter());
      //
      //
      //
      // var messages = await FitDecoder().bind(file.openRead()).listen((message) {
      //   print('message: $message');
      // });
    });

    test('example', () async {
      final file = File('./test/data/Activity.fit');
      final outFile = File('./test/data/out.fit');
      final key = 30;
      //
      // await file
      //     .openRead()
      //     .transform(ToModifiableConverter().fuse(RotConverter(key)))
      //     .pipe(outFile.openWrite());
    });
  });
}
