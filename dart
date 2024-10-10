import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Weather icon and temperature
              WeatherHeader(),
              SizedBox(height: 20),
              // 7-day forecast and health risks
              Expanded(child: ForecastSection()),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Cloudy icon and temperature
          Icon(Icons.wb_cloudy, size: 64, color: Colors.white),
          SizedBox(height: 10),
          Text(
            '19°',
            style: TextStyle(
              fontSize: 72,
              color: Colors.white,
            ),
          ),
          Text(
            'Partly Cloudy',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '7 Days Forecast',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          // Days Forecast row
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ForecastCard(day: 'Mon', temp: '20°', icon: Icons.wb_sunny),
                ForecastCard(day: 'Tue', temp: '18°', icon: Icons.wb_cloudy),
                ForecastCard(day: 'Wed', temp: '22°', icon: Icons.wb_sunny),
                ForecastCard(day: 'Thu', temp: '19°', icon: Icons.wb_cloudy),
                ForecastCard(day: 'Fri', temp: '21°', icon: Icons.wb_sunny),
                ForecastCard(day: 'Sat', temp: '17°', icon: Icons.wb_cloudy),
                ForecastCard(day: 'Sun', temp: '23°', icon: Icons.wb_sunny),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ForecastCard extends StatelessWidget {
  final String day;
  final String temp;
  final IconData icon;

  ForecastCard({required this.day, required this.temp, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Icon(icon, color: Colors.white, size: 24),
          SizedBox(height: 5),
          Text(
            temp,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
