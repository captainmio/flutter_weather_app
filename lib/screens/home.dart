import 'package:flutter/material.dart';
import 'package:flutter_weather_app/widgets/city_label.dart';
import 'package:flutter_weather_app/widgets/per_day_weather.dart';
import 'package:flutter_weather_app/widgets/search_bar.dart';
import 'package:flutter_weather_app/widgets/temperature_label.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String search = '';
  late int temperature;
  late String weather = 'sunny';
  late Icon weatherIcon;

  void _onSearch(String value) {
    debugPrint(value);

    setState(() {
      search = value;
    });
  }

  Icon displayWeatherIcon() {
    late Icon returnIcon;
    double iconSize = 70.0;
    switch (weather) {
      case 'sunny':
        returnIcon = Icon(WeatherIcons.snow, size: iconSize);
        break;
      case 'cloudy':
        returnIcon = Icon(
          WeatherIcons.snow,
          size: iconSize,
        );
        break;
    }

    return returnIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: SearchBarWidget(onSearch: _onSearch),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
              child: Column(
                children: <Widget>[
                  CityLabelWidget(
                    cityName: search,
                    fontSize: 50,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: TemperatureLabelWidget(temperature: 10),
                      ),
                      displayWeatherIcon(),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CityLabelWidget(
                        cityName: search,
                        fontSize: 40,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        PerDayWeatherWidget(
                          day: "Thu",
                          temperature: 10,
                          weatherIcon: Icon(WeatherIcons.day_cloudy),
                        ),
                        Spacer(),
                        PerDayWeatherWidget(
                          day: "Fri",
                          temperature: 10,
                          weatherIcon: Icon(WeatherIcons.day_rain),
                        ),
                        Spacer(),
                        PerDayWeatherWidget(
                          day: "Sat",
                          temperature: 10,
                          weatherIcon: Icon(WeatherIcons.day_cloudy_windy),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(Icons.alarm),
                        Text('last update on 5:05pm'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
