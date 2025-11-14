import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    if(sharedPreferences == null) {
    sharedPreferences = await SharedPreferences.getInstance();
    }
    
  }

  static Future<void> setBool(String key, bool value) {
    return sharedPreferences!.setBool(key, value);
  }

  static bool? getBool(String key) {
    return sharedPreferences!.getBool(key);
  }


}