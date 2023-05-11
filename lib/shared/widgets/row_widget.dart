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
            Icon(Icons.air_outlined, size: 30),
            Text(
              '5 m/s',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.arrow_right_alt_outlined,
              size: 30,
            ),
            Text(
              'E',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.waves_outlined, size: 30),
            Text(
              'OK',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
