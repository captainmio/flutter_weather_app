import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

String fahreheitToCelsius(double fahrenheitValue) {
  return ((fahrenheitValue - 32) * 5 / 9).toStringAsFixed(1);
}

Icon displayWeatherIcon(String weather, {double size = 0}) {
  late IconData returnIcon;
  double iconSize = 70.0;

  if (size > 0) {
    iconSize = size;
  }

  switch (weather.toLowerCase()) {
    case 'sunny':
      returnIcon = WeatherIcons.day_sunny;
      break;
    case 'mostly sunny':
      returnIcon = WeatherIcons.day_sunny;
      break;
    case 'partly sunny':
      returnIcon = WeatherIcons.day_sunny;
      break;
    case 'intermittent clouds':
      returnIcon = WeatherIcons.day_sunny_overcast;
      break;
    case 'hazy sunshine':
      returnIcon = WeatherIcons.day_fog;
      break;
    case 'mostly cloudy':
      returnIcon = WeatherIcons.day_sunny_overcast;
      break;
    case 'cloudy':
      returnIcon = WeatherIcons.cloudy;
      break;
    case 'dreary (Overcast)':
      returnIcon = WeatherIcons.fog;
      break;
    case 'fog':
      returnIcon = WeatherIcons.fog;
      break;
    case 'showers':
      returnIcon = WeatherIcons.fog;
      break;
    case 'mostly cloudy w/ showers':
      returnIcon = WeatherIcons.day_showers;
      break;
    case 'partly sunny w/ showers':
      returnIcon = WeatherIcons.day_sleet;
      break;
    case 't-storms':
      returnIcon = WeatherIcons.thunderstorm;
      break;
    case 'mostly cloudy w/ t-storms':
      returnIcon = WeatherIcons.day_thunderstorm;
      break;
    case 'partly sunny w/ t-storms':
      returnIcon = WeatherIcons.day_sleet_storm;
      break;
    case 'rain':
      returnIcon = WeatherIcons.rain;
      break;
    case 'flurries':
      returnIcon = WeatherIcons.rain_mix;
      break;
    case 'mostly cloudy w/ flurries':
      returnIcon = WeatherIcons.day_rain;
      break;
    case 'partly cloudy w/ flurries':
      returnIcon = WeatherIcons.day_rain_wind;
      break;
    case 'windy':
      returnIcon = WeatherIcons.day_showers;
      break;
    case 'snow':
      returnIcon = WeatherIcons.showers;
      break;
    case 'mostly cloudy w/ snow':
      returnIcon = WeatherIcons.day_snow_wind;
      break;
    case 'ice':
      returnIcon = WeatherIcons.snowflake_cold;
      break;
    case 'thunderstorm':
      returnIcon = WeatherIcons.thunderstorm;
      break;
    default:
      returnIcon = WeatherIcons.na;
      break;
  }

  return Icon(
    returnIcon,
    size: iconSize,
    color: Colors.white,
  );
}
