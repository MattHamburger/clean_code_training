import 'package:clean_code_training/features/pokemon/domain/pokemon_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class PokemonUseCase extends UseCase<PokemonEntity> {
  PokemonUseCase()
      : super(
          entity: PokemonEntity(),
          outputFilters: {
            PokemonUIOutput: (entity) => PokemonUIOutput(),
          },
        );
}

class PokemonUIOutput extends Output {
  @override
  List<Object?> get props => [];
}
