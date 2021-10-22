import 'package:clean_code_training/features/weather/domain/weather_model.dart';
import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_code_training/features/weather/domain/weather_utility.dart';
import 'package:clean_code_training/providers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WeatherUseCase getWeatherUseCase() {
    return weatherUseCaseProvider.getUseCaseFromContext(providersContext);
  }

  setUp(() {
    resetProvidersContext();
    graphQLExternalInterface.getExternalInterface(providersContext);
  });

  group('WeatherUseCase tests ::', () {
    test('fetches weather for specific city successfully', () async {
      final useCase = getWeatherUseCase();

      expect(
          useCase.entity,
          WeatherEntity(
            isLoading: false,
            weatherList: const [],
            cities: const [],
          ));

      expectLater(
        useCase.stream,
        emitsInOrder(
          [
            WeatherEntity(isLoading: true, cities: const []),
            isA<WeatherEntity>()
                .having((e) => e.isLoading, 'isLoading', isFalse)
                .having((e) => e.weatherList, 'weatherList',
                    isA<List<WeatherModel>>()),
          ],
        ),
      );

      await useCase.fetchWeather(cityName: 'San Jose');
      useCase.dispose();
    });
  });

  group('WeatherGateWayOutput tests ::', () {
    test('equity test', () {
      final output = WeatherGatewayOutput(cityName: 'San Jose');

      expect(
        output.props,
        equals(['San Jose']),
      );
    });
  });

  group('WeatherSuccessInput tests ::', () {
    test('equity test', () {
      final output = WeatherSuccessInput(weatherList: const []);

      expect(
        output.props,
        equals([const []]),
      );
    });
  });
}
