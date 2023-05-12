import 'package:flutter/material.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key, required this.dayData}) : super(key: key);

  final List<WeatherData> dayData;

  @override
  Widget build(BuildContext context) {
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
          children: const [
            Icon(Icons.arrow_right_alt_outlined, size: 30),
            Text('E', style: CustomTextStyle.tileTextStyle),
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
}
