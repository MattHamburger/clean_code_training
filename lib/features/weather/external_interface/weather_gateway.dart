import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_code_training/providers.dart';


class WeatherGateway extends GraphQLGateway<WeatherGatewayOutput,
    WeatherRequest, WeatherSuccessInput> {
  WeatherGateway()
      : super(
    context: providersContext,
    provider: weatherUseCaseProvider,
  );

  @override
  WeatherRequest buildRequest(WeatherGatewayOutput output) {
    return WeatherRequest(
      cityName: output.cityName,
    );
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: 'test');
  }

  @override
  WeatherSuccessInput onSuccess(GraphQLSuccessResponse response) {
    return WeatherSuccessInput.fromJson(response.data);
  }
}

class WeatherRequest extends QueryGraphQLRequest {
  WeatherRequest({required this.cityName}){
    print(cityName);
  }

  final String cityName;

  @override
  String get document => r'''
query ($cityName: String!) {
  getCityByName(name: $cityName) {
    id
    name
    country
    coord {
      lon
      lat
    }
    weather {
      summary {
        title
        description
        icon
      }
      temperature {
        actual
        feelsLike
        min
        max
      }
      wind {
        speed
        deg
      }
      clouds {
        all
        visibility
        humidity
      }
      timestamp
    }
  }
}
  ''';

  @override
  Map<String, dynamic>? get variables {
    return {
      'cityName': cityName,
    };
  }

  @override
  List<Object?> get props => [cityName];
}