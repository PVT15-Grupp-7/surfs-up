import 'package:shared_preferences/shared_preferences.dart';
import 'package:surfs_up/language_provider.dart';

class AppPref {
  static late final SharedPreferences preferences;
  static bool _init = false;

  static Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    if(preferences.getString('surfUpLanguage') == null) {
      preferences.setString('surfUpLanguage', 'Language.english');
    }
    if(preferences.getBool('notification') == null) {
      preferences.setBool('notification', false);
    }
    return preferences;
  }

  static getString(String key) {
    return preferences.getString(key);
  }

  static Language getLanguage() {
    String? language = preferences.getString('surfUpLanguage');
    return language == 'Language.english' ? Language.english : Language.swedish;
  }

  static bool? getNotification() {
    return preferences.getBool('notification');
  }

  static void setNotification(bool value) {
    preferences.setBool('notification', value);
  }
}
