import 'smhi_api_call.dart';
import 'weather_data.dart';
import 'yr_api_call.dart';
import 'surf_conditions_algorithm.dart';



Future<List<WeatherData>> getData(double lat, double lon) async{

  print('------------------print from smhi call------------------');

  List<WeatherData> smhiData = await getSMHI(lat, lon);
  print ('smhiData length: ${smhiData.length}');
  List<WeatherData> yrData = await getYR(lat, lon);
  print ('yrData length: ${yrData.length}');

  for(int i = 0; i <48; i++){

    //samlahiop datan från både och slippa värdernas
    WeatherData smhi = smhiData[i];
    WeatherData yr = yrData[i];

    smhi.setTemperature(((smhi.temperature + yr.temperature ) / 2).round());
    smhi.setWindSpeed(((smhi.windSpeed + yr.windSpeed )/ 2).round());
    smhi.setWindDirection(((smhi.windDirection + yr.windDirection ) / 2).round());
  }

  //Anropa surf algoritmen här
  //cheackSurfConditions(smhiData);

  print('------------------smhi call done------------------');


  return smhiData;

}

