import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

class RowWidget extends StatelessWidget {
  RowWidget({Key? key, required this.dayData}) : super(key: key);

  final List<WeatherData> dayData;
  Row surfIcon = Row();

  @override
  Widget build(BuildContext context) {
    final mostFrequentSymbol = getMostFrequentWindDirectionSymbol(dayData);
    int highestSurfCondition = findHighestSurfCondition(dayData);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.air_outlined, size: 30),
            Text('${averageSpeed()}m/s (${avarageGust()})',
                style: CustomTextStyle.tileTextStyle),
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
          children: [
            setSurfIcon(highestSurfCondition),
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

  String avarageGust() {
    double sum = 0;
    for (var item in dayData) {
      sum += item.gust;
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

  Row setSurfIcon(int surfConditions) {
    switch (surfConditions) {
      case 0:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.star,
              color: Color(0xFF5A5A5A),
            ),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.star,
              color: Color(0xFF5A5A5A),
            ),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.star,
              color: Color(0xFF5A5A5A),
            ),
          ],
        );

      case 1:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
            ),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.star,
              color: Color(0xFF5A5A5A),
            ),
            SizedBox(width: 4),
            Icon(
              CupertinoIcons.star,
              color: Color(0xFF5A5A5A),
            ),
          ],
        );

      case 2:
        return Row(
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
              CupertinoIcons.star,
              color: Color(0xFF5A5A5A),
            ),
          ],
        );

      case 3:
        return Row(
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

      default:
        return Row();
    }
  }

  int findHighestSurfCondition(List<WeatherData> dayData) {
    int highestSurfCondition = 0;
    for (var data in dayData) {
      if (data.surfConditions > highestSurfCondition) {
        highestSurfCondition = data.surfConditions;
      }
    }
    return highestSurfCondition;
  }
}
