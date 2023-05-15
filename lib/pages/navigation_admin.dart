import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/api/app_preferences.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/pages/about_us_page.dart';
import 'package:surfs_up/pages/info_page.dart';
import 'package:surfs_up/pages/preferences_page.dart';
import 'package:surfs_up/pages/safety_page.dart';
import 'package:surfs_up/pages/surf_page.dart';
import 'package:surfs_up/pages/weather_page.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'package:surfs_up/pages/for_beginners.dart';

class NavigationAdmin extends StatefulWidget {
  const NavigationAdmin({Key? key}) : super(key: key);

  @override
  State<NavigationAdmin> createState() => _NavigationAdminState();
}

class _NavigationAdminState extends State<NavigationAdmin> {
  final AuthenticationService _auth = AuthenticationService();

  late int _selectedTab;
  late Widget _selectedPage;
  bool isSwitched = false;
  late Location _selectedLocation;
  late List<List<WeatherData>> _weatherData;

  void _getWeatherDataList() {
    final String? weatherString =
        AppPref.getString(_selectedLocation.sharedPreferences);
    _weatherData = WeatherData.getWeatherData(weatherString!);
  }

  @override
  void initState() {
    super.initState();
    _selectedTab = 0;
    _selectedLocation = locations[0];
    _getWeatherDataList();
    _selectedPage = SurfPage(listOfDayWeatherData: _weatherData);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
      if (index == 0) {
        _selectedPage = SurfPage(listOfDayWeatherData: _weatherData);
      } else if (index == 1) {
        _selectedPage = WeatherPage(listOfDayWeatherData: _weatherData,);
      } else if (index == 2) {
        _selectedPage = SafetyPage(
          location: _selectedLocation,
        );
      } else if (index == 3) {
        _selectedPage = InfoPage(location: _selectedLocation);
      }
    });
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            margin: const EdgeInsets.only(right: 40),
            child: DropdownButton(
                borderRadius: BorderRadius.circular(20),
                dropdownColor: kDarkBlue,
                value: _selectedLocation,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: locations.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(
                      location.name,
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue as Location;
                    _getWeatherDataList();
                    _onItemTapped(_selectedTab);
                  });
                }),
          ),
        ),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: kDarkBlue,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Preferences'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreferencesPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: Switch(
                value: isSwitched,
                onChanged: toggleSwitch,
                activeColor: kPrimaryColor,
                activeTrackColor: kPrimaryColor,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.red,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('For Begginers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForBeginnersPage(),
                  ),
                );
              },
            ),
            ListTile(
              iconColor: Colors.red,
              textColor: Colors.red,
              leading: const Icon(Icons.logout),
              title: const Text('Sign out'),
              onTap: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
      ),
      body: _selectedPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        showUnselectedLabels: true,
        onTap: (index) => _onItemTapped(index),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.surfing,
              ),
              label: "Surf",
              backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.sunny),
              label: "Weather",
              backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken),
              label: "Safety",
              backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info",
              backgroundColor: kDarkBlue),
        ],
      ),
    );
  }
}
