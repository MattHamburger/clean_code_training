import 'package:clean_code_training/features/pokemon/domain/pokemon_model.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_use_case.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class PokemonPresenter extends Presenter<PokemonViewModel,PokemonUIOutput, PokemonUseCase> {
  PokemonPresenter({
    required PresenterBuilder<PokemonViewModel> builder,
  }) : super(
          builder: builder,
          provider: pokemonUseCaseProvider,
        );

  // @override
  // void onLayoutReady(BuildContext context, PokemonUseCase useCase) {
  //   useCase.fetchPokemons();
  // }

  @override
  PokemonViewModel createViewModel(
    PokemonUseCase useCase,
    PokemonUIOutput output,
  ) {
    return PokemonViewModel(
      isLoading: false,
      pokemons: [
        PokemonModel(image: "https://img.pokemondb.net/artwork/bulbasaur.jpg", number: "001", name: "Bulbasaur", classification: "Seed Pokémon"),
        PokemonModel(image: "https://img.pokemondb.net/artwork/ivysaur.jpg", number: "002", name: "Ivysaur", classification: "Seed Pokémon"),
        PokemonModel(image: "https://img.pokemondb.net/artwork/venusaur.jpg", number: "003", name: "Venusaur", classification: "Seed Pokémon")
      ]
    );
  }
}
