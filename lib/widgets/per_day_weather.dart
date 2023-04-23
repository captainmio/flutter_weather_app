import 'package:flutter/material.dart';
import 'package:flutter_weather_app/util/global_util.dart';

class PerDayWeatherWidget extends StatefulWidget {
  final String day;
  final double temperature;
  final Icon weatherIcon;
  const PerDayWeatherWidget(
      {super.key,
      required this.day,
      required this.temperature,
      required this.weatherIcon});

  @override
  State<PerDayWeatherWidget> createState() => _PerDayWeatherWidgetState();
}

class _PerDayWeatherWidgetState extends State<PerDayWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(widget.day),
            // Text('${fahreheitToCelsius(widget.temperature)} °C')
            Text('${(widget.temperature)} °C')
          ],
        ),
        const SizedBox(width: 10),
        widget.weatherIcon
      ],
    );
  }
}
