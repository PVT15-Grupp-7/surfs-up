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
            Icon(dayData[0].windIcon, size: 30),
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
}
