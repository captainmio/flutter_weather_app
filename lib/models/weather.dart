// To parse this JSON data, do
//
//     final weather = weatherFromJson(jsonString);

import 'dart:convert';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));

String weatherToJson(Weather data) => json.encode(data.toJson());

class Weather {
  Weather({
    required this.headline,
    required this.dailyForecasts,
  });

  Headline headline;
  List<DailyForecast> dailyForecasts;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        headline: Headline.fromJson(json["Headline"]),
        dailyForecasts: List<DailyForecast>.from(
            json["DailyForecasts"].map((x) => DailyForecast.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Headline": headline.toJson(),
        "DailyForecasts":
            List<dynamic>.from(dailyForecasts.map((x) => x.toJson())),
      };

  map(Null Function(dynamic item) param0) {}
}

class DailyForecast {
  DailyForecast({
    required this.date,
    required this.epochDate,
    required this.temperature,
    required this.day,
    required this.night,
    required this.sources,
    required this.mobileLink,
    required this.link,
  });

  DateTime date;
  int epochDate;
  Temperature temperature;
  Day day;
  Day night;
  List<String> sources;
  String mobileLink;
  String link;

  factory DailyForecast.fromJson(Map<String, dynamic> json) => DailyForecast(
        date: DateTime.parse(json["Date"]),
        epochDate: json["EpochDate"],
        temperature: Temperature.fromJson(json["Temperature"]),
        day: Day.fromJson(json["Day"]),
        night: Day.fromJson(json["Night"]),
        sources: List<String>.from(json["Sources"].map((x) => x)),
        mobileLink: json["MobileLink"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "Date": date.toIso8601String(),
        "EpochDate": epochDate,
        "Temperature": temperature.toJson(),
        "Day": day.toJson(),
        "Night": night.toJson(),
        "Sources": List<dynamic>.from(sources.map((x) => x)),
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class Day {
  Day({
    required this.icon,
    required this.iconPhrase,
    required this.hasPrecipitation,
    this.precipitationType,
    this.precipitationIntensity,
  });

  int icon;
  String iconPhrase;
  bool hasPrecipitation;
  String? precipitationType;
  String? precipitationIntensity;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        icon: json["Icon"],
        iconPhrase: json["IconPhrase"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"],
        precipitationIntensity: json["PrecipitationIntensity"],
      );

  Map<String, dynamic> toJson() => {
        "Icon": icon,
        "IconPhrase": iconPhrase,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType": precipitationType,
        "PrecipitationIntensity": precipitationIntensity,
      };
}

class Temperature {
  Temperature({
    required this.minimum,
    required this.maximum,
  });

  Imum minimum;
  Imum maximum;

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        minimum: Imum.fromJson(json["Minimum"]),
        maximum: Imum.fromJson(json["Maximum"]),
      );

  Map<String, dynamic> toJson() => {
        "Minimum": minimum.toJson(),
        "Maximum": maximum.toJson(),
      };
}

class Imum {
  Imum({
    required this.value,
    required this.unit,
    required this.unitType,
  });

  dynamic value;
  Unit unit;
  dynamic unitType;

  factory Imum.fromJson(Map<String, dynamic> json) => Imum(
        value: json["Value"],
        unit: unitValues.map[json["Unit"]]!,
        unitType: json["UnitType"],
      );

  Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unitValues.reverse[unit],
        "UnitType": unitType,
      };
}

enum Unit { F }

final unitValues = EnumValues({"F": Unit.F});

class Headline {
  Headline({
    required this.effectiveDate,
    required this.effectiveEpochDate,
    required this.severity,
    required this.text,
    required this.category,
    required this.endDate,
    required this.endEpochDate,
    required this.mobileLink,
    required this.link,
  });

  DateTime effectiveDate;
  int effectiveEpochDate;
  int severity;
  String text;
  String category;
  DateTime endDate;
  int endEpochDate;
  String mobileLink;
  String link;

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        effectiveDate: DateTime.parse(json["EffectiveDate"]),
        effectiveEpochDate: json["EffectiveEpochDate"],
        severity: json["Severity"],
        text: json["Text"],
        category: json["Category"],
        endDate: DateTime.parse(json["EndDate"]),
        endEpochDate: json["EndEpochDate"],
        mobileLink: json["MobileLink"],
        link: json["Link"],
      );

  Map<String, dynamic> toJson() => {
        "EffectiveDate": effectiveDate.toIso8601String(),
        "EffectiveEpochDate": effectiveEpochDate,
        "Severity": severity,
        "Text": text,
        "Category": category,
        "EndDate": endDate.toIso8601String(),
        "EndEpochDate": endEpochDate,
        "MobileLink": mobileLink,
        "Link": link,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
