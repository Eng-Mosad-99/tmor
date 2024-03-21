import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
  setData(bool isBool, String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isBool) {
      var x = await prefs.setBool(key, value);
      print(key);
      print(x);
    } else {
      prefs.setString(key, value.toString());
    }
  }

  getData(bool isBool, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (isBool) {
      return prefs.getBool(key);
    } else {
      return prefs.getString(key);
    }
  }

  void deleteData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
