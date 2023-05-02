import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/pages/wrapper.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'data/app_user_data.dart';
import 'firebase/firebase_options.dart';
import 'all_pages.dart';

/// Main entry point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

/// Main application widget. It provides a theme for the application and a StreamProvider
/// that keeps track of the current state of the AppUser. The child widget Wrapper()
/// will then decide which page to show based on the state of the AppUser.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData themeData() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kPrimaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: kPrimaryColor,
          selectedItemColor: kSecondaryColor,
          unselectedItemColor: kPrimaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: kPrimaryColor,
          padding: const EdgeInsets.fromLTRB(30, 12, 30, 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser?>.value(
      value: AuthenticationService().user,
      initialData: null,
      child: MaterialApp(
        home: const Wrapper(),
        theme: themeData(),
      ),
    );
  }
}
