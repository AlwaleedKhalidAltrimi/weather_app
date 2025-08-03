import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/views/home_view.dart';
import 'cubits/git_weather_cubit/get_weather_states.dart';
import 'models/weather_model.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Provide Cubit
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: WeatherModel.getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.weatherCondition,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomeView(),
          );
        });
      }),
    );
  }
}
