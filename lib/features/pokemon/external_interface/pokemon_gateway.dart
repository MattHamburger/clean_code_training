// import 'package:clean_code_training/features/pokemon/domain/pokemon_use_case.dart';
// import 'package:clean_code_training/providers.dart';
// import 'package:clean_framework/clean_framework_defaults.dart';
// import 'package:clean_framework/clean_framework_providers.dart';

// class PokemonGateway extends GraphQLGateway<PokemonGatewayOutput, PokemonRequest, PokemonSuccessInput> {
//   PokemonGateway()
//       : super(
//           context: providersContext,
//           provider: pokemonUseCaseProvider,
//         );

//   @override
//   PokemonRequest buildRequest(PokemonGatewayOutput output) {
//     return PokemonRequest(
//       numEntries: output.numEntries,
//     );
//   }

//   @override
//   PokemonSuccessInput onSuccess(GraphQLSuccessResponse response) {
//     return PokemonSuccessInput.fromJson(response.data);
//   }

//   @override
//   FailureInput onFailure(FailureResponse failureResponse) {
//     return FailureInput(message: 'test');
//   }
// }

// class PokemonRequest extends QueryGraphQLRequest {
//   PokemonRequest({required this.numEntries});

//   final int numEntries;

//   @override
//   String get document => r'''
//     query pokemons($first: Int!){
//       pokemons(first: $first){
//         number
//         name
//         classification
//         image
//       }
//     }
//   ''';

//   @override
//   List<Object?> get props => [numEntries];
// }