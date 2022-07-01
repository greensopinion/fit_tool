import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:stream_channel/stream_channel.dart';

// Once the hybrid isolate starts, it will call the special function
// hybridMain() with a StreamChannel that's connected to the channel
// returned spawnHybridCode().
void hybridMain(StreamChannel channel) async {
  final overrideHeaders = {
    ACCESS_CONTROL_ALLOW_ORIGIN: 'localhost',
    'Content-Type': 'application/json;charset=utf-8'
  };

  var handler = const Pipeline()
      .addMiddleware(corsHeaders(headers: overrideHeaders))
      .addHandler(_fileRequest);

  final address = 'localhost';
  // Start the file server
  var server = await io.serve(handler, address, 0);

  final fqdn = '$address:${server.port}';
  print('File server ready at $fqdn');

  // Send the port number of the WebSocket server to the browser test, so
  // it knows what to connect to.
  channel.sink.add(server.port);
}

Future<Response> _fileRequest(Request request) async {
  final filename = request.url.pathSegments.last;
  final file = File('./test/data/sdk/$filename');
  final bytes = await file.readAsBytes();

  final response = Response.ok(bytes);

  return response;
}
