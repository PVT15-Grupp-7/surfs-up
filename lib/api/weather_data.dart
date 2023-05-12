import 'dart:convert';
import 'package:flutter/material.dart';

class WeatherData {

  String date;
  dynamic windDirection, temperature, windSpeed, gust;

  //symbol to display the weather icon and surf conditions 0-3 or 5 depending how we want it
  int weatherSymbol;
  late IconData weatherIcon;
  late IconData windIcon;
  int surfConditions = 0;
  bool surf = false;

  WeatherData(this.date, this.temperature, this.windSpeed, this.windDirection,
      this.gust, this.weatherSymbol, this.surfConditions) {
    gust = gust.round();
    setWeatherIcon(weatherSymbol);


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

  void setSurf(bool surf) {
    this.surf = surf;
  }

  void setWeatherIcon(dynamic weatherSymbol) {
    switch(weatherSymbol) {
      case 1-3:
        windIcon = Icons.sunny;
        break;
      case 4:
        windIcon = Icons.cloud;
        break;
    }
  }

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      json['date'],
      json['temperature'],
      json['windSpeed'],
      json['windDirection'],
      json['gust'],
      json['weatherSymbol'],
      json['surfConditions'],
    );
  }

  static List<WeatherData> decode(String text) {
    return (json.decode(text) as List<dynamic>)
        .map<WeatherData>((item) => WeatherData.fromJson(item))
        .toList();
  }

  static List<List<WeatherData>> getWeatherData(String text) {
    List<List<WeatherData>> weatherData = [];
    List<WeatherData> weatherList = decode(text);

    int currentDay = DateTime.parse(weatherList[0].date).day;
    int lastHour = weatherList.length - 1;

    for (int i = 0; i < weatherList.length;) {
      if (currentDay == DateTime.parse(weatherList[i].date).day) {
        int hoursRemaining = 24 - DateTime.parse(weatherList[i].date).hour;
        weatherData.add(weatherList.sublist(i, i + hoursRemaining));
        i += hoursRemaining;
      } else {
        currentDay = DateTime.parse(weatherList[i].date).day;
        int maxHoursLeft = (lastHour - i) < 24 ? (lastHour - i) : 24;
        weatherData.add(weatherList.sublist(i, i + maxHoursLeft));
        i += 24;
      }
    }
    return weatherData;
  }

  static Map<String, dynamic> toMap(WeatherData weatherData) =>
      {
        'date': weatherData.date,
        'temperature': weatherData.temperature,
        'windSpeed': weatherData.windSpeed,
        'windDirection': weatherData.windDirection,
        'gust': weatherData.gust,
        'weatherSymbol': weatherData.weatherSymbol,
        'surfConditions': weatherData.surfConditions,
      };

  static String encode(List<WeatherData> weatherData) =>
      json.encode(
        weatherData
            .map<Map<String, dynamic>>((weatherData) =>
            WeatherData.toMap(weatherData))
            .toList(),
      );


  @override
  String toString() {
    return 'WeatherData date: $date , temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, gust: $gust, weatherSymbol: $weatherSymbol, surfConditions: $surfConditions';
  }
}