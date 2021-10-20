import 'package:clean_code_training/features/weather/domain/weather_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class WeatherEntity extends Entity {
  WeatherEntity({
    this.isLoading = false,
    this.weatherList = const [],
    this.continents = const {},
    this.selectedContinentId = 'AS', // AS is country code for Asia.
  });

  final bool isLoading;
  final List<WeatherModel> weatherList;
  final Map<String, String> continents;
  final String selectedContinentId;

  @override
  List<Object?> get props {
    return [isLoading, weatherList, continents, selectedContinentId];
  }

  WeatherEntity merge({
    bool? isLoading,
    List<WeatherModel>? weatherList,
    Map<String, String>? continents,
    String? continentId,
  }) {
    return WeatherEntity(
      isLoading: isLoading ?? this.isLoading,
      weatherList: weatherList ?? this.weatherList,
      continents: continents ?? this.continents,
      selectedContinentId: continentId ?? selectedContinentId,
    );
  }
}
