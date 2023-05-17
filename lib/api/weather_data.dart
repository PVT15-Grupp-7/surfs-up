import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherData {
  DateTime date;
  dynamic windDirection, temperature, windSpeed, gust;

  //symbol to display the weather icon and surf conditions 0-3 or 5 depending how we want it
  int weatherSymbol;
  IconData weatherIcon = Icons.wb_sunny_outlined;
  IconData windIcon = Icons.arrow_right_alt_outlined;
  String windDirectionSymbol = "";
  int surfConditions = 0;
  int surf = 0;
  double precipitation;
  Row surfIcon = Row();

  WeatherData(this.date, this.temperature, this.windSpeed, this.windDirection,
      this.gust, this.weatherSymbol, this.surfConditions, this.precipitation) {
    gust = gust.round();
    setWeatherIcon(weatherSymbol);
    setWindSymbol(windDirection);
    setWindSymbolOne(windDirection);
    setSurfIcon(surfConditions);
  }

  void setWeatherSymbol(int weatherSymbol) {
    this.weatherSymbol = weatherSymbol;
  }

  int getWeatherSymbol() {
    return weatherSymbol;
  }

  void setSurfConditions(int surfConditions) {
    this.surfConditions = surfConditions;
  }

  int getSurfConditions() {
    return surfConditions;
  }

  void setTemperature(dynamic temperature) {
    this.temperature = temperature;
  }

  void setWindSpeed(dynamic windSpeed) {
    this.windSpeed = windSpeed;
  }

  void setWindDirection(dynamic wd) {
    windDirection = wd;
  }

  void setSurf(int surf) {
    this.surf = surf;
  }

  void setPrecipitation(double precipitation) {
    this.precipitation = precipitation;
  }

  void setSurfIcon(int surfConditions) {
    switch (surfConditions) {
      case 0:
        surfIcon = Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.star,
            ),
            SizedBox(width: 4),
            Icon(CupertinoIcons.star),
            SizedBox(width: 4),
            Icon(CupertinoIcons.star),
          ],
        );
        break;
      case 1:
        surfIcon = Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
            ),
            SizedBox(width: 4),
            Icon(CupertinoIcons.star),
            SizedBox(width: 4),
            Icon(CupertinoIcons.star),
          ],
        );
        break;
      case 2:
        surfIcon = Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
            ),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
            ),
            SizedBox(width: 4),
            Icon(CupertinoIcons.star),
          ],
        );
        break;
      case 3:
        surfIcon = Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
            ),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
            ),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
            ),
          ],
        );
        break;
      default:
        surfIcon = Row();
    }
  }

  void setWeatherIcon(dynamic weatherSymbol) {
    // förmodligen en bra metod att skriva unit test för
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
    }
  }

  String setWindSymbol(dynamic windDirection) {
    // Adjust the wind direction to be within the range of 0 to 360
    windDirection = (windDirection % 360 + 360) % 360;

    // Define the wind direction symbols and their corresponding values
    final symbols = {
      'N': 0,
      'NE': 45,
      'E': 90,
      'SE': 135,
      'S': 180,
      'SW': 225,
      'W': 270,
      'NW': 315,
    };

    // Calculate the closest symbol
    var closestSymbol = '';
    num minDifference = double.infinity;

    for (var symbol in symbols.keys) {
      final symbolValue = symbols[symbol]!;
      final difference = (symbolValue - windDirection).abs();

      if (difference < minDifference) {
        closestSymbol = symbol;
        minDifference = difference;
      }
    }

    windDirectionSymbol = closestSymbol;
    return closestSymbol;
  }

  IconData setWindSymbolOne(dynamic windDirection) {
    // Adjust the wind direction to be within the range of 0 to 360
    windDirection = (windDirection % 360 + 360) % 360;

    // Define the wind direction symbols and their corresponding values
    final symbols = {
      CupertinoIcons.arrow_down: 0,
      CupertinoIcons.arrow_down_left: 45,
      CupertinoIcons.arrow_left: 90,
      CupertinoIcons.arrow_up_left: 135,
      CupertinoIcons.arrow_up: 180,
      CupertinoIcons.arrow_up_right: 225,
      CupertinoIcons.arrow_right: 270,
      CupertinoIcons.arrow_down_right: 315,
    };

    // Calculate the closest symbol
    IconData closestSymbolOne = CupertinoIcons.arrow_up;
    num minDifference = double.infinity;

    for (var symbolOne in symbols.keys) {
      final symbolValue = symbols[symbolOne]!;
      final difference = (symbolValue - windDirection).abs();

      if (difference < minDifference) {
        closestSymbolOne = symbolOne;
        minDifference = difference;
      }
    }

    windIcon = closestSymbolOne;
    return closestSymbolOne;
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      DateTime.parse(json['date']),
      json['temperature'],
      json['windSpeed'],
      json['windDirection'],
      json['gust'],
      json['weatherSymbol'],
      json['surfConditions'],
      json['precipitation'],
    );
  }

  static List<WeatherData> decode(String text) {
    return (json.decode(text) as List<dynamic>)
        .map<WeatherData>((item) => WeatherData.fromJson(item))
        .toList();
  }

  static List<List<WeatherData>> getWeatherData(String text) {
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

  static Map<String, dynamic> toMap(WeatherData weatherData) => {
        'date': weatherData.date.toString(),
        'temperature': weatherData.temperature,
        'windSpeed': weatherData.windSpeed,
        'windDirection': weatherData.windDirection,
        'gust': weatherData.gust,
        'weatherSymbol': weatherData.weatherSymbol,
        'surfConditions': weatherData.surfConditions,
        'precipitation': weatherData.precipitation,
      };

  static String encode(List<WeatherData> weatherData) => json.encode(
        weatherData
            .map<Map<String, dynamic>>(
                (weatherData) => WeatherData.toMap(weatherData))
            .toList(),
      );

  @override
  String toString() {
    return 'WeatherData date: $date , temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, gust: $gust, weatherSymbol: $weatherSymbol, surfConditions: $surfConditions, precipitation: $precipitation';
  }
}
