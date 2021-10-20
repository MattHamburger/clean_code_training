import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_code_training/features/weather/domain/weather_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class WeatherPresenter
    extends Presenter<WeatherViewModel, WeatherUIOutput, WeatherUseCase> {
  WeatherPresenter({
    required PresenterBuilder<WeatherViewModel> builder,
  }) : super(
          builder: builder,
          provider: weatherUseCaseProvider,
        );

  @override
  void onLayoutReady(BuildContext context, WeatherUseCase useCase) {
    useCase.fetchWeather(cityName: 'San Diego');
  }

  @override
  WeatherViewModel createViewModel(
    WeatherUseCase useCase,
    WeatherUIOutput output,
  ) {
    return WeatherViewModel(
      weatherList: output.weatherList
          .map((e) => SingleWeatherViewModel(
              cityName: e.cityName, currentTemp: e.currentTemp))
          .toList(growable: false),
      fetchWeather: useCase.fetchWeather,
    );
  }
}
