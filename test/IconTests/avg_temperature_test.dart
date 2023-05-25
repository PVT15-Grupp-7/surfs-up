import 'package:flutter_test/flutter_test.dart';

void main() {
  group('averageTemperature', () {
    test('returns average temperature as a string', () {
      final dayData = [
        TemperatureData(10),
        TemperatureData(20),
        TemperatureData(30),
        TemperatureData(40),
      ];

      final result = averageTemperature(dayData);

      expect(result, '25');
    });

    test('returns "0" for empty dayData', () {
      final dayData = <TemperatureData>[];

      final result = averageTemperature(dayData);

      expect(result, '0');
    });
  });
}

class TemperatureData {
  final double temperature;

  TemperatureData(this.temperature);
}

String averageTemperature(List<TemperatureData> dayData) {
  if (dayData.isEmpty) {
    return '0';
  }

  double sum = 0;
  for (var item in dayData) {
    sum += item.temperature;
  }
  return (sum / dayData.length).round().toString();
}
