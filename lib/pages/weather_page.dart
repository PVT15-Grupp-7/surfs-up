import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/shared/widgets/weather_box.dart';
import 'package:surfs_up/shared/widgets/row_widget.dart';
import 'package:surfs_up/shared/widgets/weather_expansion_panel.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(height: 50),
            Text(
              'Weather Page',
              style: TextStyle(color: Colors.white),
            ),
            Expanded(
              child: WeatherExpansionPage(),
            ),
          ],
        ),
      ),
    );
  }
}
