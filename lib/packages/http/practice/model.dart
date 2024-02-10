// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    String temperature;
    String wind;
    String description;
    List<Forecast> forecast;

    Welcome({
        required this.temperature,
        required this.wind,
        required this.description,
        required this.forecast,
    });

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        temperature: json["temperature"],
        wind: json["wind"],
        description: json["description"],
        forecast: List<Forecast>.from(json["forecast"].map((x) => Forecast.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "wind": wind,
        "description": description,
        "forecast": List<dynamic>.from(forecast.map((x) => x.toJson())),
    };
}

class Forecast {
    String day;
    String temperature;
    String wind;

    Forecast({
        required this.day,
        required this.temperature,
        required this.wind,
    });

    factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        day: json["day"],
        temperature: json["temperature"],
        wind: json["wind"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "temperature": temperature,
        "wind": wind,
    };
}
