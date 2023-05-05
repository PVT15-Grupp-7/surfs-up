import 'package:flutter/material.dart';
import 'package:surfs_up/shared/widgets/weather_box.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 50),
            Text(
              'Weather Page',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            WeatherBox(),
            SizedBox(height: 20),
            WeatherBox(),
            SizedBox(height: 20),
            WeatherBox(),
          ],
        ),
      ),
    );
  }
}
