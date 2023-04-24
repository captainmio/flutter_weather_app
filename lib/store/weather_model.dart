import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/services/weather_service.dart';

class WeatherModel extends ChangeNotifier {
  Weather? weather;
  List<Location>? locations;
  bool loading = true;

  getWeatherData(String locationkey) async {
    loading = true;
    weather = await getWeather(locationkey);
    loading = false;
    notifyListeners();
  }

  searchLocationData(String search) async {
    // loading = true;
    locations = await searchLocation(search);
    locations!.map((e) => print(e.name));

    // loading = false;
    notifyListeners();
  }
}
