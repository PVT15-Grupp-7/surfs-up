import 'package:surfs_up/api/WeatherData.dart';

int surfCount = 0;
bool lastHourSurf = false;
final int MINIMUM_WIND_SPEED = 7;
final int MAX_SOUTHWIND = 180;
final int MAX_WESTWIND = 240;


void cheackSurfConditions(List<WeatherData> weatherData) {
  //wind 180g till 240
  // speed > 7
  // gust >10
  // atleast 3 hours of this conditions for surf

for (int i = 0; i < weatherData.length; i++) {
 WeatherData hourData = weatherData[i];

 if(i - 3 < 0){
   deeperSurfCheack(hourData);
   print('Not enough data to check surf conditions');
 }else {
    WeatherData hourData1 = weatherData[i - 1];
    WeatherData hourData2 = weatherData[i - 2];
    WeatherData hourData3 = weatherData[i - 3];

    deeperSurfCheack(hourData);

    if (hourData1.surf && hourData2.surf && hourData3.surf) {
      hourData.setSurfConditions(1);
    } else {
      hourData.setSurfConditions(0);
    }
 }


}
}

void deeperSurfCheack(WeatherData data) {
  //cecka wind, gust and direcktion
  if (data.windSpeed > MINIMUM_WIND_SPEED &&  MAX_WESTWIND > data.windDirection && data.windDirection > MAX_SOUTHWIND ){
    data.setSurf(true);
  }

}