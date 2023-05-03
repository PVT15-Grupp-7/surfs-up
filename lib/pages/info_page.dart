import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C152D),
        title: const Text('Info Page'),
      ),
      body: const Center(
        child: Text(
          'Info Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}