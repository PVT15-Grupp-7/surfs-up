import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/api/app_preferences.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/shared/constants/dynamic_content.dart';
import 'package:surfs_up/shared/widgets/row_widget.dart';

class SurfExpansionPage extends StatefulWidget {
  final Location location;
  const SurfExpansionPage({Key? key, required this.location}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SurfExpansionPageState createState() => _SurfExpansionPageState();
}

class Hour {
  Hour({
    required this.hourItems,
  });

  List<HourItem> hourItems;
}

class HourItem {
  HourItem({
    required this.hour,
    required this.icon,
    required this.windSpeed,
    required this.windIcon,
    required this.windDirection,
    required this.surfStatus,
    required this.surfIcon,
  });

  int hour;
  IconData icon;
  String windSpeed;
  IconData windIcon;
  String windDirection;
  String surfStatus;
  IconData surfIcon;
}

class _SurfExpansionPageState extends State<SurfExpansionPage> {
  List<Hour> hours = [];
  final List<Map<String, dynamic>> _items = [];

  static List<Hour> generateItems(Location location) {
    final List<Hour> hours = [];
    final now = DateTime.now();
    final remainingHours = 24 - now.hour;
    final currentDayItems = generateHourItems(location, remainingHours, startHour: now.hour);
    hours.add(Hour(hourItems: currentDayItems));
    

    for (var i = 1; i <= 4; i++) {
    final upcomingDate = now.add(Duration(days: i));
    final upcomingDayItems = generateHourItems(location, 24, startHour: 0);
    hours.add(Hour(hourItems: upcomingDayItems));
  }
  return hours;
  }

  @override
  void initState() {
    super.initState();
    hours = generateItems(widget.location);
    final today = DateTime.now();
    _items.add({
      "date": today,
    });
    for (var i = 1; i <= 4; i++) {
      final upcomingDate = today.add(Duration(days: i));
      _items.add({
        "date": upcomingDate,
      });
    }
  }

  static List<HourItem> generateHourItems(Location location, int count, {int startHour = 0}) {
    final String weatherString = AppPref.preferences.getString(location.sharedPreferences)!;
    List<WeatherData> weatherData = WeatherData.decode(weatherString);
    final List<HourItem> hourItems = [];
    for (int i = 0; i < count; i++) {
      final hour = (startHour + i) % 24;
      hourItems.add(
        HourItem(
          hour: hour,
          icon: Icons.wb_sunny_outlined,
          windSpeed: weatherData[i + now.hour].windSpeed.toString(),
          windIcon: Icons.air_outlined,
          windDirection: weatherData[i + now.hour].windDirection.toString(),
          surfStatus: 'OK',
          surfIcon: Icons.waves_outlined,
        ),
      );
    }
    return hourItems;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    
    return Scaffold(
        backgroundColor: kSecondaryColor,
        body: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (_, index) {
              final item = _items[index];
              final date = item['date'] as DateTime;
              final dateFormat = DateFormat('EEE, MMM d');
              final isToday = index == 0;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  key: PageStorageKey(item['id']),
                  color: const Color(0xff223979),
                  elevation: 4,
                  child: ExpansionTile(
                    iconColor: Colors.white,
                    collapsedTextColor: Colors.white,
                    collapsedIconColor: Colors.white,
                    childrenPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    title: Text(
                      isToday ? "Today" : dateFormat.format(date),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Righteous',
                        fontSize: 20,
                      ),
                    ),
                    subtitle: const RowWidget(),
                    tilePadding: const EdgeInsets.all(11),
                    textColor: Colors.white,
                    children: hours[index].hourItems.map((HourItem hourItem) {
                      return Container(
                        width: 500,
                        decoration: BoxDecoration(
                          color: kDarkBlue,
                          border: Border.all(
                            color: const Color.fromARGB(255, 88, 84, 84),
                            width: 1,
                          ),
                        ),
                        child: ListTile(
                          leading: Text('${hourItem.hour}:00'),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      hourItem.windIcon,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      hourItem.windSpeed,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Righteous',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.arrow_right_alt_outlined,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(hourItem.windDirection,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Righteous',
                                          fontSize: 18,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      hourItem.surfIcon,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    Text(
                                      hourItem.surfStatus,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Righteous',
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            }));
  }
}
