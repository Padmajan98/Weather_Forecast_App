import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../storage/local_storage.dart';
import '../widgets/current_weather_widget.dart';
import '../widgets/forecast_list_view.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String? _city;
  Map<String, dynamic>? _currentWeather;
  List<dynamic>? _forecast;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    _city = await getSelectedCity();
    if (_city != null) {
      _currentWeather = getWeatherData('currentWeather');
      _forecast = getWeatherData('forecast');
      if (_currentWeather == null || _forecast == null) {
        await _fetchWeather(_city!);
      }
      setState(() {});
    }
  }

  Future<void> _fetchWeather(String city) async {
    try {
      var currentWeather = await fetchCurrentWeather(city);
      var forecast = await fetchWeatherForecast(city);
      setState(() {
        _currentWeather = currentWeather;
        _forecast = forecast;
        _city = city;
      });
      saveSelectedCity(city);
      saveWeatherData('currentWeather', currentWeather);
      saveWeatherData('forecast', forecast);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter City',
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (String city) {
                _fetchWeather(city);
              },
            ),
            SizedBox(height: 20),
            _currentWeather != null ? CurrentWeatherWidget(_currentWeather!) : Container(),
            SizedBox(height: 20),
            _forecast != null ? Expanded(child: ForecastListView(_forecast!)) : Container(),
          ],
        ),
      ),
    );
  }
}
