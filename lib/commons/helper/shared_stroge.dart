import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage{
  
  Future<void> saveValue(String key,String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
  }

  Future<String?> getValue(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
    return prefs.getString(key);
  
  }

  Future<void> deletevalue(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(value);
  }

}