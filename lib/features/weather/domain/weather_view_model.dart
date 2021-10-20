import 'package:clean_framework/clean_framework_providers.dart';

class WeatherViewModel extends ViewModel {
  WeatherViewModel({
    this.isLoading = false,
    this.weatherList = const [],
    this.continents = const {},
    this.selectedContinentId = 'San Francisco',
    required this.fetchWeather,
  });

  final bool isLoading;
  final List<SingleWeatherViewModel> weatherList;
  final Map<String, String> continents;
  final String selectedContinentId;
  final Future<void> Function({
    required String cityName,
    bool isRefresh,
  }) fetchWeather;

  @override
  List<Object?> get props {
    return [
      isLoading,
      weatherList,
      continents,
      selectedContinentId,
      fetchWeather
    ];
  }
}

class SingleWeatherViewModel extends ViewModel {
  SingleWeatherViewModel({
    required this.cityName,
    required this.currentTemp,
  });

  final String cityName;
  final double currentTemp;

  @override
  List<Object?> get props {
    return [cityName, currentTemp];
  }
}
