import 'package:clean_framework/clean_framework_providers.dart';

class WeatherViewModel extends ViewModel{

  WeatherViewModel({
    required this.isLoading,
    required this.cityName,
    required this.countryName,
    required this.currentTemperature,
    required this.currentTemperatureDescription,
    required this.currentHumidity
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