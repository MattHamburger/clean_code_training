import 'package:clean_code_training/features/pokemon/domain/pokemon_use_case.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class PokemonPresenter extends Presenter<PokemonViewModel,PokemonUIOutput, PokemonUseCase> {
  PokemonPresenter({
    required PresenterBuilder<PokemonViewModel> builder,
  }) : super(
          builder: builder,
          provider: pokemonUseCaseProvider,
        );

  @override
  PokemonViewModel createViewModel(
    PokemonUseCase useCase,
    PokemonUIOutput output,
  ) {
    return PokemonViewModel();
  }
}
