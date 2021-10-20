import 'package:clean_framework/clean_framework_providers.dart';

class WeatherEntity extends Entity{

  WeatherEntity({
   this.isLoading = false,
   this.cityName = "",
   this.countryName = "",
   this.currentTemperature = "",
   this.currentTemperatureDescription = "",
   this.currentHumidity = ""
  });

  final bool isLoading;
  final String cityName;
  final String countryName;
  final String currentTemperature;
  final String currentTemperatureDescription;
  final String currentHumidity;

  @override
  List<Object?> get props => [isLoading,cityName,countryName,currentTemperature,currentTemperatureDescription,currentHumidity];

}