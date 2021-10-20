import 'package:clean_code_training/features/weather/domain/weather_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class WeatherEntity extends Entity {
  WeatherEntity({
    this.isLoading = false,
    this.weatherList = const [],
    this.cities = const [],
  });

  final bool isLoading;
  final List<WeatherModel> weatherList;
  final List<String> cities;

  @override
  List<Object?> get props {
    return [
      isLoading,
      weatherList,
      cities,
    ];
  }

  WeatherEntity merge({
    bool? isLoading,
    List<WeatherModel>? weatherList,
    List<String>? cities,
  }) {
    return WeatherEntity(
      isLoading: isLoading ?? this.isLoading,
      weatherList: weatherList ?? this.weatherList,
      cities: cities ?? this.cities,
    );
  }
}
