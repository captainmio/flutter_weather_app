import 'package:flutter/material.dart';
import 'package:flutter_weather_app/util/global_util.dart';

class TemperatureLabelWidget extends StatefulWidget {
  final double temperature;
  const TemperatureLabelWidget({super.key, required this.temperature});

  @override
  State<TemperatureLabelWidget> createState() => _TemperatureLabelWidgetState();
}

class _TemperatureLabelWidgetState extends State<TemperatureLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('${fahreheitToCelsius(widget.temperature)} °C ',
              style: const TextStyle(fontSize: 45, color: Colors.white)),
          Text('feels like ${fahreheitToCelsius(widget.temperature)} °C ',
              style: const TextStyle(fontSize: 20, color: Colors.white))
        ],
      ),
    );
  }
}
