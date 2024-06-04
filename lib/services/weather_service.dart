import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = '71ff54038fdc4269992a8600e4892a87';

Future<Map<String, dynamic>> fetchCurrentWeather(String city) async {
  final response = await http.get(
    Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}

Future<List<dynamic>> fetchWeatherForecast(String city) async {
  final response = await http.get(
    Uri.parse('https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric'),
  );

  if (response.statusCode == 200) {
    return json.decode(response.body)['list'];
  } else {
    throw Exception('Failed to load forecast data');
  }
}
