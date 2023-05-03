import 'package:flutter/material.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/services/authentication_service.dart';

class NavigationAdmin extends StatefulWidget {
  const NavigationAdmin({Key? key}) : super(key: key);

  @override
  State<NavigationAdmin> createState() => _NavigationAdminState();
}

class _NavigationAdminState extends State<NavigationAdmin> {
  final AuthenticationService _auth = AuthenticationService();

  int _selectedTab = 0;

  final List _pages = const [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("About"),
    ),
    Center(
      child: Text("Products"),
    ),
    Center(
      child: Text("Contact"),
    ),
    Center(
      child: Text("Settings"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF0C152D),
          title: const Text('Surfs Up'),
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
            )
          ]
      ),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.surfing), label: "Surf",backgroundColor: kDarkBlue),
          BottomNavigationBarItem(icon: Icon(Icons.sunny), label: "Weather", backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.warning_amber), label: "Safety", backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline), label: "Info", backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings", backgroundColor: kDarkBlue),
        ],
      ),
    );
  }
}