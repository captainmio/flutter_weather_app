import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_app/models/location.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/services/weather_service.dart';

void main() {
  test('Test if initial fetching of default location returns a result', () {
    Future<Weather?> getWeatherResult = getWeather('252066');

    // check if the result isn't null
    expect(getWeatherResult, isNotNull);

    getWeatherResult.then((value) {
      // check if the object exist and is not null
      expect(value!.headline, isNotNull);
      expect(value.dailyForecasts, isNotNull);
    });

    // check that Future function did return something
    expect(getWeatherResult, completes);
  });

  test('Test if initial fetching of default location returns a result', () {
    Future<List<Location>?> searchLocationResult = searchLocation('Davao');

    // check if the result isn't null
    expect(searchLocationResult, isNotNull);

    searchLocationResult.then((value) {
      value!.map((item) {
        // check each result's value and data type
        expect(item.name, isNotNull);
        expect(item.code, isNotNull);
        expect(item.code, int);
      });
    });

    // check that Future function did return something
    expect(searchLocationResult, completes);
  });
}
