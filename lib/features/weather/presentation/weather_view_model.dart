import 'package:clean_framework/clean_framework_providers.dart';

class WeatherViewModel extends ViewModel{

  WeatherViewModel({
    required this.isLoading,
    required this.cityName,
    required this.countryName,
    required this.currentTemperature,
    required this.currentTemperatureDescription,
    required this.currentHumidity,
    required this.searchWeather
  }):
          assert(cityName.isNotEmpty),
          assert( countryName.isNotEmpty),
          assert( currentTemperature.isNotEmpty),
          assert(currentTemperatureDescription.isNotEmpty),
          assert( currentHumidity.isNotEmpty);

  final bool isLoading;
  final String cityName;
  final String countryName;
  final String currentTemperature;
  final String currentTemperatureDescription;
  final String currentHumidity;

  final Function(String placeName) searchWeather;

  @override
  List<Object> get props =>
      [isLoading ,cityName,countryName,currentTemperature,currentTemperatureDescription,currentHumidity];


}