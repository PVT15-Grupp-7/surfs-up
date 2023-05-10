import 'package:flutter/material.dart';
import 'package:surfs_up/shared/widgets/app_bar.dart';
import 'package:surfs_up/shared/constants/dynamic_content.dart';
//import 'package:surfs_up/shared/widgets/surf_expansion_panel.dart';
import 'package:surfs_up/shared/widgets/weather_box.dart';
import 'package:surfs_up/shared/widgets/test_expansion.dart';



//import 'package:surfs_up/shared/widgets/weather_box.dart';





class SurfPage extends StatelessWidget {
  const SurfPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Surf Page',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: MyApp(),
            ),
          ],
        ),
      ),
    );
  }
}
