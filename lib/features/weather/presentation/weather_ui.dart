import 'package:clean_code_training/features/weather/domain/weather_view_model.dart';
import 'package:clean_code_training/features/weather/presentation/weather_presenter.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class WeatherUI extends UI<WeatherViewModel> {
  WeatherUI({Key? key}) : super(key: key);

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
    PresenterBuilder<WeatherViewModel> builder,
  ) {
    return WeatherPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, WeatherViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Things'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: (){
              viewModel.fetchWeather(cityName: 'San Jose');
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          for (final vm in viewModel.weatherList)
            ListTile(
              title: Text(vm.currentTemp.toStringAsFixed(0)),
              subtitle: Text(vm.cityName),
            ),
        ],
      ),
    );
  }
}
