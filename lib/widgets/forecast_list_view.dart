import 'package:flutter/material.dart';

class ForecastListView extends StatelessWidget {
  final List<dynamic> forecastData;

  ForecastListView(this.forecastData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: forecastData.length,
      itemBuilder: (context, index) {
        var item = forecastData[index];
        return Card(
          color: Colors.green[50],
          child: ListTile(
            title: Text(
              'Date: ${item['dt_txt']}',
              style: TextStyle(color: Colors.green[800]),
            ),
            subtitle: Text(
              'Temp: ${item['main']['temp']}°C, ${item['weather'][0]['description']}',
              style: TextStyle(color: Colors.green[600]),
            ),
          ),
        );
      },
    );
  }
}
