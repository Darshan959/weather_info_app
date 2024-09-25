import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  const WeatherInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _cityName = '';
  String _temperature = '';
  String _weatherCondition = '';

  // Function to simulate fetching weather data
  void _fetchWeather() {
    final random = Random();
    setState(() {
      _cityName = _cityController.text; // Get the entered city name

      // Generate a random temperature between 15°C and 30°C
      _temperature = '${15 + random.nextInt(16)} °C';

      // Randomly select a weather condition
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      _weatherCondition = conditions[random.nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter city name',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather, // Fetch weather when button is pressed
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
            Text('City: $_cityName'),
            Text('Temperature: $_temperature'),
            Text('Weather: $_weatherCondition'),
          ],
        ),
      ),
    );
  }
}
