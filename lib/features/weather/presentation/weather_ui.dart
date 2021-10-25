import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_code_training/features/weather/presentation/weather_presenter.dart';
import 'package:clean_code_training/features/weather/presentation/weather_view_model.dart';
import 'package:clean_code_training/features/weather/presentation/widgets/search_weather_view.dart';
import 'package:clean_code_training/features/weather/presentation/widgets/weather_details_card.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class WeatherUI extends UI<WeatherViewModel>{

  WeatherUI({Key? key, PresenterCreator<WeatherViewModel>? create})
      : super(key: key, create: create);

  @override
  Widget build(BuildContext context, WeatherViewModel viewModel) {
    return  SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          title: const Text("Weather Details"),
        ),
        body: Column(
          children: [
            SearchWeatherView(key: key,
              isLoading: viewModel.isLoading,
              onPlaceNameSubmitted: (placeName) => viewModel.searchWeather(placeName) ,
            ),
            viewModel.isLoading ? const CircularProgressIndicator() : Container( height: 50,),
            Expanded(
              child: WeatherDetailsCard(
                cityName: viewModel.cityName,
                countryName: viewModel.countryName,
                currentTemperature: viewModel.currentTemperature,
                currentTemperatureDescription: viewModel.currentTemperatureDescription,
                currentHumidity: viewModel.currentHumidity,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(PresenterBuilder<WeatherViewModel> builder) {
    return WeatherPresenter(builder:builder);
  }

}
