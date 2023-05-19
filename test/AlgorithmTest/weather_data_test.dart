import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:surfs_up/api/weather_data.dart';

void main() {
  test('test getWeatherData', () {
    String text =
        '[{"date": "2023-05-12T00:00:00.000Z", "temperature": 25, "windSpeed": 10, "windDirection": 180, "gust": 15, "weatherSymbol": 1, "surfConditions": 0, "precipitation": 0}, {"date": "2023-05-13T00:00:00.000Z", "temperature": 26, "windSpeed": 11, "windDirection": 190, "gust": 16, "weatherSymbol": 2, "surfConditions": 1, "precipitation": 0}, {"date": "2023-05-13T00:00:00.000Z", "temperature": 27, "windSpeed": 12, "windDirection": 200, "gust": 17, "weatherSymbol": 3, "surfConditions": 2, "precipitation": 0}, {"date": "2023-05-14T00:00:00.000Z", "temperature": 28, "windSpeed": 13, "windDirection": 210, "gust": 18, "weatherSymbol": 4, "surfConditions": 3, "precipitation": 0}]';

    List<List<WeatherData>> expectedWeatherData = [
      [
        WeatherData(
          DateTime.parse('2023-05-12T00:00:00.000Z'),
          25,
          10,
          180,
          15,
          1,
          0,
          0,
        )
      ],
      [
        WeatherData(
          DateTime.parse('2023-05-13T00:00:00.000Z'),
          26,
          11,
          190,
          16,
          2,
          1,
          0,
        ),
        WeatherData(
          DateTime.parse('2023-05-13T00:00:00.000Z'),
          27,
          12,
          200,
          17,
          3,
          2,
          0,
        )
      ],
      [
        WeatherData(
          DateTime.parse('2023-05-14T00:00:00.000Z'),
          28,
          13,
          210,
          18,
          4,
          3,
          0,
        )
      ]
    ];

    List<List<WeatherData>> result = getWeatherData(text);

    expect(result.length, expectedWeatherData.length);
    for (int i = 0; i < result.length; i++) {
      expect(result[i].length, expectedWeatherData[i].length);
      for (int j = 0; j < result[i].length; j++) {
        expect(result[i][j].date, expectedWeatherData[i][j].date);
        expect(result[i][j].temperature, expectedWeatherData[i][j].temperature);
        expect(result[i][j].windSpeed, expectedWeatherData[i][j].windSpeed);
        expect(result[i][j].windDirection,
            expectedWeatherData[i][j].windDirection);
        expect(result[i][j].gust, expectedWeatherData[i][j].gust);
        expect(result[i][j].weatherSymbol,
            expectedWeatherData[i][j].weatherSymbol);
        expect(result[i][j].surfConditions,
            expectedWeatherData[i][j].surfConditions);
        expect(result[i][j].precipitation,
            expectedWeatherData[i][j].precipitation);
      }
    }
  });

  test('test toMap', () {
    WeatherData weatherData = WeatherData(
      DateTime.parse('2023-05-12T00:00:00.000Z'),
      25,
      10,
      180,
      15,
      1,
      0,
      0,
    );

    Map<String, dynamic> expectedMap = {
      'date': '2023-05-12T00:00:00.000Z',
      'temperature': 25,
      'windSpeed': 10,
      'windDirection': 180,
      'gust': 15,
      'weatherSymbol': 1,
      'surfConditions': 0,
      'precipitation': 0,
    };

    Map<String, dynamic> result = toMap(weatherData);

    expect(result, expectedMap);
  });

  test('test encode', () {
    List<WeatherData> weatherData = [
      WeatherData(
        DateTime.parse('2023-05-12T00:00:00.000Z'),
        25,
        10,
        180,
        15,
        1,
        0,
        0,
      ),
      WeatherData(
        DateTime.parse('2023-05-13T00:00:00.000Z'),
        26,
        11,
        190,
        16,
        2,
        1,
        0,
      ),
    ];

    String expectedEncodedData =
        '[{"date":"2023-05-12T00:00:00.000Z","temperature":25,"windSpeed":10,"windDirection":180,"gust":15,"weatherSymbol":1,"surfConditions":0,"precipitation":0},{"date":"2023-05-13T00:00:00.000Z","temperature":26,"windSpeed":11,"windDirection":190,"gust":16,"weatherSymbol":2,"surfConditions":1,"precipitation":0}]';

    String result = encode(weatherData);

    expect(result, expectedEncodedData);
  });
}

List<List<WeatherData>> getWeatherData(String text) {
  List<List<WeatherData>> weatherData = [[]];
  List<WeatherData> weatherList = decode(text);

  int currentDay = weatherList[0].date.day;

  for (int i = 0, j = 0; i < weatherList.length; i++) {
    if (weatherList[i].date.day == currentDay) {
      weatherData[j].add(weatherList[i]);
      currentDay = weatherList[i].date.day;
    } else if (weatherData.length < 5) {
      weatherData.add([]);
      weatherData[++j].add(weatherList[i]);
      currentDay = weatherList[i].date.day;
    }
  }
  return weatherData;
}

Map<String, dynamic> toMap(WeatherData weatherData) => {
      'date': weatherData.date.toString(),
      'temperature': weatherData.temperature,
      'windSpeed': weatherData.windSpeed,
      'windDirection': weatherData.windDirection,
      'gust': weatherData.gust,
      'weatherSymbol': weatherData.weatherSymbol,
      'surfConditions': weatherData.surfConditions,
      'precipitation': weatherData.precipitation,
    };

String encode(List<WeatherData> weatherData) => json.encode(
      weatherData
          .map<Map<String, dynamic>>(
              (weatherData) => WeatherData.toMap(weatherData))
          .toList(),
    );
List<WeatherData> decode(String text) {
  return (json.decode(text) as List<dynamic>)
      .map<WeatherData>((item) => WeatherData.fromJson(item))
      .toList();
}

@override
String toString() {
  var date = DateTime.now().toUtc();
  var gust;
  var surfConditions;
  var precipitation;
  var weatherSymbol;
  var windDirection;
  var windSpeed;
  var temperature;
  return 'WeatherData date: ${date.toIso8601String().replaceFirst('Z', '')}, temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, gust: $gust, weatherSymbol: $weatherSymbol, surfConditions: $surfConditions, precipitation: $precipitation';
}
