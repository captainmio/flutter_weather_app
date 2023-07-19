import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/services/weather_service.dart';
import 'package:flutter_weather_app/constants/globals.dart' as globals;
import 'package:geolocator/geolocator.dart';
import 'package:geocode/geocode.dart';

class WeatherModel extends ChangeNotifier {
  Weather? weather;
  Position? position;
  Address? address;
  List<Location>? locations;
  bool loading = true;
  String locationKey = globals.locationKey;
  String locationName = globals.locationName;

  getCurrentLocation() async {
    loading = true;
    position = await determinePosition();

    if (position != null) {
      address = await reverseGeocoding(position!.latitude, position!.longitude);
      await searchLocationData(
          "${address!.city.toString()}, ${address!.countryName.toString()}");
      await updatelocationKeyAndLocationName(
          locations![0].name.toString(), locations![0].code.toString());
    }

    loading = false;
  }

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
