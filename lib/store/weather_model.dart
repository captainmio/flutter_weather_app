import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/services/weather_service.dart';

class WeatherModel extends ChangeNotifier {
  Weather? weather;
  bool loading = true;

  getWeatherData(String locationkey) async {
    loading = true;
    weather = await getWeather(locationkey);
    loading = false;
    notifyListeners();
  }
}
