import 'package:clean_code_training/features/feature_four/domain/feature_four_entity.dart';
import 'package:clean_code_training/features/feature_four/domain/feature_four_use_case.dart';
import 'package:clean_code_training/features/feature_three/domain/feature_three_entity.dart';
import 'package:clean_code_training/features/feature_three/domain/feature_three_use_case.dart';
import 'package:clean_code_training/features/feature_two/domain/feature_two_entity.dart';
import 'package:clean_code_training/features/feature_two/domain/feature_two_use_case.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import 'features/weather/domain/weather_use_case.dart';
import 'features/weather/domain/weather_utility.dart';
import 'features/weather/external_interface/weather_gateway.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final weatherUseCaseProvider = UseCaseProvider<WeatherEntity, WeatherUseCase>(
  (_) => WeatherUseCase(),
);

final weatherGatewayProvider = GatewayProvider<WeatherGateway>(
  (_) => WeatherGateway(),
);

final featureTwoUseCaseProvider =
    UseCaseProvider<FeatureTwoEntity, FeatureTwoUseCase>(
  (_) => FeatureTwoUseCase(),
);

final featureThreeUseCaseProvider =
    UseCaseProvider<FeatureThreeEntity, FeatureThreeUseCase>(
  (_) => FeatureThreeUseCase(),
);

final featureFourUseCaseProvider =
    UseCaseProvider<FeatureFourEntity, FeatureFourUseCase>(
  (_) => FeatureFourUseCase(),
);

final graphQLExternalInterface = ExternalInterfaceProvider(
        (_) => GraphQLExternalInterface(
        link: 'https://graphql-weather-api.herokuapp.com',
        gatewayConnections: [
                () => weatherGatewayProvider.getGateway(providersContext),
        ],
    ),
);

void loadProviders() {
    graphQLExternalInterface.getExternalInterface(providersContext);
}
