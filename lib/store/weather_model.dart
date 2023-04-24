import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/services/weather_service.dart';

class WeatherModel extends ChangeNotifier {
  Weather? weather;
  List<Location>? locations;
  bool loading = true;
  String locationKey = '264885';
  String locationName = 'Manila';

  getWeatherData() async {
    loading = true;
    weather = await getWeather(locationKey);
    loading = false;
    notifyListeners();
  }

  searchLocationData(String search) async {
    locations = await searchLocation(search);
    notifyListeners();
  }

  updatelocationKeyAndLocationName(String name, String key) {
    locationName = name;
    locationKey = key;
    notifyListeners();
  }
}
