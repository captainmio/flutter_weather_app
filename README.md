# flutter_weather_app

A Weather app I created using Flutter

## Things to take note

- Make sure you properly install flutter to you device, please see [flutter documentation](https://docs.flutter.dev/get-started/install) on how to install flutter in different OS devices(Windows, Mac, Linux)
- run `flutter doctor -v` and make sure all of the requirements are **checked**
- for you to change the Accuweather API key, please change `\lib\constants\globals.dart` **apikey** variable's value
- to run the app please use the command `flutter run`, make sure that your Emulator is already open so flutter will automatically select the emulator once you the command
- to check test, run the command `flutter test`, it should not have any error
- Implemented GeoLocator package(To ask permission to share and identify current location, this returns coordinates) and Geocode(reverse locating, converting coordinates to actual address)

# Demo

![Flutter Weather APp](https://i.im.ge/2023/04/25/L8HZY8.FlutterWeatherApp.gif)
