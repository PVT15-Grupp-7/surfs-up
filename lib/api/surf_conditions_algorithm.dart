import 'package:surfs_up/api/weather_data.dart';

const int minWindToro = 7;
const int optimalWindToro = 210;

const int minWindVaddo = 13;
const int optimalWindVaddo = 0;

List<WeatherData> weatherData = [];

void cheackSurfConditions(List<WeatherData> weatherData, String spot) {
  int minWind = 0;

  int optimalWind = 0;

  if (spot == 'toro') {
    minWind = minWindToro;
    optimalWind = optimalWindToro;
  } else if (spot == 'vaddo') {
    minWind = minWindVaddo;
    optimalWind = optimalWindVaddo;
  }

  print('$minWind  .....    $optimalWind');

  weatherData = weatherData;
  for (int i = 0; i < weatherData.length; i++) {
    WeatherData hourData = weatherData[i];
    deeperSurfCheack(hourData, minWind, optimalWind);

    if (i == 0 || i == 1 || i == 2) {
      //firstHourSurfCheack(hourData, i);
      WeatherData firstHour;
      WeatherData secondHour;
      switch (i) {
        case 0:
          hourData.setSurfConditions(hourData.surf);
          break;
        case 1: //if the first hour is surfable
          firstHour = weatherData[i - 1];
          if (firstHour.surfConditions > 0) {
            hourData.setSurfConditions(hourData.surf);
          } else {
            hourData.setSurfConditions(0);
          }
          break;
        case 2:
          firstHour = weatherData[i - 2];
          secondHour = weatherData[i - 1];
          if (firstHour.surfConditions > 0 && secondHour.surfConditions > 0) {
            hourData.setSurfConditions(hourData.surf);
          } else {
            hourData.setSurfConditions(0);
          }
      }
    } else {
      //checkSurfeblehour(hourData, i);
      int oneHourBack = weatherData[i - 1].surfConditions;
      int twoHoursBack = weatherData[i - 2].surfConditions;
      int threeHoursBack = weatherData[i - 3].surfConditions;

      int currentHour = hourData.surf;

      if (oneHourBack > 2 &&
          twoHoursBack > 2 &&
          threeHoursBack > 2 &&
          currentHour < 1) {
        hourData.setSurfConditions(3);
      } else if (oneHourBack + twoHoursBack + threeHoursBack > 5) {
        hourData.setSurfConditions(2);
      } else if (oneHourBack + twoHoursBack + threeHoursBack > 3 &&
          oneHourBack > 0 &&
          twoHoursBack > 0 &&
          currentHour > 0) {
        hourData.setSurfConditions(1);
      } else if (currentHour > 0 && oneHourBack > 0) {
        hourData.setSurfConditions(1);
      } else {
        hourData.setSurfConditions(0);
      }
    }
  }
}

void deeperSurfCheack(WeatherData data, int minWind, int optimalWind) {
  dynamic diffrens = 0;
  if (minWind == 13 && data.windDirection > 180) {
    diffrens = (optimalWind + 360) - data.windDirection;
  } else {
    diffrens = optimalWind - data.windDirection;
  }

  print(data.windDirection);
  print(diffrens);
  //cecka wind, gust and direcktion
  if (diffrens <= 45 && diffrens >= -45) {
    dynamic windSpeed = data.windSpeed;
    if (windSpeed < minWind + 3 && windSpeed > minWind && data.gust > 10) {
      data.setSurf(1);
    } else if (windSpeed >= minWind + 3 && windSpeed < minWind + 6) {
      data.setSurf(2);
    } else if (windSpeed >= minWind + 6) {
      data.setSurf(3);
    } else {
      data.setSurf(0);
    }
  } else {
    data.setSurf(0);
  }
}

// void checkSurfeblehour(WeatherData data, int i) {
//   int oneHourBack = weatherData[i - 1].surfConditions;
//   int twoHoursBack = weatherData[i - 2].surfConditions;
//   int threeHoursBack = weatherData[i - 3].surfConditions;
//
//   int currentHour = data.surf;
//
//   if (oneHourBack > 2 && twoHoursBack > 2 && threeHoursBack > 2 && currentHour < 1) {
//     data.setSurfConditions(3);
//   }else if( oneHourBack + twoHoursBack + threeHoursBack > 5) {
//     data.setSurfConditions(2);
//   } else if (oneHourBack + twoHoursBack + threeHoursBack > 3 && oneHourBack > 0 && twoHoursBack> 0 && currentHour > 0) {
//     data.setSurfConditions(1);
//   } else if (currentHour > 0 && oneHourBack > 0){
//     data.setSurfConditions(1);
//   } else {
//     data.setSurfConditions(0);
//   }
// }

// void firstHourSurfCheack(WeatherData data, int i) {
//   WeatherData firstHour;
//   WeatherData secondHour;
//   switch (i) {
//     case 0:
//       data.setSurfConditions(data.surf);
//       break;
//     case 1: //if the first hour is surfable
//       firstHour = weatherData[i - 1];
//       if (firstHour.surfConditions > 0) {
//         data.setSurfConditions(data.surf);
//       } else {
//         data.setSurfConditions(0);
//       }
//       break;
//       case 2:
//         firstHour = weatherData[i - 2];
//         secondHour = weatherData[i - 1];
//         if (firstHour.surfConditions > 0 && secondHour.surfConditions > 0) {
//
//         } else {
//           data.setSurfConditions(data.surf);
//         }
//   }
// }


