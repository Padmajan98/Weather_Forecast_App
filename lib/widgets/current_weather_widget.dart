import 'package:flutter/material.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final Map<String, dynamic> weatherData;

  CurrentWeatherWidget(this.weatherData);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              weatherData['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[800]),
            ),
            Text(
              'Temperature: ${weatherData['main']['temp']}°C',
              style: TextStyle(fontSize: 18, color: Colors.green[700]),
            ),
            Text(
              'Description: ${weatherData['weather'][0]['description']}',
              style: TextStyle(fontSize: 18, color: Colors.green[600]),
            ),
          ],
        ),
      ),
    );
  }
}
