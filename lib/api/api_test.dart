//import 'middleware.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'smhi_api_call.dart';
import 'surf_conditions_algorithm.dart';

void main() async{
  print('hej');

  List<WeatherData> list = getSMHI(57.80, 18.80) as List<WeatherData>;

  cheackSurfConditions(list, 'toro');


  for (int i = 0; i < 6; i++) {
    print(list[i].surfConditions);
  }

  print('------------------------Calling APIs------------------------ ');

  //callAPIs();

  print('------------------------Decoding------------------------ ');

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  // final String data = prefs.getString('toroData') as String;
  //
  // final List<WeatherData> toroData = WeatherData.decode(data);
  //
  // print(toroData[2].date);

  print('------------------------Decoded------------------------ ');


}