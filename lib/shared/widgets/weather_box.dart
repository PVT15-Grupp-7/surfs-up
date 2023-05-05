import 'package:flutter/material.dart';
import 'package:surfs_up/pages/weather_page.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(69, 97, 161, 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('04/05/23'),
                Icon(Icons.wb_sunny_outlined),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('5 m/s'),
                Icon(Icons.air_outlined),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('E'),
                Icon(Icons.arrow_right_alt_outlined),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('OK'),
                Icon(Icons.waves_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
