import 'package:clean_framework/clean_framework_providers.dart';

class WeatherEntity extends Entity{

  WeatherEntity({
    this.isLoading = false,
    this.cityName = "Aluva",
    this.countryName = "IN",
    this.currentTemperature = 301.15,
    this.currentTemperatureDescription = "Haze",
    this.currentHumidity = "74"
  });

  final bool isLoading;
  final String cityName;
  final String countryName;
  final double currentTemperature;
  final String currentTemperatureDescription;
  final String currentHumidity;

  @override
  List<Object?> get props => [isLoading,cityName,countryName,currentTemperature,currentTemperatureDescription,currentHumidity];

  WeatherEntity merge({
    bool? isLoading ,
    String? cityName ,
    String? countryName ,
    double? currentTemperature ,
    String? currentTemperatureDescription ,
    String? currentHumidity}) {
    return WeatherEntity(
      isLoading : isLoading ?? this.isLoading,
      cityName: cityName ?? this.cityName,
      countryName: countryName ?? this.countryName,
      currentTemperature: currentTemperature ?? this.currentTemperature,
      currentTemperatureDescription: currentTemperatureDescription ?? this.currentTemperatureDescription,
      currentHumidity: currentHumidity ?? this.currentHumidity
    );
  }

}