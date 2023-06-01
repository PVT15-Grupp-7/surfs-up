import 'package:shared_preferences/shared_preferences.dart';
import 'package:surfs_up/shared/language_provider.dart';

/// This class is used to store and retrieve data from the device by utilizing the shared_preferences package.
class AppPref {
  static late final SharedPreferences preferences;
  static bool _init = false;

  static Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    await firstTimeSetup();
    return preferences;
  }

  static firstTimeSetup() {
    if(preferences.getBool('surfUpSetup') == null) {
      setLanguage(Language.english);
      setNotification(false);
      setLocationNotification('toroNotification', false);
      setLocationNotification('vaddoNotification', false);
      setNotificationWindValues(['5', '10']);
      preferences.setBool('surfUpSetup', true);
    }
  }

  static getString(String key) {
    return preferences.getString(key);
  }

  static Language getLanguage() {
    String? language = preferences.getString('surfUpLanguage');
    return language == 'Language.english' ? Language.english : Language.swedish;
  }

  static void setLanguage(Language language) {
    preferences.setString('surfUpLanguage', language.toString());
  }

  static bool? getNotification() {
    return preferences.getBool('notification');
  }

  static void setNotification(bool value) {
    preferences.setBool('notification', value);
  }

  static bool? getLocationNotification(String location) {
    return preferences.getBool(location);
  }

  static void setLocationNotification(String location, bool value) {
    preferences.setBool(location, value);
  }

  static List<String> getNotificationWindValues() {
    return preferences.getStringList('windValues')!;
  }

  static void setNotificationWindValues(List<String> values) {
    preferences.setStringList('windValues', values);
  }
}
