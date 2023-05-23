import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/api/weather_data.dart';

void main() {
  test('test totalPrecipitation', () {
    List<WeatherData> dayData = [
      WeatherData(
        DateTime.parse('2023-05-12T00:00:00.000Z'),
        25,
        10,
        180,
        15,
        1,
        0,
        0.5,
      ),
      WeatherData(
        DateTime.parse('2023-05-13T00:00:00.000Z'),
        26,
        11,
        190,
        16,
        2,
        1,
        0.8,
      ),
      WeatherData(
        DateTime.parse('2023-05-14T00:00:00.000Z'),
        28,
        13,
        210,
        18,
        4,
        3,
        1.2,
      ),
    ];

    String expectedTotalPrecipitation = '2.5';

    WeatherDataProvider provider = WeatherDataProvider(dayData);
    String result = provider.totalPrecipitation();

    expect(result, expectedTotalPrecipitation);
  });
}

class WeatherDataProvider {
  List<WeatherData> dayData;

  WeatherDataProvider(this.dayData);

  String totalPrecipitation() {
    double sum = 0;
    for (var item in dayData) {
      sum += item.precipitation;
    }
    return sum.toStringAsFixed(1);
  }
}
