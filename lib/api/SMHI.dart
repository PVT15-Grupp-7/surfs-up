import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:surfs_up/api/WeatherData.dart';
import 'package:http/http.dart' as http;

const int _sizeOfWeatherData = 10;

List<WeatherData> listOfweather = [];

Future<List<WeatherData>> getSMHI(double lat, double lon) async{


  //creating the request
  var request = http.Request('GET', Uri.parse(
      'https://opendata-download-metfcst.smhi.se/api/'
          'category/pmp3g/version/2/geotype/point/lon/$lon/lat/$lat/data.json'));
//Sending the request
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    final st = await response.stream.bytesToString();
    final jsonRes = jsonDecode(st);
    var timeSeriveArr = jsonRes['timeSeries'];


    for(int i = 0; i < _sizeOfWeatherData; i++){

      print(timeSeriveArr[0]);
      print(timeSeriveArr.length);
      double temp = 0, windSpeed = 0, gust = 0;
      dynamic windDirection;
      int weatherSymbol = 0;

      String dateTime = timeSeriveArr[i]['validTime'] as String;
      print(dateTime);
      //only 3 days of data
      // if (dateTime.day - DateTime.now().day > 3) {
      //   break;
      // }
      var parameters = timeSeriveArr[i]['parameters'];
      print(parameters);
      print(parameters.length);
      for (int j = 0; j < parameters.length; j++){

        var parameter = parameters[j];
        if(parameter['name'] == 't'){
          temp = getValue(parameter);
        } else if (parameter['name'] == 'wd') {
          windDirection = getValue(parameter);
        } else if (parameter['name'] == 'ws') {
          windSpeed = getValue(parameter);
        } else if (parameter['name'] == 'gust') {
          gust = getValue(parameter);
        } else if( parameter['name'] == 'Wsymb2'){
          weatherSymbol = getValue(parameter);
        }
      }

      WeatherData weatherData = WeatherData(dateTime, temp, windSpeed, windDirection, gust, weatherSymbol, 0);
      listOfweather.add(weatherData);

    }

  } else {
    print(response.reasonPhrase);
  }

  print(listOfweather);


  //the data is saved in the shared preferences in correct format
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print('kom jag hit ens?');
  final encodedData = WeatherData.encode(listOfweather);
  await prefs.setString('toroData', encodedData);


  return listOfweather;
}

dynamic getValue(var parm) {
  var value = parm['values'];
  return value[0];
}