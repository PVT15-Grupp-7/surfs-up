import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF132246),
      body: Center(
        child: Text(
          'Info Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
