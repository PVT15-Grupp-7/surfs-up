import 'package:flutter/material.dart';
import 'package:surfs_up/shared/widgets/surf_expansion.dart';

class SurfPage extends StatelessWidget {
  const SurfPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 12),
            Expanded(
              child: MyApp(),
            ),
          ],
        ),
      ),
    );
  }
}
