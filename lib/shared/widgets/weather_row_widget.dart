import 'package:flutter/material.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:flutter/cupertino.dart';

class WeatherRowWidget extends StatelessWidget {
  const WeatherRowWidget({super.key, required this.dayData});

  final List<WeatherData> dayData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(getMostFrequentWeatherIcon(dayData)),
            const SizedBox(width: 4),
            Text(averageTemperature(), style: CustomTextStyle.tileTextStyle),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.umbrella, size: 30),
            Text('0,0mm', style: CustomTextStyle.tileTextStyle),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(CupertinoIcons.sunrise_fill, size: 30),
            SizedBox(width: 4),
            Text('04:56', style: CustomTextStyle.tileTextStyle),
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

    // Count the occurrences of each weather icon
    for (var data in dayData) {
      IconData icon = data.weatherIcon;
      iconCounts[icon] = (iconCounts[icon] ?? 0) + 1;
    }

    // Find the weather icon with the highest count
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
}
