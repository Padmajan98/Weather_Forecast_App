import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';

Future<void> saveSelectedCity(String city) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('selectedCity', city);
}

Future<String?> getSelectedCity() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('selectedCity');
}

Future<void> saveWeatherData(String key, dynamic data) async {
  var box = Hive.box('weatherBox');
  await box.put(key, data);
}

dynamic getWeatherData(String key) {
  var box = Hive.box('weatherBox');
  return box.get(key);
}
