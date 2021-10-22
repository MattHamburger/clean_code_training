import 'package:clean_code_training/features/rick_morty/domain/rick_morty_use_case.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyGateway extends GraphQLGateway<RickMortyGatewayOutput,
    RickMortyRequest, RickMortySuccessInput> {
  RickMortyGateway()
      : super(provider: rickMortyUseCaseProvider, context: providersContext);

  @override
  RickMortyRequest buildRequest(RickMortyGatewayOutput output) {
    return RickMortyRequest();
  }

  @override
  FailureInput onFailure(FailureResponse failureResponse) {
    return FailureInput(message: 'Failed to Fetch Data');
  }

  @override
  RickMortySuccessInput onSuccess(covariant GraphQLSuccessResponse response) {
    return RickMortySuccessInput.fromJson(response.data);
  }
}

class RickMortyRequest extends QueryGraphQLRequest {
  @override
  String get document =>
      r'''query {characters(page: 1) {results {name,status,species,image,gender}}}''';

  @override
  List<Object?> get props => [];
}
