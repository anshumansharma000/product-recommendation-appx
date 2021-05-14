import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices{
  static String sharedPreferencesUserLoggedInKey = 'ISLOGGEDIN';
  static String sharedPreferencesUserNameKey = 'USERNAMEKEY';
  static String sharedPreferencesUserEmailKey = 'USEREMAILKEY';

//saving Data to Shared Preferences

  static Future<void> saveUserLoggedInSharedPreference(bool isLoggedIn) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setBool(sharedPreferencesUserLoggedInKey, isLoggedIn);
  }

  static Future<void> saveUserNameSharedPreference(String username) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(sharedPreferencesUserNameKey, username);
  }
  static Future<void> saveUserEmailSharedPreference(String email) async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.setString(sharedPreferencesUserEmailKey, email);
  }

  //Retrieving local data from SharedPreferences
  static Future<bool> getUserLoggedInSharedPreference() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool(sharedPreferencesUserLoggedInKey);
  }

}

