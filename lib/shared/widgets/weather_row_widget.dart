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
            Icon(Icons.wb_sunny_outlined, size: 30),
            Text('8', style: TextStyle(fontSize: 18)),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.umbrella, size: 30),
            Text('0,0mm', style: TextStyle(fontSize: 18)),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.sunny_snowing, size: 30),
            Text('04:56', style: TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }
}
