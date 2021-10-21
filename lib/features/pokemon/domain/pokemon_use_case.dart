import 'package:clean_code_training/features/pokemon/domain/pokemon_entity.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';


class PokemonUseCase extends UseCase<PokemonEntity> {
  PokemonUseCase()
      : super(
          entity: PokemonEntity(),
          outputFilters: {
            PokemonUIOutput: (PokemonEntity p) {
              return PokemonUIOutput(
                isLoading: p.isLoading, 
                pokemons: p.pokemons
              );
            }
          },
        );

  // Future<void> fetchPokemons({int? numEntries, bool isRefresh = false}) async {
  //   if (!isRefresh) {
  //     entity = entity.merge(isLoading: true);
  //   }

  //   return request<PokemonGatewayOutput, PokemonSuccessInput>(
  //     PokemonGatewayOutput(numEntries: 151),
  //     onSuccess: (successInput) => entity.merge(isLoading: false, pokemons: successInput.pokemons),
  //     onFailure: (failure) => entity.merge(isLoading: false)
  //   );
  // }
}

class PokemonUIOutput extends Output {
  PokemonUIOutput({
    required this.isLoading,
    required this.pokemons
  });

  final bool isLoading;
  final List<PokemonModel> pokemons;

  @override
  List<Object?> get props => [isLoading, pokemons];
}

// class PokemonGatewayOutput extends Output {
//   final int numEntries;

//   PokemonGatewayOutput({required this.numEntries});

//   @override
//   List<Object?> get props => [numEntries];
// }

// class PokemonSuccessInput extends SuccessInput {
//   final List<PokemonModel> pokemons;

//   PokemonSuccessInput({required this.pokemons});

//   factory PokemonSuccessInput.fromJson(Map<String, dynamic> json) {
//     return PokemonSuccessInput(
//       pokemons: List.of(json['pokemons'] ?? [])
//           .map((c) => PokemonModel.fromJson(c))
//           .toList(growable: false),
//     );
//   }

//   @override
//   List<Object?> get props => [pokemons];
// }
