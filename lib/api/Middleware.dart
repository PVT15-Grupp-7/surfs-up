import 'package:surfs_up/api/WeatherData.dart';
import 'CallAPIs.dart';
import 'package:shared_preferences/shared_preferences.dart';

void callAPIs() async {
  print('------------------------Calling in Middleware----------------------- ');

  List<List<WeatherData>> wether = [];

   // List<Day> toröData
  List<WeatherData> toroData = await getData(57.80, 18.80);
  List<WeatherData> vaddoData = await getData(59.98, 18.88);

  wether.add(toroData);
  wether.add(vaddoData);

  print('_______________Print from middleware_______________');

  print('calling apis');

  print(toroData.length);
  print(vaddoData.length);


  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print('kom jag hit ens?');
  final encodedData = WeatherData.encode(toroData);
  await prefs.setString('toroData', encodedData);

  await prefs.setString('testar12345', 'hacker filip');

  print('------------------------Encoded------------------------ ');

}