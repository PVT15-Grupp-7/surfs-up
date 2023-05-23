import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/shared/widgets/weather_row_widget.dart';

class MockSunriseSunset {
  final DateTime sunrise;
  final DateTime sunset;

  MockSunriseSunset(this.sunrise, this.sunset);
}

void main() {
  test('test sunrise and sunset times', () {
    Location location = Location(
      latCoordinate: 51.5074,
      longCoordinate: -0.1278,
      address: '',
      defibrillatorImagePath: '',
      defibrillatorURL: '',
      infoImagePath: '',
      infoURL: '',
      locationURL: '',
      name: '',
      sharedPreferences: '',
      descriptionEN: '',
      descriptionSE: '',
      seabedEN: '',
      seabedSE: '',
    );

    DateTime sunrise = DateTime.parse('2023-05-12T05:42:00Z');
    DateTime sunset = DateTime.parse('2023-05-12T20:22:00Z');

    List<WeatherData> dayData = [
      WeatherData(
        DateTime.parse('2023-05-12T00:00:00.000Z'),
        25,
        10,
        180,
        15,
        1,
        0,
        0.0,
      ),
      WeatherData(
        DateTime.parse('2023-05-13T00:00:00.000Z'),
        26,
        11,
        190,
        16,
        2,
        1,
        0.0,
      ),
      WeatherData(
        DateTime.parse('2023-05-14T00:00:00.000Z'),
        28,
        13,
        210,
        18,
        4,
        3,
        0.0,
      ),
    ];

    WeatherRowWidget widget = WeatherRowWidget(
      dayData: dayData,
      location: location,
    );

    DateFormat dateFormat = DateFormat.Hm();

    MockSunriseSunset mockSunriseSunset = MockSunriseSunset(sunrise, sunset);

    String actualSunrise = dateFormat.format(
      mockSunriseSunset.sunrise,
    );

    String actualSunset = dateFormat.format(
      mockSunriseSunset.sunset,
    );

    expect(actualSunrise, dateFormat.format(sunrise));
    expect(actualSunset, dateFormat.format(sunset));
  });
}
