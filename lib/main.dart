import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
import 'all_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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
        unselectedItemColor: kPrimaryColor
      ),
    );
  }

  


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Surfs Up',
      home: HomePage(title: 'Surfs Up'),
    );
  }
}


