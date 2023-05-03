import 'package:flutter/material.dart';

class SurfPage extends StatelessWidget {
  const SurfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C152D),
        title: const Text('Surfs Up'),
      ),
      body: const Center(
        child: Text(
          'Surf Page',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}