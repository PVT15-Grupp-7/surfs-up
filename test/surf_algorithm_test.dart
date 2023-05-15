import 'package:surfs_up/api/surf_conditions_algorithm.dart';
import 'package:surfs_up/api/weather_data.dart';

void main(){
  //testDeeperSurfCheckWithNoGoodConditions();
  //testDeeperSurfCeckWithGoodConditions();
  //vaddo();
  surfConnditions();
}

void testDeeperSurfCheckWithNoGoodConditions() {

  print('testDeeperSurfCheckWithNoGoodConditions');
  final List<WeatherData> dayData = [
    WeatherData('2023-05-12', 25, 5, 180, 10, 1, 0, 0),
    WeatherData('2023-05-12', 24, 6, 180, 12, 1, 0, 0),
    WeatherData('2023-05-12', 23, 15, 0, 15, 2, 0, 0),
    WeatherData('2023-05-12', 22, 10, 90, 15, 2, 0, 0),
    WeatherData('2023-05-12', 21, 10, 247, 15, 2, 0, 0),
    WeatherData('2023-05-12', 20, 12, 190, 15, 3, 0, 0),
  ];


  for(int i = 0; i < dayData.length; i++){
    deeperSurfCheack(dayData[i], 7, 180);

    print(dayData[i].surf);
    print('----------------------one hour---------------------- ');
  }
}

void testDeeperSurfCeckWithGoodConditions(){
  final List<WeatherData> dayData = [
    WeatherData('2023-05-12', 25, 7.1, 180, 11, 1, 0, 0),
    WeatherData('2023-05-12', 24, 11, 180, 13, 1, 0, 0),
    WeatherData('2023-05-12', 23, 15, 90, 15, 2, 0, 0),
    WeatherData('2023-05-12', 22, 10, 140, 15, 2, 0, 0),
    WeatherData('2023-05-12', 21, 10, 247, 15, 2, 0, 0),
    WeatherData('2023-05-12', 20, 8, 222, 15, 3, 0, 0),
  ];

  for(int i = 0; i < dayData.length; i++){
    deeperSurfCheack(dayData[i], 7, 180);

    print(dayData[i].surf);
    print('----------------------one hour----------------------');
  }
}

void vaddo(){
  final List<WeatherData> dayData = [
    WeatherData('2023-05-12', 25, 7.1, 180, 11, 1, 0, 0),
    WeatherData('2023-05-12', 24, 11, 180, 13, 1, 0, 0),
    WeatherData('2023-05-12', 23, 15, 90, 15, 2, 0, 0),
    WeatherData('2023-05-12', 22, 10, 140, 15, 2, 0, 0),
    WeatherData('2023-05-12', 21, 10, 247, 15, 2, 0, 0),
    WeatherData('2023-05-12', 20, 8, 222, 15, 3, 0, 0),
  ];


}


void surfConnditions(){
  final List<WeatherData> dayData = [
    WeatherData('2023-05-12', 25, 7.1, 180, 11, 1, 0, 0),
    WeatherData('2023-05-12', 24, 11, 180, 13, 1, 0, 0),
    WeatherData('2023-05-12', 23, 15, 90, 15, 2, 0, 0),
    WeatherData('2023-05-12', 22, 10, 140, 15, 2, 0, 0),
    WeatherData('2023-05-12', 21, 10, 247, 15, 2, 0, 0),
    WeatherData('2023-05-12', 20, 8, 220, 12, 3, 0, 0),
  ];

  cheackSurfConditions(dayData, 'toro');

  for(int i = 0; i < dayData.length; i++){
    print('surf = ${dayData[i].surf}');
    print('surfconditions = ${dayData[i].surfConditions}');

    print('----------------------one hour----------------------');
  }

}

