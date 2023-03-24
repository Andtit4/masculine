import 'package:shared_preferences/shared_preferences.dart';

class PageControl {
  togglePageShow(bool val, SharedPreferences prefs) {
    return prefs.setBool('show', val);
  }

  togglePageShowGet(SharedPreferences prefs) {
    return prefs.getBool('show');
  }
}
