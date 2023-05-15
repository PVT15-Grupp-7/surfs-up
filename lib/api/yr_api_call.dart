import 'dart:convert';
import 'weather_data.dart';
import 'package:http/http.dart' as https;

const int _sizeOfWeatherData = 70;

Future<List<WeatherData>> getYR(double lat, double lon) async {
  List<WeatherData> yrweatherData = [];

  print('------------------print from yr call------------------');

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
    print(response.reasonPhrase);
  }

  print('------------------yr call done------------------');

  //final SharedPreferences prefs = await SharedPreferences.getInstance();
  //print('kom jag hit ens?');
  //final encodedData = WeatherData.encode(yrweatherData);
  //await prefs.setString('vaddoData', encodedData);

  return yrweatherData;
}

List<WeatherData> getValues(var jsonRes) {
  List<WeatherData> yrweatherData = [];

  var properties = jsonRes['properties'];
  var timeseries = properties['timeseries'];

  for (int i = 0; i < _sizeOfWeatherData; i++) {
    var timeserie = timeseries[i];
    String dateTime = timeserie['time'];

    var data = timeserie['data'];
    var instant = data['instant'];
    var details = instant['details'];


    WeatherData weatherData = WeatherData(dateTime, details['air_temperature'],
        details['wind_speed'], details['wind_from_direction'], 0.0, 0, 0, 0);


    yrweatherData.add(weatherData);
  }
  return yrweatherData;
}
