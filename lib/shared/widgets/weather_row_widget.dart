import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surfs_up/data/weather_data.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunrise_sunset_calc/sunrise_sunset_calc.dart';

/// Widget that displays the average weather data for a day, displaying it as the top row
/// in an expanded tile.
class WeatherRowWidget extends StatelessWidget {
  WeatherRowWidget({super.key, required this.dayData, required this.location});

  final Location location;
  final duration = const Duration(hours: 2);
  final dateFormat = DateFormat.Hm();
  final List<WeatherData> dayData;

  @override
  Widget build(BuildContext context) {
    var locationSunrise = getSunriseSunset(location.latCoordinate,
        location.longCoordinate, duration, dayData[0].date);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Icon(getMostFrequentWeatherIcon(dayData)),
            const SizedBox(width: 4),
            Text(averageTemperature(), style: CustomTextStyle.tileTextStyle),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          children: [
            const Icon(Icons.umbrella, size: 30),
            Text('${totalPrecipitation()}mm',
                style: CustomTextStyle.tileTextStyle),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Column(
          children: const [
            Icon(CupertinoIcons.sunrise_fill, size: 30),
            SizedBox(height: 4),
            Icon(
              CupertinoIcons.sunset_fill,
              size: 30,
            ),
          ],
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          children: [
            Text(dateFormat.format(locationSunrise.sunrise).toString(),
                style: CustomTextStyle.tileTextStyle),
            const SizedBox(height: 18),
            Text(dateFormat.format(locationSunrise.sunset).toString(),
                style: CustomTextStyle.tileTextStyle),
          ],
        ),
      ],
    );
  }

  String averageTemperature() {
    double sum = 0;
    for (var item in dayData) {
      sum += item.temperature;
    }
    return (sum / dayData.length).round().toString();
  }

  IconData getMostFrequentWeatherIcon(List<WeatherData> dayData) {
    Map<IconData, int> iconCounts = {};

    /// Count the occurrences of each weather icon
    for (var data in dayData) {
      IconData icon = data.weatherIcon;
      iconCounts[icon] = (iconCounts[icon] ?? 0) + 1;
    }
    /// Find the weather icon with the highest count
    IconData mostFrequentIcon = Icons.wb_sunny_outlined;
    int maxCount = 0;
    iconCounts.forEach((icon, count) {
      if (count > maxCount) {
        mostFrequentIcon = icon;
        maxCount = count;
      }
    });
    return mostFrequentIcon;
  }

  String totalPrecipitation() {
    double sum = 0;
    for (var item in dayData) {
      sum += item.precipitation;
    }
    return sum.toStringAsFixed(1);
  }
}
