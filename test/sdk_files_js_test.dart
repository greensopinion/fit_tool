@TestOn('js')
import 'package:csv/csv.dart';
import 'package:fit_tool/src/fit_file.dart';
import 'package:http/http.dart' as http;
import 'package:stream_channel/stream_channel.dart';
import 'package:test/test.dart';

void main() {
  late StreamChannel channel;
  late int port;

  group('SDK decode files tests', () {
    setUpAll(() async {
      channel = spawnHybridUri('file_server.dart');

      // Get the port for the WebSocket server from the hybrid isolate.
      port = await channel.stream.first;
    });

    ///
    /// DEVELOPER DATA
    ///
    test('Decode developer data file', () async {
      final url = Uri.parse('http://localhost:$port/DeveloperData.fit');
      final response = await http.get(url);

      FitFile.fromBytes(response.bodyBytes);
    });

    ///
    /// ACTIVITY
    ///
    test('Decode activity file', () async {
      final url = Uri.parse('http://localhost:$port/Activity.fit');
      final response = await http.get(url);
      final fitFile = FitFile.fromBytes(response.bodyBytes);

      const ListToCsvConverter().convert(fitFile.toRows());
    });

    // test('Decode link activity file', () async {
    //
    //   final url = Uri.parse('http://localhost:$port/palisade.fit');
    //   final response = await http.get(url);
    //   final fitFile = FitFile.fromBytes(response.bodyBytes);
    //
    //   final csv = const ListToCsvConverter().convert(fitFile.toRows());
    //   print(csv);
    // });

    test('Decode activity low battery file', () async {
      final url = Uri.parse('http://localhost:$port/activity_lowbattery.fit');
      final response = await http.get(url);
      final fitFile = FitFile.fromBytes(response.bodyBytes);

      const ListToCsvConverter().convert(fitFile.toRows());
    });

    test('Decode activity multisport file', () async {
      final url = Uri.parse('http://localhost:$port/activity_multisport.fit');
      final response = await http.get(url);
      final fitFile = FitFile.fromBytes(response.bodyBytes);

      const ListToCsvConverter().convert(fitFile.toRows());
    });

    test('Decode activity pool swim with hr file', () async {
      final url =
          Uri.parse('http://localhost:$port/activity_poolswim_with_hr.fit');
      final response = await http.get(url);
      final fitFile = FitFile.fromBytes(response.bodyBytes);
      const ListToCsvConverter().convert(fitFile.toRows());
    });

    test('Decode activity pool swim file', () async {
      final url = Uri.parse('http://localhost:$port/activity_poolswim.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    test('Decode activity truncated', () async {
      final url = Uri.parse('http://localhost:$port/activity_truncated.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    ///
    /// MISC
    ///
    test('Decode monitoring file', () async {
      final url = Uri.parse('http://localhost:$port/MonitoringFile.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    test('Decode settings file', () async {
      final url = Uri.parse('http://localhost:$port/Settings.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    test('Decode weight scale multi user file', () async {
      final url = Uri.parse('http://localhost:$port/WeightScaleMultiUser.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    test('Decode weight scale single user file', () async {
      final url = Uri.parse('http://localhost:$port/WeightScaleSingleUser.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    ///
    /// WORKOUTS
    ///
    test('Decode workout individual steps file', () async {
      final url =
          Uri.parse('http://localhost:$port/WorkoutIndividualSteps.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    test('Decode workout custom target values file', () async {
      final url =
          Uri.parse('http://localhost:$port/WorkoutCustomTargetValues.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    test('Decode workout repeat greater than step file', () async {
      final url =
          Uri.parse('http://localhost:$port/WorkoutRepeatGreaterThanStep.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });

    test('Decode workout repeat steps file', () async {
      final url = Uri.parse('http://localhost:$port/WorkoutRepeatSteps.fit');
      final response = await http.get(url);
      FitFile.fromBytes(response.bodyBytes);
    });
  }, testOn: 'js');
}
