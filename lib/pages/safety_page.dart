import 'package:flutter/material.dart';

class SafetyPage extends StatelessWidget {
  const SafetyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF132246),
      body: Center(
        child: Text(
          'Safety Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
