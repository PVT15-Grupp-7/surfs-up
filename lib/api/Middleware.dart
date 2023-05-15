import 'package:surfs_up/api/weather_data.dart';
import 'get_api_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'surf_conditions_algorithm.dart';

void callAPIs() async {
  print('------------------------Calling in Middleware----------------------- ');

  //List<List<WeatherData>> weather = [];

   // List<Day> toröData
  List<WeatherData> toroData = await getData(57.80, 18.80);
  print("TORÖDATA EFTER GETDATA 1!! ${toroData.length}");
  List<WeatherData> vaddoData = await getData(59.98, 18.88);
  print("TORÖDATA EFTER GETDATA 2!! ${toroData.length}");

  //weather.add(toroData);
  //weather.add(vaddoData);

  //print('_______________Print from middleware_______________');

  //print('calling apis');

  //print(toroData.length);
  //print(vaddoData.length);

  cheackSurfConditions(vaddoData, 'vaddo');
  cheackSurfConditions(toroData, 'toro');




  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //print('kom jag hit ens?');
  prefs.remove('toroData');
  final encodedData = WeatherData.encode(toroData);
  final encodedVeddoData = WeatherData.encode(vaddoData);
  await prefs.setString('toroData', encodedData);
  await prefs.setString('vaddoData', encodedVeddoData);

  //await prefs.setString('testar12345', 'hacker filip');

  print('------------------------Encoded------------------------ ');

}