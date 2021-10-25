import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';

import 'features/weather/domain/weather_entity.dart';
import 'features/weather/domain/weather_use_case.dart';
import 'features/weather/external_interface/weather_gateway.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final weatherUseCaseProvider =
UseCaseProvider<WeatherEntity, WeatherUseCase>(
        (_) => WeatherUseCase(),
);

final weatherGatewayProvider = GatewayProvider<WeatherGateWay>(
      (_) => WeatherGateWay(
      ),
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
  weatherUseCaseProvider.getUseCaseFromContext(providersContext);
  weatherGatewayProvider.getGateway(providersContext);
  graphQLExternalInterface.getExternalInterface(providersContext);
}
