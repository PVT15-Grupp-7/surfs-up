import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/api/surf_conditions_algorithm.dart';

void main() {
  test('test checkSurfConditions', () {
    List<WeatherData> weatherData = [
      // Fyll i värden för att testa olika surfing conditions
      WeatherData(DateTime.parse('2023-05-12'), 25, 20, 180, 15, 1, 0, 0),
    ];

    String spot = 'toro'; // Fyll i den surfplatsen du vill testa för

    checkSurfConditions(weatherData, spot);

    expect(weatherData[0].surfConditions, 3 // surf condition ***
        ); // Fyll i värdet för det surfförhållandet du vill test
  });
}
