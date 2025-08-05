import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/helpers/app_theme_helper.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widget/no_weather_body.dart';
import 'package:weather_app/widget/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        final themeColor = AppThemeHelper.getAppBarColor(state);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: themeColor,
            elevation: 4,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
            title: const Text(
              'Weather App',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.black));
              } else if (state is WeatherSuccessState) {
                return WeatherInfoBody(weather: state.weatherModel);
              } else if (state is WeatherFailureState) {
                return const Center(child: Text('Oops, there was an error.'));
              } else {
                return const NoWeatherBody();
              }
            },
          ),
        );
      },
    );
  }
}
