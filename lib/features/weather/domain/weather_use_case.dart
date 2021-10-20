import 'package:clean_code_training/features/weather/domain/weather_model.dart';
import 'package:clean_code_training/features/weather/domain/weather_utility.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class WeatherUseCase extends UseCase<WeatherEntity> {
  WeatherUseCase()
      : super(
          entity: WeatherEntity(),
          outputFilters: {
            WeatherUIOutput: (WeatherEntity entity) => WeatherUIOutput(
                  isLoading: entity.isLoading,
                  selectedContinentId: entity.selectedContinentId,
                  continents: entity.continents,
                  weatherList: entity.weatherList,
                ),
          },
        );

  Future<void> fetchWeather({
    required String cityName,
    bool isRefresh = false,
  }) async {
    if (!isRefresh) entity = entity.merge(isLoading: true);

    //final _cityName = cityName ?? entity.selectedContinentId;

    final _cityName = cityName;

    return request<WeatherGatewayOutput, WeatherSuccessInput>(
      WeatherGatewayOutput(cityName: _cityName),
      onSuccess: (successInput) => entity.merge(
        weatherList: successInput.weatherList,
        isLoading: false,
        continentId: _cityName,
      ),
      onFailure: (failure) => entity.merge(isLoading: false),
    );
  }
}

class WeatherUIOutput extends Output {
  WeatherUIOutput({
    required this.isLoading,
    required this.weatherList,
    required this.continents,
    required this.selectedContinentId,
  });

  final bool isLoading;
  final List<WeatherModel> weatherList;
  final Map<String, String> continents;
  final String selectedContinentId;

  @override
  List<Object?> get props {
    return [isLoading, weatherList, continents, selectedContinentId];
  }
}

class WeatherGatewayOutput extends Output {
  final String cityName;

  WeatherGatewayOutput({required this.cityName});

  @override
  List<Object?> get props => [cityName];
}

class WeatherSuccessInput extends SuccessInput {
  final List<WeatherModel> weatherList;

  WeatherSuccessInput({required this.weatherList});

  factory WeatherSuccessInput.fromJson(Map<String, dynamic> json) {
    print(json);
    return WeatherSuccessInput(
      weatherList: [WeatherModel.fromJson(json)],
    );
  }

  @override
  List<Object?> get props => [weatherList];
}
