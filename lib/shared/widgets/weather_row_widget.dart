import 'package:flutter/material.dart';

class WeatherRowWidget extends StatelessWidget {
  const WeatherRowWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.wb_sunny_outlined),
            Text('8'),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.umbrella),
            Text('0,0mm'),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.sunny_snowing),
            Text('04:56'),
          ],
        ),
      ],
    );
  }
}
