import 'package:shared_preferences/shared_preferences.dart';

class SharedPres {
  static SharedPres instance = SharedPres.internal();

  SharedPres.internal();

  factory SharedPres() => instance;

  late SharedPreferences prefs;

  setSharedPreference(prefs) {
    this.prefs = prefs;
  }

  SharedPreferences getSharePreference() {
    return prefs;
  }
}
