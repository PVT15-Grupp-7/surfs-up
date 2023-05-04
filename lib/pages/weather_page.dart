import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF132246),
      body: Center(
        child: Text(
          'Weather Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
