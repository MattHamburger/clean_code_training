import 'package:clean_code_training/features/rick_morty/domain/rick_morty_use_case.dart';
import 'package:clean_code_training/features/rick_morty/presentation/rick_morty_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class RickMortyPresenter
    extends Presenter<RickMortyViewModel, RickMortyUIOutput, RickMortyUseCase> {
  RickMortyPresenter({required PresenterBuilder<RickMortyViewModel> builder})
      : super(builder: builder, provider: rickMortyUseCaseProvider);

  @override
  void onLayoutReady(BuildContext context, RickMortyUseCase useCase) {
    useCase.fetch();
  }

  @override
  RickMortyViewModel createViewModel(
      RickMortyUseCase useCase, RickMortyUIOutput output) {
    return RickMortyViewModel(
        isLoading: output.isLoading,
        characters: output.characters
            .map((c) => SingleCharacterViewModel(
                name: c.name,
                species: c.species,
                status: c.status,
                gender: c.gender))
            .toList());
  }
}