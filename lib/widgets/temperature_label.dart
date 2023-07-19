import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/util/global_util.dart';

class TemperatureLabelWidget extends StatefulWidget {
  final DailyForecast today;
  const TemperatureLabelWidget({super.key, required this.today});

  @override
  State<TemperatureLabelWidget> createState() => _TemperatureLabelWidgetState();
}

class _TemperatureLabelWidgetState extends State<TemperatureLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${fahreheitToCelsius(widget.today.temperature.maximum.value)} °C ',
              style: const TextStyle(fontSize: 45, color: Colors.white)),
          Text('Day: ${widget.today.day.iconPhrase}',
              style: const TextStyle(fontSize: 20, color: Colors.white)),
          Text('Night: ${widget.today.night.iconPhrase}',
              style: const TextStyle(fontSize: 20, color: Colors.white))
        ],
      ),
    );
  }
}
