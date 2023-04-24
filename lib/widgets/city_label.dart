import 'package:flutter/material.dart';

class CityLabelWidget extends StatefulWidget {
  final String cityName;
  final double fontSize;

  const CityLabelWidget(
      {super.key, required this.cityName, this.fontSize = 14});

  @override
  State<CityLabelWidget> createState() => _CityLabelWidgetState();
}

class _CityLabelWidgetState extends State<CityLabelWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.cityName,
      style: TextStyle(
        color: Colors.white,
        fontSize: widget.fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
