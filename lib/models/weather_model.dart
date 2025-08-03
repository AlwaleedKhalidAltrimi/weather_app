import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
    );
  }

  static MaterialColor getThemeColor(String? weatherCondition) {
    if (weatherCondition == null) {
      return Colors.blue;
    }

    switch (weatherCondition) {
      // ☀️ مشمس أو صافي
      case 'Sunny':
      case 'Clear':
      case 'Partly cloudy':
        return Colors.orange;

      // ❄️ ثلوج أو احتمالات ثلوج
      case 'Blizzard':
      case 'Patchy snow possible':
      case 'Patchy sleet possible':
      case 'Patchy freezing drizzle possible':
      case 'Blowing snow':
      case 'Patchy light snow':
      case 'Light snow':
      case 'Patchy moderate snow':
      case 'Moderate snow':
      case 'Patchy heavy snow':
      case 'Heavy snow':
      case 'Light snow showers':
      case 'Moderate or heavy snow showers':
        return Colors.blue;

      // 🌫️ ضباب أو غيوم
      case 'Cloudy':
      case 'Overcast':
      case 'Mist':
      case 'Fog':
      case 'Freezing fog':
        return Colors.blueGrey;

      // 🌧️ أمطار
      case 'Patchy rain possible':
      case 'Patchy light drizzle':
      case 'Light drizzle':
      case 'Freezing drizzle':
      case 'Heavy freezing drizzle':
      case 'Patchy light rain':
      case 'Light rain':
      case 'Moderate rain at times':
      case 'Moderate rain':
      case 'Heavy rain at times':
      case 'Heavy rain':
      case 'Light rain shower':
      case 'Moderate or heavy rain shower':
      case 'Torrential rain shower':
        return Colors.blue;

      // ⛈️ رعد وأمطار/ثلوج مصحوبة بعواصف
      case 'Thundery outbreaks possible':
      case 'Patchy light rain with thunder':
      case 'Moderate or heavy rain with thunder':
      case 'Patchy light snow with thunder':
      case 'Moderate or heavy snow with thunder':
        return Colors.deepPurple;

      // 🎨 افتراضي
      default:
        return Colors.blue;
    }
  }
}
