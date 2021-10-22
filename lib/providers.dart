import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

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

@visibleForTesting
void resetProvidersContext([ProvidersContext? context]) {
  _providersContext = context ?? ProvidersContext();
}
