import 'package:flutter/material.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/store/weather_model.dart';
import 'package:flutter_weather_app/widgets/city_label.dart';
import 'package:flutter_weather_app/widgets/per_day_weather.dart';
import 'package:flutter_weather_app/widgets/temperature_label.dart';
import 'package:flutter_weather_app/util/global_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_async_autocomplete/flutter_async_autocomplete.dart';
import 'package:basic_utils/basic_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int temperature;
  late Icon weatherIcon;

  Future _onSearch(String value, weatherModel) async {
    await Provider.of<WeatherModel>(context, listen: false)
        .searchLocationData(value);
  }

  @override
  void initState() {
    super.initState();

    _getCurrentLocation().then((_) => onFetchWeatherForecast());
    // onFetchWeatherForecast();
  }

  _getCurrentLocation() {
    return Provider.of<WeatherModel>(context, listen: false)
        .getCurrentLocation();
  }

  void onFetchWeatherForecast() {
    Provider.of<WeatherModel>(context, listen: false).getWeatherData();
  }

  void onUpdateLocationNameAndLocationKey(String name, String code) {
    Provider.of<WeatherModel>(context, listen: false)
        .updatelocationKeyAndLocationName(name, code);
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
            weatherIcon: displayWeatherIcon(item.day.iconPhrase, size: 25.0),
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
    var searchController = TextEditingController();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/location_background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 2.0, spreadRadius: 0.4)
                ]),
            child: AsyncAutocomplete<Location>(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintText: 'Search....',
                  border: InputBorder.none),
              cursorColor: Colors.black,
              controller: searchController,
              onTapItem: (Location location) {
                onUpdateLocationNameAndLocationKey(
                    location.name, location.code);
                onFetchWeatherForecast();
              },
              asyncSuggestions: (searchValue) async {
                if (searchValue.isEmpty) return [];
                return _onSearch(searchValue, weatherModel)
                    .then((value) => weatherModel.locations!);
              },
              suggestionBuilder: (data) => ListTile(
                title: Text(data.name),
              ),
            ),
          ),
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
                            cityName: weatherModel.locationName,
                            fontSize: 45,
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: TemperatureLabelWidget(
                                    today: weatherModel
                                        .weather!.dailyForecasts[0]),
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
                                cityName: StringUtils.capitalize(
                                    weatherModel.weather!.headline.category),
                                fontSize: 40,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: getFutureForecast(weatherModel),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            const MaterialStatePropertyAll<
                                                Color>(Colors.white),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0),
                                            side: const BorderSide(
                                                width: 1, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      child: Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
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
                                                fontSize: 20.0,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                      onPressed: () async {
                                        await launchUrl(Uri.parse(weatherModel
                                            .weather!.headline.link));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const SpinKitSquareCircle(
                color: Colors.white,
                size: 50.0,
              ),
      ),
    );
  }
}
