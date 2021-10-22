import 'package:clean_code_training/features/rick_morty/domain/rick_morty_entity.dart';
import 'package:clean_code_training/features/rick_morty/domain/rick_morty_input_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyUseCase extends UseCase<RickMortyEntity> {
  RickMortyUseCase()
      : super(entity: RickMortyEntity(), outputFilters: {
          RickMortyUIOutput: (RickMortyEntity entity) => RickMortyUIOutput(
              characters: entity.characters, isLoading: entity.isLoading)
        });

  Future<void> fetch() async {
    entity = entity.merge(isLoading: true);

    return request<RickMortyGatewayOutput, RickMortySuccessInput>(
        RickMortyGatewayOutput(),
        onSuccess: (successInput) =>
            entity.merge(isLoading: false, characters: successInput.characters),
        onFailure: (failureInput) => entity.merge(isLoading: false));
  }
}

class RickMortyUIOutput extends Output {
  RickMortyUIOutput({required this.isLoading, required this.characters});

  final bool isLoading;
  final List<RickMortyCharacterInputModel> characters;

  @override
  List<Object?> get props => [isLoading, characters];
}

class RickMortyGatewayOutput extends Output {
  @override
  List<Object?> get props => [];
}

class RickMortySuccessInput extends SuccessInput {
  final List<RickMortyCharacterInputModel> characters;

  RickMortySuccessInput({required this.characters});

  factory RickMortySuccessInput.fromJson(Map<String, dynamic> json) {
    return RickMortySuccessInput(
        characters: List.of(json['characters']['results'] ?? [])
            .map((c) => RickMortyCharacterInputModel.fromJson(c))
            .toList(growable: false));
  }

  @override
  List<Object?> get props => [characters];
}
