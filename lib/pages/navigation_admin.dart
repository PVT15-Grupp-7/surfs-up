import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/pages/about_us_page.dart';
import 'package:surfs_up/pages/info_page.dart';
import 'package:surfs_up/pages/preferences_page.dart';
import 'package:surfs_up/pages/safety_page.dart';
import 'package:surfs_up/pages/surf_page.dart';
import 'package:surfs_up/pages/weather_page.dart';
import 'package:surfs_up/services/authentication_service.dart';

class NavigationAdmin extends StatefulWidget {
  const NavigationAdmin({Key? key}) : super(key: key);

  @override
  State<NavigationAdmin> createState() => _NavigationAdminState();
}

class _NavigationAdminState extends State<NavigationAdmin> {
  final AuthenticationService _auth = AuthenticationService();

  int _selectedTab = 0;
  Widget _selectedPage = const SurfPage();
  String _title = "Surf";
  bool isSwitched = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
      if (index == 0) {
        _selectedPage = const SurfPage();
        _title = 'Surf';
      } else if (index == 1) {
        _selectedPage = const WeatherPage();
        _title = 'Weather';
      } else if (index == 2) {
        _selectedPage = const SafetyPage();
        _title = 'Safety';
      } else if (index == 3) {
        _selectedPage = const InfoPage();
        _title = 'Info';
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
        title: Text(_title),
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
