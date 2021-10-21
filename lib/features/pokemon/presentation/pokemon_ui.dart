import 'package:clean_code_training/features/pokemon/domain/pokemon_model.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_view_model.dart';
import 'package:clean_code_training/features/pokemon/presentation/pokemon_presenter.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class PokemonUI extends UI<PokemonViewModel> {
  PokemonUI({Key? key, PresenterCreator<PokemonViewModel>? create}) : super(key: key, create: create);

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
    PresenterBuilder<PokemonViewModel> builder,
  ) {
    return PokemonPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, PokemonViewModel model) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemon Feature'),
      ),
      body: _PokemonListWidget(
        isLoading: model.isLoading,
        child: RefreshIndicator(
            onRefresh: () async {},
            child: ListView.builder(
                itemCount: model.pokemons.length,
                itemBuilder: (context, index) {
                  final PokemonModel pokemon = model.pokemons[index];

                  return PokemonCardWidget(
                    image: pokemon.image,
                    number: pokemon.number,
                    name: pokemon.name,
                    classification: pokemon.classification,
                  );
                }))));
  }
}

class _PokemonListWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const _PokemonListWidget(
      {Key? key, required this.isLoading, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(duration: const Duration(milliseconds: 300),
      child: (isLoading)
        ? const Center(
            child: SizedBox(width: 20.0, height: 20.0,
              child: CircularProgressIndicator(strokeWidth: 5.0)))
        : child);
  }
}

class PokemonCardWidget extends StatelessWidget {
  final String image;
  final String number;
  final String name;
  final String classification;

  const PokemonCardWidget(
      {Key? key,
      required this.image,
      required this.number,
      required this.name,
      required this.classification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(children: [
          // Image.network(image, height: 50.0, width: 50.0, fit: BoxFit.cover),
          const SizedBox(width: 24.0),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(number,
                    style: const TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4.0),
                Text(name,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4.0),
                Text(classification,
                    style: const TextStyle(
                        fontSize: 14.0, fontWeight: FontWeight.w500))
              ])),
        ]));
  }
}