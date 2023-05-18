import 'dart:io';

import 'package:surfs_up/api/weather_data.dart';
import 'get_api_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'surf_conditions_algorithm.dart';

Future callAPIs() async {
  print(
      '------------------------Calling in Middleware----------------------- ');

  List<WeatherData> toroData = [];
  List<WeatherData> vaddoData = [];

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      print('Internet: Connected');

      print('----------------Calling in Torö Data API----------------- ');
      toroData = await getData(58.80, 17.80);
      print("Torö Data complete, got ${toroData.length} hours of data");

      print('----------------Calling in Väddö Data API----------------- ');
      vaddoData = await getData(59.98, 18.88);
      print("Veddö Data complete, got ${toroData.length} hours of data");
    }
  } on SocketException catch (e) {
    print('No internet connection');
  }

  //print('_______________Print from middleware_______________');

  //print('calling apis');

  //print(toroData.length);
  //print(vaddoData.length);

  checkSurfConditions(vaddoData, 'vaddo');
  checkSurfConditions(toroData, 'toro');

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final encodedData = WeatherData.encode(toroData);
  final encodedVeddoData = WeatherData.encode(vaddoData);
  await prefs.setString('toroData', encodedData);
  await prefs.setString('vaddoData', encodedVeddoData);

  //await prefs.setString('testar12345', 'hacker filip');

  print('------------------------Encoded------------------------ ');
}
