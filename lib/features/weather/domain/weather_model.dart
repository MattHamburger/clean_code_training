import 'package:clean_framework/clean_framework_providers.dart';

class WeatherModel extends Input {
  WeatherModel({
    required this.cityName,
    required this.currentTemp,
  });

  final String cityName;
  final double currentTemp;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['getCityByName']['name'] ?? '',
      currentTemp: json['getCityByName']['weather']['temperature']['feelsLike'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [cityName, currentTemp];

  @override
  String toString() {
    return 'WeatherModel{cityName: $cityName, cityName: $currentTemp}';
  }
}
