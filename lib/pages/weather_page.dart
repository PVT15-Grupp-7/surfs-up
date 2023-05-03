import 'package:flutter/material.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C152D),
        title: const Text('Weather Page'),
      ),
      body: const Center(
        child: Text(
          'Weather Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}