import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/shared/widgets/surf_row_widget.dart';

void main() {
  test('Average speed calculation', () {
    // Arrange
    var dayData = [
      DayData(windSpeed: 10),
      DayData(windSpeed: 20),
      DayData(windSpeed: 30),
    ];
    var instance = RowWidget(dayData);

    // Act
    var result = instance.averageSpeed();

    // Assert
    expect(result, equals('20'));
  });
}

class DayData {
  final double windSpeed;

  DayData({required this.windSpeed});
}

class RowWidget {
  final List<DayData> dayData;

  RowWidget(this.dayData);

  String averageSpeed() {
    double sum = 0;
    for (var item in dayData) {
      sum += item.windSpeed;
    }
    return (sum / dayData.length).round().toString();
  }
}
