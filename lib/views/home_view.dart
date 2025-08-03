import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/helpers/app_theme_helper.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widget/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        final appBarColor = AppThemeHelper.getAppBarColor(state);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: appBarColor,
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
          body: const HomeBody(),
        );
      },
    );
  }
}
