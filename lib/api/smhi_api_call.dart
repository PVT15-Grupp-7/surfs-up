import 'dart:convert';
import 'package:surfs_up/api/weather_data.dart';
import 'package:http/http.dart' as http;

Future<List<WeatherData>> getSMHI(double lat, double lon) async {
  List<WeatherData> listOfWeatherData = [];

  //creating the request
  var request = http.Request(
      'GET',
      Uri.parse('https://opendata-download-metfcst.smhi.se/api/'
          'category/pmp3g/version/2/geotype/point/lon/$lon/lat/$lat/data.json'));
//Sending the request
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final st = await response.stream.bytesToString();
    final jsonRes = jsonDecode(st);
    List timeSeriesArr = jsonRes['timeSeries'];
    print(timeSeriesArr.length);

    for (int i = 0; i < timeSeriesArr.length; i++) {
      double temp = 0, windSpeed = 0, gust = 0, precipitation = 0;
      dynamic windDirection;
      int weatherSymbol = 0;

      DateTime dateTime = DateTime.parse(timeSeriesArr[i]['validTime']);
      //only 3 days of data
      // if (dateTime.day - DateTime.now().day > 3) {
      //   break;
      // }
      var parameters = timeSeriesArr[i]['parameters'];
      for (int j = 0; j < parameters.length; j++) {
        var parameter = parameters[j];
        if (parameter['name'] == 't') {
          temp = getValue(parameter);
        } else if (parameter['name'] == 'wd') {
          windDirection = getValue(parameter);
        } else if (parameter['name'] == 'ws') {
          windSpeed = getValue(parameter);
        } else if (parameter['name'] == 'gust') {
          gust = getValue(parameter);
        } else if (parameter['name'] == 'Wsymb2') {
          weatherSymbol = getValue(parameter);
        } else if (parameter['name'] == 'pmean') {
          precipitation = getValue(parameter);
        }
      }

      WeatherData weatherData = WeatherData(dateTime, temp, windSpeed,
          windDirection, gust, weatherSymbol, 0, precipitation);

      listOfWeatherData.add(weatherData);
    }
  } else {
    print(response.reasonPhrase);
  }
  return listOfWeatherData;
}

dynamic getValue(var parm) {
  var value = parm['values'];
  return value[0];
}
