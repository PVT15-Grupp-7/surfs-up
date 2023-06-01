import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../data/weather_data.dart';
import 'package:http/http.dart' as https;

/// Methods for fetching weather data from YR and transforming it into a list of
/// [WeatherData] objects.
Future<List<WeatherData>> getYR(double lat, double lon) async {
  List<WeatherData> yrweatherData = [];

  var headers = {
    'User-Agent': 'acmeweathersite.com support@acmeweathersite.com',
  };

  var request = https.Request(
      'GET',
      Uri.parse(
          'https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=$lat&lon=$lon'));
  request.headers.addAll(headers);

  https.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final st = await response.stream.bytesToString();
    final jsonRes = jsonDecode(st);
    yrweatherData = getValues(jsonRes);
  } else {
    if (kDebugMode) {
      print(response.reasonPhrase);
    }
  }
  return yrweatherData;
}

List<WeatherData> getValues(var jsonRes) {
  List<WeatherData> yrweatherData = [];

  var properties = jsonRes['properties'];
  List timeseries = properties['timeseries'];

  for (int i = 0; i < timeseries.length; i++) {
    var timeserie = timeseries[i];
    DateTime dateTime = DateTime.parse(timeserie['time']);

    var data = timeserie['data'];
    var instant = data['instant'];
    var details = instant['details'];

    WeatherData weatherData = WeatherData(dateTime, details['air_temperature'],
        details['wind_speed'], details['wind_from_direction'], 0.0, 0, 0, 0);

    yrweatherData.add(weatherData);
  }
  return yrweatherData;
}
