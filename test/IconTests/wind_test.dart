import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/data/weather_data.dart';

void main() {
  test('setWindSymbol returns the correct symbol for a given wind direction',
      () {
    final weatherData =
        WeatherData(DateTime.parse('2023-05-12'), 25, 10, 180, 15, 1, 0, 0);

    final symbols = {
      0: 'N',
      45: 'NE',
      90: 'E',
      135: 'SE',
      180: 'S',
      225: 'SW',
      270: 'W',
      315: 'NW',
    };

    symbols.forEach((windDirection, expectedSymbol) {
      final actualSymbol = weatherData.setWindSymbol(windDirection);
      expect(actualSymbol, equals(expectedSymbol));
    });
  });

  test('setWindSymbolOne returns the correct symbol for a given wind direction',
      () {
    final weatherData =
        WeatherData(DateTime.parse('2023-05-12'), 25, 10, 180, 15, 1, 0, 0);

    final symbols = {
      0: CupertinoIcons.arrow_down,
      45: CupertinoIcons.arrow_down_left,
      90: CupertinoIcons.arrow_left,
      135: CupertinoIcons.arrow_up_left,
      180: CupertinoIcons.arrow_up,
      225: CupertinoIcons.arrow_up_right,
      270: CupertinoIcons.arrow_right,
      315: CupertinoIcons.arrow_down_right,
    };

    symbols.forEach((windDirection, expectedSymbol) {
      final actualSymbol = weatherData.setWindSymbolOne(windDirection);
      expect(identical(actualSymbol, expectedSymbol), isTrue);

      final expectedClosestSymbol = symbols.entries
          .reduce((a, b) =>
              (a.key - windDirection).abs() < (b.key - windDirection).abs()
                  ? a
                  : b)
          .value;
      expect(actualSymbol, equals(expectedClosestSymbol));
    });
  });
}
