import 'package:flutter/material.dart';
import 'package:surfs_up/shared/widgets/surf_expansion.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/shared/constants/custom_text_style.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/api/app_preferences.dart';


class SurfPage extends StatelessWidget {
  final Location location;
  const SurfPage({Key? key, required this.location}) : super(key: key);

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
    final String weatherData = AppPref.preferences.getString(location.sharedPreferences)!;
    List<WeatherData> weatherList = WeatherData.decode(weatherData);
    

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(weatherList.length.toString()),
            const SizedBox(height: 50.0,),
            for(int i = 0; i < weatherList.length; i++)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  weatherList[i].toString(),
                  style: CustomTextStyle.paragraph1,
                ),
              ),
        ],
      ),
      ),
    );
  }
}
