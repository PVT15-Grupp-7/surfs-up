import 'package:surfs_up/data/weather_data.dart';

const int minWindToro = 3;
const int optimalWindToro = 190;

const int minWindVaddo = 3;
const int optimalWindVaddo = 0;

List<WeatherData> weatherData = [];

/// Methods for checking and calculating surf conditions.
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
  for (int i = 0; i < weatherData.length; i++) {
    WeatherData hourData = weatherData[i];
    await deeperSurfCheck(hourData, minWind, optimalWind);
  }
}

Future<void> deeperSurfCheck(
    WeatherData data, int minWind, int optimalWind) async {
  dynamic difference = 0;
  if (minWind == 13 && data.windDirection > 180) {
    difference = (optimalWind + 360) - data.windDirection;
  } else {
    difference = optimalWind - data.windDirection;
  }

  /// Checks wind, gust and direction
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
}
