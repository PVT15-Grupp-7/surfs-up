import 'dart:convert';

class WeatherData{

  String date;
  dynamic windDirection, temperature, windSpeed, gust;
  //symbol to display the weather icon and surf conditions 0-3 or 5 dependig how we want it
  int weatherSymbol;
  int surfConditions = 0;
  bool surf = false;

WeatherData(this.date, this.temperature, this.windSpeed, this.windDirection, this.gust, this.weatherSymbol, this.surfConditions){
  this.gust = gust.round();
}

  void setWeatherSymbol(int weatherSymbol){
    this.weatherSymbol = weatherSymbol;
  }
  int getWeatherSymbol(){
    return weatherSymbol;
  }

  void setSurfConditions(int surfConditions){
    this.surfConditions = surfConditions;
  }
  int getSurfConditions(){
    return surfConditions;
  }

  void setTemperature(dynamic temperature){
    this.temperature = temperature;
  }
  void setWindSpeed(dynamic windSpeed){
    this.windSpeed = windSpeed;
  }
  void setWindDirection(dynamic wd){
    windDirection = wd;
  }

  void setSurf(bool surf){
    this.surf = surf;
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

  static List<WeatherData> decode(String text) =>
      (json.decode(text) as List<dynamic>)
          .map<WeatherData>((item) => WeatherData.fromJson(item))
          .toList();

  static Map<String, dynamic> toMap(WeatherData weatherData) => {
    'date': weatherData.date,
    'temperature': weatherData.temperature,
    'windSpeed': weatherData.windSpeed,
    'windDirection': weatherData.windDirection,
    'gust': weatherData.gust,
    'weatherSymbol': weatherData.weatherSymbol,
    'surfConditions': weatherData.surfConditions,
  };

  static String encode(List<WeatherData> weatherData) => json.encode(
    weatherData
        .map<Map<String, dynamic>>((weatherData) => WeatherData.toMap(weatherData))
        .toList(),
  );


  @override
  String toString() {
    return 'WeatherData date: $date , temperature: $temperature, windSpeed: $windSpeed, windDirection: $windDirection, gust: $gust, weatherSymbol: $weatherSymbol, surfConditions: $surfConditions';
  }

}