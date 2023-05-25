import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/all_pages.dart';
import 'package:surfs_up/api/app_preferences.dart';
import 'package:surfs_up/api/weather_data.dart';
import 'package:surfs_up/data/location_data.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/pages/about_us_page.dart';
import 'package:surfs_up/pages/info_page.dart';
import 'package:surfs_up/pages/preferences_page.dart';
import 'package:surfs_up/pages/safety_page.dart';
import 'package:surfs_up/pages/surf_page.dart';
import 'package:surfs_up/pages/weather_page.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'package:surfs_up/pages/beginners_tips.dart';
import 'package:surfs_up/shared/widgets/language_dialog_button_widget.dart';

class NavigationAdmin extends StatefulWidget {
  const NavigationAdmin({Key? key}) : super(key: key);

  @override
  State<NavigationAdmin> createState() => _NavigationAdminState();
}

class _NavigationAdminState extends State<NavigationAdmin> {
  final AuthenticationService _auth = AuthenticationService();

  late int _selectedTab;
  late Widget _selectedPage;
  late bool? isSwitched;
  late Location _selectedLocation;
  late List<List<WeatherData>> _weatherData;
  late Color switchedColor = isSwitched! ? Colors.green : Colors.red;

  void _getWeatherDataList() {
    final String? weatherString =
        AppPref.getString(_selectedLocation.sharedPreferences);
    _weatherData = WeatherData.getWeatherData(weatherString!);
  }

  @override
  void initState() {
    super.initState();
    isSwitched = AppPref.getNotification();
    _selectedTab = 0;
    _selectedLocation = locations[0];
    _getWeatherDataList();
    _selectedPage = SurfPage(listOfDayWeatherData: _weatherData);
  }

  Future<void> _showLogoutConfirmationDialog(Language language) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(language == Language.english ? 'Log Out' : "Logga ut"),
          content: Text(language == Language.english
              ? 'Are you sure you want to log out?'
              : "Är du säker på att du vill logga ut?"),
          actions: <Widget>[
            TextButton(
              child: Text(
                language == Language.english ? 'No' : "Nej",
                style: const TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Stänger dialogrutan
              },
            ),
            TextButton(
              child: Text(language == Language.english ? 'Yes' : "Ja"),
              onPressed: () async {
                Navigator.of(context).pop(); // Stänger dialogrutan

                // Visa notifiering
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(language == Language.english
                        ? 'Logged out successfully'
                        : "Utloggad"),
                    backgroundColor: Colors.green,
                    duration: const Duration(seconds: 2),
                  ),
                );
                await _auth.signOut();
              },
            ),
          ],
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
      if (index == 0) {
        _selectedPage = SurfPage(listOfDayWeatherData: _weatherData);
      } else if (index == 1) {
        _selectedPage = WeatherPage(
          listOfDayWeatherData: _weatherData,
          location: _selectedLocation,
        );
      } else if (index == 2) {
        _selectedPage = SafetyPage(
          location: _selectedLocation,
        );
      } else if (index == 3) {
        _selectedPage = InfoPage(location: _selectedLocation);
      }
    });
  }

  void toggleNotification(bool value) {
    setState(() {
      AppPref.setNotification(value);
      isSwitched = value;
      switchedColor = isSwitched! ? Colors.green : Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<LanguageProvider>(context).selectedLanguage;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DropdownButton(
            alignment: Alignment.center,
            underline: const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(20),
            dropdownColor: kDarkBlue,
            value: _selectedLocation,
            icon: const Icon(Icons.arrow_drop_down_circle),
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
        actions: const [
          LanguageDialogButton(),
        ],
      ),
      drawer: Drawer(
        width: 260,
        backgroundColor: kDarkBlue,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
              title: Text(
                  selectedLanguage == Language.english ? 'About us' : "Om oss"),
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
              leading: const Icon(
                Icons.tips_and_updates_outlined,
                color: Colors.yellow,
              ),
              title: Text(selectedLanguage == Language.english
                  ? 'Tips for Beginners'
                  : "Tips för nybörjare"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BeginnersTipsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications_outlined,
                color: switchedColor,
              ),
              title: Text(selectedLanguage == Language.english
                  ? 'Notifications'
                  : "Notifikationer"),
              trailing: Switch(
                value: isSwitched!,
                onChanged: toggleNotification,
                activeColor: kPrimaryColor,
                activeTrackColor: kPrimaryColor,
                inactiveThumbColor: Colors.red,
                inactiveTrackColor: Colors.red,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: Colors.grey,
              ),
              title: Text(selectedLanguage == Language.english
                  ? 'Preferences'
                  : "Preferenser"),
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
              leading: const Icon(Icons.logout),
              iconColor: Colors.red,
              textColor: Colors.red,
              title: Text(selectedLanguage == Language.english
                  ? 'Sign out'
                  : "Logga ut"),
              onTap: () async {
                await _showLogoutConfirmationDialog(selectedLanguage);
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
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.surfing,
              ),
              label: "Surf",
              backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: const Icon(Icons.sunny),
              label: selectedLanguage == Language.english ? 'Weather' : 'Väder',
              backgroundColor: kDarkBlue),
          BottomNavigationBarItem(
              icon: const Icon(Icons.heart_broken),
              label:
                  selectedLanguage == Language.english ? 'Safety' : 'Säkerhet',
              backgroundColor: kDarkBlue),
          const BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: "Info",
              backgroundColor: kDarkBlue),
        ],
      ),
    );
  }
}
