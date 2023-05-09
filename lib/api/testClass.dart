import 'Middleware.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surfs_up/api/WeatherData.dart';

void main() async{
  print('hej');

  print('------------------------Calling APIs------------------------ ');

  callAPIs();

  print('------------------------Decoding------------------------ ');

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final String data = prefs.getString('toroData') as String;

  final List<WeatherData> toroData = WeatherData.decode(data);

  print(toroData[2].date);

  print('------------------------Decoded------------------------ ');


}