import 'package:flutter/material.dart';

class TemperatureLabelWidget extends StatefulWidget {
  final int temperature;
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
          Text('${widget.temperature.toString()} °C ',
              style: const TextStyle(fontSize: 45)),
          Text('feels like ${widget.temperature.toString()} °C ',
              style: const TextStyle(fontSize: 20))
        ],
      ),
    );
  }
}
