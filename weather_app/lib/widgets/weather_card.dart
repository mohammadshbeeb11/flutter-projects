import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.condition,
  });
  final String cityName;
  final double temperature;
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(),
      child: ListTile(
        title: Text(
          cityName,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        subtitle: Text(
          condition,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        trailing: Text(
          "$temperature",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
