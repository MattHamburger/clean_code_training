import 'package:clean_code_training/features/weather/domain/weather_utility.dart';
import 'package:clean_code_training/features/weather/external_interface/weather_gateway.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_code_training/features/weather/domain/weather_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter_test/flutter_test.dart';

import '../domain/weather_use_case_test.dart';

void main() {
  group('WeatherGateway tests :: ', () {
    test('fetches weather successfully', () async {
      final useCase = weatherUseCaseProvider.getUseCaseFromContext(
        providersContext,
      );
      final gateway = weatherGatewayProvider.getGateway(providersContext);

      gateway.transport = (request) async {
        return Right(
          GraphQLSuccessResponse(
            data: {
              'getCityByName': {
                'name': request.cityName,
                'weather': const {
                  'temperature': {
                    'feelsLike': 190.56,
                  }
                }
              },
            },
          ),
        );
      };

      await useCase.fetchWeather(cityName: 'San Jose');

      expect(
        useCase.entity,
        WeatherEntity(
          isLoading: false,
          cities: const ['San Jose'],
          weatherList: [
            WeatherModel(
              currentTemp: 190.56,
              cityName: 'San Jose',
            ),
          ],
        ),
      );
    });

    test('fails to fetch weather', () async {
      final useCase = weatherUseCaseProvider.getUseCaseFromContext(
        providersContext,
      );
      final gateway = weatherGatewayProvider.getGateway(providersContext);

      // gateway.onFailure(failureResponse) = (request) async {
      //   return const Left(
      //     FailureResponse(),
      //   );
      // };
      //
      // await useCase.fetchWeather(cityName: 'San Jose');
      //
      // expect(
      //   useCase.entity,
      //   WeatherEntity(
      //     isLoading: false,
      //     cities: const [],
      //     weatherList: const [],
      //   ),
      // );

      expect(gateway.onFailure(const FailureResponse()),
          equals(FailureInput(message: 'test')));
    });

    test('WeatherGateway equity test', () {
      final gateway = weatherGatewayProvider.getGateway(providersContext);
      expect(gateway.onFailure(const FailureResponse()),
          equals(FailureInput(message: 'test')));
    });

    test('WeatherRequest equity test', () {
      final req = WeatherRequest(cityName: 'San Jose');
      expect(req.variables, equals({'cityName': 'San Jose'}));

      expect(req.props, equals(['San Jose']));
    });
  });
}
