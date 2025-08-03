import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/git_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/helpers/app_theme_helper.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        final appBarColor = AppThemeHelper.getAppBarColor(state);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Search A City'),
            elevation: 4,
            backgroundColor: appBarColor,
          ),
          body: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: Center(
              child: TextField(
                cursorColor: Colors.black,
                onSubmitted: (value) async {
                  final getWeatherCubit =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(cityName: value);
                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                    vertical: 28,
                  ),
                  hintText: 'Enter City Name',
                  label: Text(
                    'Search',
                    style: TextStyle(color: Colors.black),
                  ),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
