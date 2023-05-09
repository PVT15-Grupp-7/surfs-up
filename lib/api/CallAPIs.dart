import 'SMHI.dart';
import 'WeatherData.dart';
import 'YR.dart';



Future<List<WeatherData>> getData(double lat, double lon) async{

  print('------------------print from smhi call------------------');

  List<WeatherData> smhiData = await getSMHI(lat, lon);
  List<WeatherData> yrData = await getYR(lat, lon);

  for(int i = 0; i <48; i++){

    //samlahiop datan från både och slippa värdernas
    WeatherData smhi = smhiData[i];
    WeatherData yr = yrData[i];

    smhi.setTemperature((smhi.temperature + yr.temperature )/ 2);
    smhi.setWindSpeed((smhi.windSpeed + yr.windSpeed )/ 2);
    smhi.setWindDirection((smhi.windDirection + yr.windDirection )/ 2);
  }

  //Anropa surf algoritmen här

  print('------------------smhi call done------------------');


  return smhiData;

}

