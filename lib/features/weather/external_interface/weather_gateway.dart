import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/src/providers/gateway.dart';
import 'package:clean_framework/src/providers/use_case.dart';

class WeatherGateWay extends GraphQLGateway<WeatherGatewayOutput,WeatherRequest,WeatherSuccessInput>{
  WeatherGateWay() : super(
      context: providersContext,
      provider: weatherUseCaseProvider
  );

  @override
  WeatherRequest buildRequest(WeatherGatewayOutput output) {
    print("placename : ${output.placeName}");

    return WeatherRequest(
        placeName : output.placeName
    );
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    print("Failure");
    return FailureInput();
  }

  @override
  WeatherSuccessInput onSuccess(covariant GraphQLSuccessResponse response) {
    print("onSuccess");

    return WeatherSuccessInput.fromJson(response.data);
  }

}

class WeatherRequest extends  QueryGraphQLRequest{

  final String placeName;

  WeatherRequest({required this.placeName});

  @override
  String get document => r'''
query ($placeName: String!) {
  getCityByName(name: $placeName) {
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
  Map<String, dynamic>? get variables => {
    "placeName" : placeName
  };

  @override
  List<Object?> get props => [placeName];
}