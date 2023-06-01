import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:surfs_up/data/weather_data.dart';
import 'get_api_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'surf_conditions_algorithm.dart';

/// The main API class. If there is an internet connection, it will call the APIs,
/// calculate the surf conditions and store the data in the device.
Future callAPIs() async {
  if (kDebugMode) {
    print(
      '------------------------Calling in Middleware----------------------- ');
  }

  List<WeatherData> toroData = [];
  List<WeatherData> vaddoData = [];

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if (kDebugMode) {
        print('Internet: Connected');

        print('----------------Calling in Torö Data API----------------- ');
      }
      toroData = await getData(58.80, 17.80);
      if (kDebugMode) {
        print("Torö Data complete, got ${toroData.length} hours of data");

        print('----------------Calling in Väddö Data API----------------- ');
      }
      vaddoData = await getData(59.98, 18.88);
      if (kDebugMode) {
        print("Veddö Data complete, got ${toroData.length} hours of data");
      }
    }
  } on SocketException catch (e) {
    if (kDebugMode) {
      print('No internet connection');
    }
  }

  await checkSurfConditions(vaddoData, 'vaddo');
  await checkSurfConditions(toroData, 'toro');

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final encodedData = WeatherData.encode(toroData);
  final encodedVeddoData = WeatherData.encode(vaddoData);
  await prefs.setString('toroData', encodedData);
  await prefs.setString('vaddoData', encodedVeddoData);

  if (kDebugMode) {
    print('------------------------Encoded------------------------ ');
  }
}
