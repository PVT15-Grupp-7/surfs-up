import 'package:flutter/material.dart';

class SurfPage extends StatelessWidget {
  const SurfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF132246),
      body: Center(
        child: Text(
          'Surf Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
