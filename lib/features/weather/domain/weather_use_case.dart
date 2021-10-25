import 'package:clean_code_training/features/weather/domain/weather_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class WeatherUseCase extends UseCase<WeatherEntity>{
  WeatherUseCase() : super( entity:  WeatherEntity(),
    outputFilters: {
      WeatherUIOutput : (WeatherEntity entity){
        return WeatherUIOutput(
          isLoading: entity.isLoading,
          cityName: entity.cityName,
          countryName: entity.countryName,
          currentHumidity: entity.currentHumidity,
          currentTemperature: entity.currentTemperature,
          currentTemperatureDescription: entity.currentTemperatureDescription
      );}
    });

  Future<dynamic> searchWeather(String placeName) async{
    entity = entity.merge(isLoading: true);
   // await Future.delayed(const Duration(seconds: 2));
   /* entity=  entity.merge(
      isLoading: false,
      cityName: placeName
    );*/
    print("calling");
    return request<WeatherGatewayOutput,WeatherSuccessInput>(
        WeatherGatewayOutput(
          placeName : placeName
        ), onSuccess: (weatherSuccessInput){
          return entity.merge(
            isLoading: false,
            cityName: weatherSuccessInput.cityName,
            countryName: weatherSuccessInput.countryName,
            currentTemperature: weatherSuccessInput.currentTemperature,
            currentTemperatureDescription: weatherSuccessInput.currentTemperatureDescription,
            currentHumidity: weatherSuccessInput.currentHumidity
          );
    }, onFailure: (failure){
          return entity.merge(
            isLoading: false
          );
    });

  }
}

class WeatherUIOutput extends Output{

  WeatherUIOutput({
    this.isLoading = false,
    this.cityName = "",
    this.countryName = "",
    this.currentTemperature = 301.15,
    this.currentTemperatureDescription = "",
    this.currentHumidity = ""
  });

  final bool isLoading;
  final String cityName;
  final String countryName;
  final double currentTemperature;
  final String currentTemperatureDescription;
  final String currentHumidity;

  @override
  List<Object?> get props => [isLoading,cityName,countryName,currentTemperature,currentTemperatureDescription,currentHumidity];

}

class WeatherGatewayOutput extends Output{

  final String placeName;

  WeatherGatewayOutput({required this.placeName});

  @override
  List<Object?> get props => [placeName];

}

class WeatherSuccessInput extends SuccessInput{

  final String cityName;
  final String countryName;
  final double currentTemperature;
  final String currentTemperatureDescription;
  final String currentHumidity;

  WeatherSuccessInput({
      required this.cityName,
      required this.countryName,
      required this.currentTemperature,
      required  this.currentTemperatureDescription,
      required this.currentHumidity});

  @override
  List<Object?> get props => [cityName,countryName,currentTemperature,currentTemperatureDescription,currentHumidity];

  factory WeatherSuccessInput.fromJson(Map<String, dynamic> data) {
    return WeatherSuccessInput(
        cityName : data["getCityByName"]["name"],
        countryName : data["getCityByName"]["name"],
        currentTemperature: data["getCityByName"]["weather"]["temperature"]["actual"],
        currentTemperatureDescription: data["getCityByName"]["weather"]["summary"]["title"],
        currentHumidity: (data["getCityByName"]["weather"]["clouds"]["humidity"]).toString()
    );
  }

}