import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C152D),
        title: const Text('Settings'),
      ),
      backgroundColor: const Color(0xFF132246),
      body: const Center(
        child: Text(
          'Settings Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
