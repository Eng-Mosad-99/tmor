import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
  setData(bool isBool, String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (isBool) {
      value = prefs.setBool(key, value);
    } else {
      value = prefs.setString(key, value.toString());
    }
    return value;
  }

  getData(bool isBool, String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    late Object? value;
    if (isBool) {
      value = prefs.getBool(key);
    } else {
      value = prefs.getString(key);
    }
    return value;
  }

  void deleteData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
