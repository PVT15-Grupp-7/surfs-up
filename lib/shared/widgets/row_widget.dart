import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('04/05/23'),
            Icon(Icons.wb_sunny_outlined),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('5 m/s'),
            Icon(Icons.air_outlined),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('E'),
            Icon(Icons.arrow_right_alt_outlined),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('OK'),
            Icon(Icons.waves_outlined),
          ],
        ),
      ],
    );
  }
}
