import 'package:flutter/material.dart';
import 'package:surfs_up/api/app_preferences.dart';

enum Language { english, swedish }

class LanguageProvider extends ChangeNotifier {
  Language _selectedLanguage = AppPref.getLanguage();

  Language get selectedLanguage => _selectedLanguage;

  void setLanguage(Language language) {
    if (_selectedLanguage != language) {
      AppPref.preferences.setString('surfUpLanguage', language.toString());
      _selectedLanguage = language;
      notifyListeners();
    }
  }
}
