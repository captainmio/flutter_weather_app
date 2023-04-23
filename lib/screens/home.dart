import 'package:flutter/material.dart';
import 'package:flutter_weather_app/store/weather_model.dart';
import 'package:flutter_weather_app/widgets/city_label.dart';
import 'package:flutter_weather_app/widgets/per_day_weather.dart';
import 'package:flutter_weather_app/widgets/search_bar.dart';
import 'package:flutter_weather_app/widgets/temperature_label.dart';

import 'package:flutter_weather_app/util/global_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int temperature;
  late Icon weatherIcon;

  late String search = 'Manila';
  final String locationKey = '264885';

  void _onSearch(String value) {
    debugPrint(value);

    setState(() {
      search = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<WeatherModel>(context, listen: false)
        .getWeatherData(locationKey);
  }

  getFutureForecast(weatherModel) {
    var i = 0;
    List<Widget> list = <Widget>[];
    for (var item in weatherModel.weather!.dailyForecasts) {
      if (i > 0 && i < 4) {
        list.add(
          PerDayWeatherWidget(
            day: DateFormat('EEE').format(DateTime.parse(item.date.toString())),
            temperature: item.temperature.maximum.value,
            weatherIcon: displayWeatherIcon(item.day.iconPhrase, size: 20.0),
          ),
        );
        // so spacer will only be added on the first 2 items
        if (i < 3) {
          list.add(const Spacer());
        }
      }
      i++;
    }
    return Row(children: list);
  }

  @override
  Widget build(BuildContext context) {
    final weatherModel = Provider.of<WeatherModel>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: SearchBarWidget(onSearch: _onSearch),
      ),
      body: !weatherModel.loading
          ? SingleChildScrollView(
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
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: TemperatureLabelWidget(
                                  temperature: weatherModel
                                      .weather!
                                      .dailyForecasts[0]
                                      .temperature
                                      .maximum
                                      .value),
                            ),
                            displayWeatherIcon(
                                weatherModel.weather!.headline.category),
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
                              cityName: weatherModel.weather!.headline.category,
                              fontSize: 40,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: getFutureForecast(weatherModel),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                      width: 1, color: Colors.black),
                                ),
                              ),
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: const [
                                Icon(
                                  Icons.alarm,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '5-day Forecast',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.black),
                                )
                              ],
                            ),
                            onPressed: () async {
                              await launchUrl(Uri.parse(
                                  weatherModel.weather!.headline.link));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SpinKitThreeBounce(
              color: Colors.black,
              size: 50.0,
            ),
    );
  }
}
