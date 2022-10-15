import 'package:logger/logger.dart';

var logger = createDefaultLogger();

Logger createDefaultLogger() => Logger(
      printer: PrettyPrinter(methodCount: 2),
      // printer: SimplePrinter(),
    );

class LogMessage {
  final String Function() lazyMessage;

  LogMessage(this.lazyMessage);

  @override
  String toString() => lazyMessage();
}
