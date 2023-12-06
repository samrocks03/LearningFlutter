import 'package:flutter/material.dart';
import 'package:weather_apk/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(),
      home : const WeatherApp(),
      // home: const MyHomePage(title: 'Weather App'),
    );
  }
}


