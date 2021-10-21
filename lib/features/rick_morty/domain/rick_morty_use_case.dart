import 'package:clean_code_training/features/rick_morty/domain/rick_morty_entity.dart';
import 'package:clean_code_training/features/rick_morty/domain/rick_morty_input_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyUseCase extends UseCase<RickMortyEntity> {
  RickMortyUseCase()
      : super(entity: RickMortyEntity(), outputFilters: {
          RickMortyUIOutput: (RickMortyEntity entity) => RickMortyUIOutput(
              characters: entity.characters, isLoading: entity.isLoading)
        });
}

class RickMortyUIOutput extends Output {
  RickMortyUIOutput({required this.isLoading, required this.characters});

  final bool isLoading;
  final List<RickMortyCharacterInputModel> characters;

  @override
  List<Object?> get props => [isLoading, characters];
}
