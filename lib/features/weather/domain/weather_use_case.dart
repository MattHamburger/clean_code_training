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
        cities: [cityName],
      ),
      onFailure: (failure) => entity.merge(isLoading: false),
    );
  }

  Future<void> addWeather({required String cityName}) async {
    return request<WeatherGatewayOutput, WeatherSuccessInput>(
      WeatherGatewayOutput(cityName: cityName),
      onSuccess: (successInput) => entity.merge(
        weatherList: successInput.weatherList,
        isLoading: false,
      ),
      onFailure: (failure) => entity.merge(isLoading: false),
    );
  }
}

class WeatherUIOutput extends Output {
  WeatherUIOutput({
    required this.isLoading,
    required this.weatherList,
  });

  final bool isLoading;
  final List<WeatherModel> weatherList;

  @override
  List<Object?> get props {
    return [
      isLoading,
      weatherList,
    ];
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
