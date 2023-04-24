import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

String fahreheitToCelsius(double fahrenheitValue) {
  return ((fahrenheitValue - 32) * 5 / 9).toStringAsFixed(1);
}

Icon displayWeatherIcon(String weather, {double size = 0}) {
  late Icon returnIcon;
  double iconSize = 70.0;

  if (size > 0) {
    iconSize = size;
  }

  switch (weather.toLowerCase()) {
    case 'sunny':
      returnIcon = Icon(
        WeatherIcons.day_sunny,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'mostly sunny':
      returnIcon = Icon(
        WeatherIcons.day_sunny,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'partly sunny':
      returnIcon = Icon(
        WeatherIcons.day_sunny,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'intermittent clouds':
      returnIcon = Icon(
        WeatherIcons.day_sunny_overcast,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'hazy sunshine':
      returnIcon = Icon(
        WeatherIcons.day_fog,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'mostly cloudy':
      returnIcon = Icon(
        WeatherIcons.day_sunny_overcast,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'cloudy':
      returnIcon = Icon(
        WeatherIcons.cloudy,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'dreary (Overcast)':
      returnIcon = Icon(
        WeatherIcons.fog,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'fog':
      returnIcon = Icon(
        WeatherIcons.fog,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'showers':
      returnIcon = Icon(
        WeatherIcons.fog,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'mostly cloudy w/ showers':
      returnIcon = Icon(
        WeatherIcons.day_showers,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'partly sunny w/ showers':
      returnIcon = Icon(
        WeatherIcons.day_sleet,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 't-storms':
      returnIcon = Icon(
        WeatherIcons.thunderstorm,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'mostly cloudy w/ t-storms':
      returnIcon = Icon(
        WeatherIcons.day_thunderstorm,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'partly sunny w/ t-storms':
      returnIcon = Icon(
        WeatherIcons.day_sleet_storm,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'rain':
      returnIcon = Icon(
        WeatherIcons.rain,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'flurries':
      returnIcon = Icon(
        WeatherIcons.rain_mix,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'mostly cloudy w/ flurries':
      returnIcon = Icon(
        WeatherIcons.day_rain,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'partly cloudy w/ flurries':
      returnIcon = Icon(
        WeatherIcons.day_rain_wind,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'windy':
      returnIcon = Icon(
        WeatherIcons.day_showers,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'snow':
      returnIcon = Icon(
        WeatherIcons.showers,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'mostly cloudy w/ snow':
      returnIcon = Icon(
        WeatherIcons.day_snow_wind,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'ice':
      returnIcon = Icon(
        WeatherIcons.snowflake_cold,
        size: iconSize,
        color: Colors.white,
      );
      break;
    case 'thunderstorm':
      returnIcon = Icon(
        WeatherIcons.thunderstorm,
        size: iconSize,
        color: Colors.white,
      );
      break;
    default:
      returnIcon = Icon(
        WeatherIcons.na,
        size: iconSize,
        color: Colors.white,
      );
      break;
  }
  return returnIcon;
}
