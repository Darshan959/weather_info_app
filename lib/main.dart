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
  List<Map<String, String>> _weeklyForecast = [];

  // Function to simulate fetching current weather data
  void _fetchWeather() {
    final random = Random();
    setState(() {
      _cityName = _cityController.text;
      _temperature = '${15 + random.nextInt(16)} °C';
      List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
      _weatherCondition = conditions[random.nextInt(3)];
    });
  }

  // Function to simulate fetching 7-day weather forecast
  void _fetch7DayForecast() {
    final random = Random();
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy'];
    setState(() {
      _weeklyForecast = List.generate(7, (index) {
        return {
          'day': 'Day ${index + 1}',
          'temperature': '${15 + random.nextInt(16)} °C',
          'condition': conditions[random.nextInt(3)],
        };
      });
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
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
            Text('City: $_cityName'),
            Text('Temperature: $_temperature'),
            Text('Weather: $_weatherCondition'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetch7DayForecast,
              child: const Text('Fetch 7-Day Forecast'),
            ),
            const SizedBox(height: 20),
            if (_weeklyForecast.isNotEmpty) ...[
              const Text('7-Day Weather Forecast:'),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: _weeklyForecast.length,
                  itemBuilder: (context, index) {
                    final dayForecast = _weeklyForecast[index];
                    return ListTile(
                      title: Text('${dayForecast['day']}'),
                      subtitle: Text(
                          'Temperature: ${dayForecast['temperature']}, Condition: ${dayForecast['condition']}'),
                    );
                  },
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
