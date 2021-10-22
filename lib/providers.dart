import 'package:clean_code_training/features/rick_morty/domain/rick_morty_entity.dart';
import 'package:clean_code_training/features/rick_morty/domain/rick_morty_use_case.dart';
import 'package:clean_code_training/features/rick_morty/external_interface/rick_morty_gateway.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

@visibleForTesting
void resetProvidersContext([ProvidersContext? context]) {
  _providersContext = context ?? ProvidersContext();
}

final rickMortyUseCaseProvider =
    UseCaseProvider<RickMortyEntity, RickMortyUseCase>(
        (_) => RickMortyUseCase());

final rickMortyGatewayProvider =
    GatewayProvider<RickMortyGateway>((_) => RickMortyGateway());

final graphQLExternalInterface = ExternalInterfaceProvider((_) =>
    GraphQLExternalInterface(
        link: 'https://rickandmortyapi.com/graphql',
        gatewayConnections: [
          () => rickMortyGatewayProvider.getGateway(providersContext)
        ]));

void loadProviders() {
  graphQLExternalInterface.getExternalInterface(providersContext);
}
