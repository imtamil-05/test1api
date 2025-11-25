import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences sharedPreferences;

  static Future init() async {
  
    sharedPreferences = await SharedPreferences.getInstance();
    
    
  }

  static Future setBool(String key, bool value)async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return sharedPreferences.getBool(key);
  }


}