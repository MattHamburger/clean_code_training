import 'package:clean_code_training/features/pokemon/domain/pokemon_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class PokemonEntity extends Entity {
  PokemonEntity({
    this.isLoading = false,
    this.pokemons = const []
  });

  final bool isLoading;
  final List<PokemonModel> pokemons;

  @override
  List<Object?> get props => [isLoading, pokemons];

  // PokemonEntity merge({
  //   bool? isLoading,
  //   List<PokemonModel>? pokemons
  // }) {
  //   return PokemonEntity(
  //     isLoading: isLoading ?? this.isLoading,
  //     pokemons: this.pokemons
  //   );
  // }
}
