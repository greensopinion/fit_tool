// milliseconds from Unix epoch (start of 1970) to Sun Dec 31 00:00:00 1989
const int millisecondsEpoch1989Delta = 631065600000;

///
int toSecondsSince1989Epoch(int millisecondsSinceEpoch) {
  final secondsSince1989Epoch =
      (millisecondsSinceEpoch - millisecondsEpoch1989Delta) ~/ 1000;
  return secondsSince1989Epoch;
}

///
int toMillisecondsSinceEpoch(int secondsSince1989Epoch) {
  final millisecondsSinceEpoch =
      secondsSince1989Epoch * 1000 + millisecondsEpoch1989Delta;
  return millisecondsSinceEpoch;
}

///
int toSemicircles(int degrees) {
  return (2147483648 * degrees / 180.0).round();
}

///
double toDegrees(int semicircles) {
  return (semicircles * 180.0) / 2147483648;
}
