import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

String fahreheitToCelsius(double fahrenheitValue) {
  return ((fahrenheitValue - 32) * 5 / 9).toStringAsFixed(2);
}

Icon displayWeatherIcon(String weather, {double size = 0}) {
  late Icon returnIcon;
  double iconSize = 70.0;

  if (size > 0) {
    iconSize = size;
  }

  switch (weather.toLowerCase()) {
    case 'sunny':
      returnIcon = Icon(WeatherIcons.day_sunny, size: iconSize);
      break;
    case 'mostly sunny':
      returnIcon = Icon(WeatherIcons.day_sunny, size: iconSize);
      break;
    case 'partly sunny':
      returnIcon = Icon(WeatherIcons.day_sunny, size: iconSize);
      break;
    case 'intermittent clouds':
      returnIcon = Icon(WeatherIcons.day_sunny_overcast, size: iconSize);
      break;
    case 'hazy sunshine':
      returnIcon = Icon(WeatherIcons.day_fog, size: iconSize);
      break;
    case 'mostly cloudy':
      returnIcon = Icon(WeatherIcons.day_sunny_overcast, size: iconSize);
      break;
    case 'cloudy':
      returnIcon = Icon(WeatherIcons.cloudy, size: iconSize);
      break;
    case 'dreary (Overcast)':
      returnIcon = Icon(WeatherIcons.fog, size: iconSize);
      break;
    case 'fog':
      returnIcon = Icon(WeatherIcons.fog, size: iconSize);
      break;
    case 'showers':
      returnIcon = Icon(WeatherIcons.fog, size: iconSize);
      break;
    case 'mostly cloudy w/ showers':
      returnIcon = Icon(
        WeatherIcons.day_showers,
        size: iconSize,
      );
      break;
    case 'partly sunny w/ showers':
      returnIcon = Icon(
        WeatherIcons.day_sleet,
        size: iconSize,
      );
      break;
    case 't-storms':
      returnIcon = Icon(
        WeatherIcons.thunderstorm,
        size: iconSize,
      );
      break;
    case 'mostly cloudy w/ t-storms':
      returnIcon = Icon(
        WeatherIcons.day_thunderstorm,
        size: iconSize,
      );
      break;
    case 'partly sunny w/ t-storms':
      returnIcon = Icon(
        WeatherIcons.day_sleet_storm,
        size: iconSize,
      );
      break;
    case 'rain':
      returnIcon = Icon(
        WeatherIcons.rain,
        size: iconSize,
      );
      break;
    case 'flurries':
      returnIcon = Icon(
        WeatherIcons.rain_mix,
        size: iconSize,
      );
      break;
    case 'windy':
      returnIcon = Icon(
        WeatherIcons.day_cloudy_windy,
        size: iconSize,
      );
      break;
    case 'snow':
      returnIcon = Icon(
        WeatherIcons.showers,
        size: iconSize,
      );
      break;
    case 'thunderstorm':
      returnIcon = Icon(
        WeatherIcons.thunderstorm,
        size: iconSize,
      );
      break;
    default:
      returnIcon = Icon(WeatherIcons.na, size: iconSize);
      break;
  }
  return returnIcon;
}
