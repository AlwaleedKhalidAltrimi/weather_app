import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_states.dart';
import 'package:weather_app/widget/no_weather_body.dart';
import 'package:weather_app/widget/weather_info_body.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(weather: state.weatherModel);
        } else if (state is WeatherFailureState) {
          return const Center(child: Text('Oops, there was an error.'));
        } else {
          return const Center(child: Text('Unexpected state'));
        }
      },
    );
  }
}
