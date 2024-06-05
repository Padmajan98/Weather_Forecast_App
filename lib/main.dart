import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/weather_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('weatherBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color.fromARGB(255, 186, 241, 191),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: WeatherScreen(),
    );
  }
}
