import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/api/weather_data.dart';

void main() {
  test('Test getMostFrequentWeatherIcon', () {
    // Sample data
    final List<WeatherData> dayData = [
      WeatherData(DateTime.parse('2023-05-12'), 25, 10, 180, 15, 1, 0, 0),
      WeatherData(DateTime.parse('2023-05-12'), 24, 10, 180, 15, 1, 0, 0),
      WeatherData(DateTime.parse('2023-05-12'), 23, 10, 180, 15, 2, 0, 0),
      WeatherData(DateTime.parse('2023-05-12'), 22, 10, 180, 15, 2, 0, 0),
      WeatherData(DateTime.parse('2023-05-12'), 21, 10, 180, 15, 2, 0, 0),
      WeatherData(DateTime.parse('2023-05-12'), 20, 10, 180, 15, 3, 0, 0),
    ];

    // Expected result
    final expectedIcon = Icons.wb_sunny_outlined;

    // Invoke the method
    final result = getMostFrequentWeatherIcon(dayData);

    // Verify the result
    expect(result, expectedIcon);
  });
}

IconData getMostFrequentWeatherIcon(List<WeatherData> dayData) {
  Map<IconData, int> iconCounts = {};

  // Count the occurrences of each weather icon
  for (var data in dayData) {
    IconData icon = data.weatherIcon;
    iconCounts[icon] = (iconCounts[icon] ?? 0) + 1;
  }

  // Find the weather icon with the highest count
  IconData mostFrequentIcon = Icons.wb_sunny_outlined;
  int maxCount = 0;
  iconCounts.forEach((icon, count) {
    if (count > maxCount) {
      mostFrequentIcon = icon;
      maxCount = count;
    }
  });

  return mostFrequentIcon;
}
