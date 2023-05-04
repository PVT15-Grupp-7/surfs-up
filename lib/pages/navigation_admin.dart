import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/pages/info_page.dart';
import 'package:surfs_up/pages/menu_page.dart';
import 'package:surfs_up/pages/safety_page.dart';
import 'package:surfs_up/pages/settings_page.dart';
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
  String _title = "";

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
        _selectedPage = const InfoPage();
        _title = 'Info';
      } else if (index == 3) {
        _selectedPage = const SafetyPage();
        _title = 'Safety';
      } else if (index == 4) {
        _selectedPage = const SettingsPage();
        _title = 'Settings';
      } else if (index == 5) {
        _selectedPage = const MenuPage();
        _title = 'Menu';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF0C152D),
          title: Text(_title),
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
      drawer: Drawer(
        width: 200,
        backgroundColor: Color.fromARGB(255, 213, 215, 221).withOpacity(0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListView(
          children: [
            const ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: const Text('Menu'),
              selected: _selectedTab == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: _selectedPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
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
              icon: Icon(Icons.warning_amber),
              label: "Safety",
              backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline),
              label: "Info",
              backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: kDarkBlue),
        ],
      ),
    );
  }
}
