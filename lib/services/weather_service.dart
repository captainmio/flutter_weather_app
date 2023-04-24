import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_weather_app/constants/globals.dart' as globals;

Future getWeather(String locationKey) async {
  Weather? result;
  try {
    final response = await http.get(
      Uri.parse(
          "${globals.baseURL}/forecasts/v1/daily/5day/${locationKey}?apikey=${globals.apiKey}&details=true"),
      headers: {
        HttpHeaders.contentTypeHeader: globals.contentTypeHeader,
      },
    );

    Map<String, dynamic> jsonResult = _responseStatusChecker(response);

    result = Weather.fromJson(jsonResult);
  } catch (err) {
    debugPrint("$err");
  }

  return result;
}

Future searchLocation(String search) async {
  List<Location> result = [];

  try {
    final response = await http.get(
      Uri.parse(
          "${globals.baseURL}/locations/v1/cities/search?apikey=${globals.apiKey}&q=$search"),
      headers: {
        HttpHeaders.contentTypeHeader: globals.contentTypeHeader,
      },
    );

    List<dynamic> jsonResult = _responseStatusChecker(response);

    for (var item in jsonResult) {
      result.add(Location.fromJson(item));
    }

    return result;
  } catch (err) {
    debugPrint("$err");
  }

  return result;
}

_responseStatusChecker(http.Response response) {
  if (response.statusCode == 200) {
    return json.decode(response.body);
  }
}
