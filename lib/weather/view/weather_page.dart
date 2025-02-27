import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/weather/cubit/weather_cubit.dart';
import 'package:flutter_weather/weather/view/search_page.dart';
import 'package:flutter_weather/weather/view/settings_page.dart';
import 'package:flutter_weather/weather/widgets/widgets.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(actions: [
        IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () =>
                Navigator.of(context).push<void>(SettingsPage.route()))
      ]),
      body: Center(child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          print('[weather_page.dart] state.status: ${state.status}');
          return switch (state.status) {
            WeatherStatus.initial => const WeatherEmpty(),
            WeatherStatus.loading => const WeatherLoading(),
            WeatherStatus.failure => const WeatherError(),
            WeatherStatus.success => WeatherPopulated(
                weather: state.weather,
                units: state.temperatureUnits,
                onRefresh: () {
                  return context.read<WeatherCubit>().refreshWeather();
                }),
          };
        },
      )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.search, semanticLabel: 'Search'),
          onPressed: () async {
            final city =
                await Navigator.of(context).push<String>(SearchPage.route());
            if (!context.mounted) return;
            print('[weather_page.dart] city: $city');
            await context.read<WeatherCubit>().fetchWeather(city);
          }),
    );
  }
}
