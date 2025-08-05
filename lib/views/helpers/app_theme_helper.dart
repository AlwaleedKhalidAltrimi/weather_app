import 'package:flutter/material.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

class AppThemeHelper {
// Static method to determine the AppBar color based on the weather state
  static Color getAppBarColor(WeatherState state) {
    if (state is WeatherSuccessState) {
      return WeatherModel.getThemeColor(state.weatherModel.weatherCondition);
    }
    return Colors
        .blue; // Default color when there is no weather state available
  }
}
