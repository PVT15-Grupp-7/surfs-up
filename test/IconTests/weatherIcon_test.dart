import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('setWeatherIcon should set the correct weather icon', () {
    // Test cases with expected weather icons
    final testCases = {
      1: Icons.wb_sunny_outlined,
      2: Icons.wb_sunny_outlined,
      3: CupertinoIcons.cloud_sun,
      4: CupertinoIcons.cloud_sun,
      5: Icons.cloud_outlined,
      6: Icons.cloud_outlined,
      7: CupertinoIcons.cloud_fog,
      8: CupertinoIcons.cloud_heavyrain,
      9: CupertinoIcons.cloud_heavyrain,
      10: CupertinoIcons.cloud_heavyrain,
      18: CupertinoIcons.cloud_heavyrain,
      19: CupertinoIcons.cloud_heavyrain,
      20: CupertinoIcons.cloud_heavyrain,
      11: Icons.thunderstorm_outlined,
      21: Icons.thunderstorm_outlined,
      12: CupertinoIcons.cloud_sleet,
      13: CupertinoIcons.cloud_sleet,
      14: CupertinoIcons.cloud_sleet,
      22: CupertinoIcons.cloud_sleet,
      23: CupertinoIcons.cloud_sleet,
      24: CupertinoIcons.cloud_sleet,
      15: CupertinoIcons.cloud_snow,
      16: CupertinoIcons.cloud_snow,
      17: CupertinoIcons.cloud_snow,
      25: CupertinoIcons.cloud_snow,
      26: CupertinoIcons.cloud_snow,
      27: CupertinoIcons.cloud_snow,
    };

    final weatherData = WeatherData(); // Create an instance of WeatherData

    testCases.forEach((weatherSymbol, expectedIcon) {
      weatherData.setWeatherIcon(
          weatherSymbol); // Call the method with each weatherSymbol

      expect(weatherData.weatherIcon, expectedIcon);
    });
  });
}

class WeatherData {
  IconData? weatherIcon;

  void setWeatherIcon(dynamic weatherSymbol) {
    switch (weatherSymbol) {
      case 1:
      case 2:
        weatherIcon = Icons.wb_sunny_outlined;
        break;
      case 3:
      case 4:
        weatherIcon = CupertinoIcons.cloud_sun;
        break;
      case 5:
      case 6:
        weatherIcon = Icons.cloud_outlined;
        break;
      case 7:
        weatherIcon = CupertinoIcons.cloud_fog;
        break;
      case 8:
      case 9:
      case 10:
      case 18:
      case 19:
      case 20:
        weatherIcon = CupertinoIcons.cloud_heavyrain;
        break;
      case 11:
      case 21:
        weatherIcon = Icons.thunderstorm_outlined;
        break;
      case 12:
      case 13:
      case 14:
      case 22:
      case 23:
      case 24:
        weatherIcon = CupertinoIcons.cloud_sleet;
        break;
      case 15:
      case 16:
      case 17:
      case 25:
      case 26:
      case 27:
        weatherIcon = CupertinoIcons.cloud_snow;
        break;
      default:
        weatherIcon = null;
    }
  }
}
