import 'package:clean_code_training/features/pokemon/domain/pokemon_model.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_use_case.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_view_model.dart';
import 'package:clean_code_training/features/pokemon/presentation/pokemon_presenter.dart';
import 'package:clean_code_training/features/pokemon/presentation/pokemon_ui.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pokemon Initial Load', () {
    uiTest('My widget has an image, number, name, and classification',
        context: providersContext,
        builder: () => PokemonUI(),
        verify: (tester) async {
          await tester.pumpAndSettle();

          final number001Finder = find.text('001');
          final number002Finder = find.text('001');
          final number003Finder = find.text('003');
          final bulbasaurFinder = find.text('Bulbasaur');
          final ivysaurFinder = find.text('Ivysaur');
          final venusaurFinder = find.text('Venusaur');
          final classificationFinder = find.text('Seed Pokémon');


          expect(number001Finder, findsOneWidget);
          expect(number002Finder, findsOneWidget);
          expect(number003Finder, findsOneWidget);
          expect(bulbasaurFinder, findsOneWidget);
          expect(ivysaurFinder, findsOneWidget);
          expect(venusaurFinder, findsOneWidget);
          expect(classificationFinder, findsNWidgets(3));
        });
  });
}

class PresenterFake extends PokemonPresenter {
  PresenterFake({required PresenterBuilder<PokemonViewModel> builder})
      : super(builder: builder);

  @override
  PokemonUIOutput subscribe(_) => PokemonUIOutput(
    isLoading: false,
    pokemons: [
      PokemonModel(image: "https://img.pokemondb.net/artwork/bulbasaur.jpg", number: "001", name: "Bulbasaur", classification: "Seed Pokémon"),
      PokemonModel(image: "https://img.pokemondb.net/artwork/ivysaur.jpg", number: "002", name: "Ivysaur", classification: "Seed Pokémon"),
      PokemonModel(image: "https://img.pokemondb.net/artwork/venusaur.jpg", number: "003", name: "Venusaur", classification: "Seed Pokémon")
    ],
  );
}