import 'package:flutter/material.dart';
import 'package:flutter_weather_app/screens/home.dart';
import 'package:flutter_weather_app/store/weather_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherModel(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
