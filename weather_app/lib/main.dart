import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/widgets/weather_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Controller for getting city name and fetch its data
  final TextEditingController _weatherController = TextEditingController();

  // Weather object to store data fetched and display it
  Weather weather = Weather('', 0.0, '');

  // Fetch data from API using url
  String getUrl() {
    return 'https://api.openweathermap.org/data/2.5/weather?q=${_weatherController.text}&appid=8c3d43b050f112b476e31e344b480844&units=metric';
  }

  // function to set data for weather object
  Future<void> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(getUrl()));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          weather = Weather(
            data['name'],
            data['main']['temp'],
            data['weather'][0]['main'],
          );
        });
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Failed: $e");
    }
  }

  @override
  void dispose() {
    _weatherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Weather App")),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    
                    // Enter city name
                    TextField(
                      controller: _weatherController,
                      onTap: () => fetchWeather(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter city name",
                      ),
                    ),

                    SizedBox(height: 30),

                    // Display data
                    ElevatedButton(
                      onPressed: () {
                        fetchWeather();
                      },
                      child: Text("fetch"),
                    ),

                    SizedBox(height: 20),

                    WeatherCard(cityName: weather.cityName, temperature: weather.temperature, condition: weather.condition)

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
