import 'package:flutter/material.dart';
import 'package:surfs_up/shared/widgets/weather_expansion.dart';

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
            SizedBox(height: 64),
            Expanded(
              child: WeatherExpansionPage(),
            ),
          ],
      ),
      ),
    );
  }
}
