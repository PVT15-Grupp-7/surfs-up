import 'package:flutter/material.dart';

class SafetyPageDefibrillatorPage extends StatelessWidget {
  const SafetyPageDefibrillatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF132246),
      appBar: AppBar(
        title: const Text('Defibrillator'),
      ),
      body: const Center(
        child: Text(
          'Defibrillator content',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
