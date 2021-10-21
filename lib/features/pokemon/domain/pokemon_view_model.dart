import 'package:clean_code_training/features/pokemon/domain/pokemon_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class PokemonViewModel extends ViewModel {
  PokemonViewModel({
    required this.isLoading,
    required this.pokemons
  });

  final bool isLoading;
  final List<PokemonModel> pokemons;

  @override
  List<Object?> get props => [isLoading, pokemons];
}
