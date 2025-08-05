import 'package:weather_app/models/weather_model.dart';
// Create States

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherSuccessState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}
