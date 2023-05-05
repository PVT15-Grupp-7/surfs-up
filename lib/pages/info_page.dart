import 'package:flutter/material.dart';
import 'package:surfs_up/data/location_data.dart';

class InfoPage extends StatelessWidget {
  final Location location;
  const InfoPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF132246),
      body: Center(
        child: Text(
          'adress${location.getadress()}',
        ),
      ),
    );
  }
}
