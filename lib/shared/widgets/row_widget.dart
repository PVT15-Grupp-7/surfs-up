import 'package:flutter/material.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key, required this.dayData}) : super(key: key);

  final List<WeatherData> dayData;

  @override
  Widget build(BuildContext context) {
    final mostFrequentSymbol = getMostFrequentWindDirectionSymbol(dayData);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.air_outlined, size: 30),
            Text(averageSpeed(), style: CustomTextStyle.tileTextStyle),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(getMostFrequentWindArrow(dayData), size: 30),
            Text(mostFrequentSymbol, style: CustomTextStyle.tileTextStyle),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.waves_outlined, size: 30),
            Text('OK', style: CustomTextStyle.tileTextStyle),
          ],
        ),
      ],
    );
  }

  String averageSpeed() {
    double sum = 0;
    for (var item in dayData) {
      sum += item.windSpeed;
    }
    return (sum / dayData.length).round().toString();
  }

  String getMostFrequentWindDirectionSymbol(List<WeatherData> dayData) {
    // Create a map to count the occurrences of each wind direction symbol
    final symbolCounts = <String, int>{};

    // Count the occurrences of each wind direction symbol
    for (var data in dayData) {
      final symbol = data.windDirectionSymbol;
      symbolCounts[symbol] = (symbolCounts[symbol] ?? 0) + 1;
    }

    // Find the wind direction symbol with the maximum count
    String mostFrequentSymbol = '';
    int maxCount = 0;

    symbolCounts.forEach((symbol, count) {
      if (count > maxCount) {
        mostFrequentSymbol = symbol;
        maxCount = count;
      }
    });

    return mostFrequentSymbol;
  }

  IconData getMostFrequentWindArrow(List<WeatherData> dayData) {
    Map<IconData, int> iconCounts = {};

    // Count the occurrences of each arrow icon
    for (var data in dayData) {
      IconData icon = data.windIcon;
      iconCounts[icon] = (iconCounts[icon] ?? 0) + 1;
    }

    // Find the arrow icon with the highest count
    IconData mostFrequentIcon = Icons.arrow_right_alt_outlined;
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
