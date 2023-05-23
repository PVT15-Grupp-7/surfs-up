import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:surfs_up/language_provider.dart';
import 'package:surfs_up/pages/wrapper.dart';
import 'package:surfs_up/services/authentication_service.dart';
import 'data/app_user_data.dart';
import 'firebase/firebase_options.dart';
import 'all_pages.dart';
import 'api/MiddleWare.dart';
import 'api/app_preferences.dart';

/// Main entry point of the application.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppPref.init();
  await callAPIs();
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
      textTheme: ThemeData.dark().textTheme.apply(
            fontFamily: 'Righteous',
          ),
      colorScheme: const ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: kDarkBlue,
        centerTitle: true,
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
      scaffoldBackgroundColor: kSecondaryColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: StreamProvider<AppUser?>.value(
        value: AuthenticationService().user,
        initialData: null,
        child: Consumer<LanguageProvider>(
          builder: (context, languageProvider, _) {
            return MaterialApp(
              home: const Wrapper(),
              theme: themeData(),
            );
          },
        ),
      ),
    );
  }
}
