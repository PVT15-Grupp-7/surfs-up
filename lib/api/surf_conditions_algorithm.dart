import 'package:surfs_up/api/weather_data.dart';

const int minWindToro = 3;
const int optimalWindToro = 190;

const int minWindVaddo = 3;
const int optimalWindVaddo = 0;

List<WeatherData> weatherData = [];

Future<void> checkSurfConditions(
    List<WeatherData> weatherData, String spot) async {
  int minWind = 0;

  int optimalWind = 0;

  if (spot == 'toro') {
    minWind = minWindToro;
    optimalWind = optimalWindToro;
  } else if (spot == 'vaddo') {
    minWind = minWindVaddo;
    optimalWind = optimalWindVaddo;
  }

  print('MinWind - OptimalWind: $minWind  .....    $optimalWind');

  for (int i = 0; i < weatherData.length; i++) {
    WeatherData hourData = weatherData[i];
    await deeperSurfCheck(hourData, minWind, optimalWind);
  }

  /*for (int i = 0; i < weatherData.length; i++) {
    WeatherData hourData = weatherData[i];

    if (i < 4) {
      hourData.setSurfConditions(hourData.surf);
      // if (i == 0 || i == 1 || i == 2) {
      //   //firstHourSurfCheack(hourData, i);
      //   WeatherData firstHour;
      //   WeatherData secondHour;
      //   switch (i) {
      //     case 0:
      //       hourData.setSurfConditions(hourData.surf);
      //       break;
      //     case 1: //if the first hour is surfable
      //       firstHour = weatherData[i - 1];
      //       if (firstHour.surfConditions > 0) {
      //         hourData.setSurfConditions(hourData.surf);
      //       } else {
      //         hourData.setSurfConditions(0);
      //       }
      //       break;
      //     case 2:
      //       firstHour = weatherData[i - 2];
      //       secondHour = weatherData[i - 1];
      //       if (firstHour.surfConditions > 0 && secondHour.surfConditions > 0) {
      //         hourData.setSurfConditions(hourData.surf);
      //       } else {
      //         hourData.setSurfConditions(0);
      //       }
      //   }
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
      } else if (currentHour > 1 && oneHourBack > 1) {
        hourData.setSurfConditions(2);
      } else if (oneHourBack + twoHoursBack + threeHoursBack > 3 &&
          oneHourBack > 0 &&
          twoHoursBack > 0 &&
          currentHour > 0) {
        hourData.setSurfConditions(1);
      } else {
        hourData.setSurfConditions(0);
      }
    }
  }*/
}

Future<void> deeperSurfCheck(
    WeatherData data, int minWind, int optimalWind) async {
  dynamic difference = 0;
  if (minWind == 13 && data.windDirection > 180) {
    difference = (optimalWind + 360) - data.windDirection;
  } else {
    difference = optimalWind - data.windDirection;
  }

  ///prints for testing.
  // print(data.windDirection);
  // print(difference);

  //cecka wind, gust and direcktion
  if (difference <= 60 && difference >= -60) {
    dynamic windSpeed = data.windSpeed;
    if (windSpeed < minWind + 3 && windSpeed >= minWind) {
      data.setSurfConditions(1);
      data.setSurf(1);
    } else if (windSpeed >= minWind + 3 && windSpeed < minWind + 6) {
      data.setSurfConditions(2);
      data.setSurf(2);
    } else if (windSpeed >= minWind + 6) {
      data.setSurfConditions(3);
      data.setSurf(3);
    } else {
      data.setSurfConditions(0);
      data.setSurf(0);
    }
  } else {
    data.setSurfConditions(0);
    data.setSurf(0);
  }
  print(
      'surf: ${data.surf}  windS: ${data.windSpeed} windD: ${data.windDirection}');
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
