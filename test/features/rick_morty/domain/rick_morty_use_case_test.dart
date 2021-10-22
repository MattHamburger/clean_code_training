import 'package:clean_code_training/features/rick_morty/domain/rick_morty_entity.dart';
import 'package:clean_code_training/features/rick_morty/domain/rick_morty_use_case.dart';
import 'package:clean_code_training/features/rick_morty/presentation/rick_morty_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RickMortyUseCase getCharacters() {
    return rickMortyUseCaseProvider.getUseCaseFromContext(providersContext);
  }

  setUp(() {
    resetProvidersContext();
    graphQLExternalInterface.getExternalInterface(providersContext);
  });

  group('RickMortyUsecase Tests', () {
    test('fetch characters successfully', () async {
      final usecase = getCharacters();

      expect(usecase.entity,
          RickMortyEntity(isLoading: false, characters: const []));

      expectLater(
          usecase.stream,
          emitsInOrder([
            RickMortyEntity(isLoading: true),
            isA<RickMortyEntity>()
                .having((e) => e.isLoading, 'isLoading', isFalse)
                .having(
                    (e) => e.characters,
                    'characters',
                    isA<List<SingleCharacterViewModel>>().having(
                        (characters) => characters[0].name,
                        '0th character name',
                        'Rick Sanchez'))
          ]));

      await usecase.fetch();
      usecase.dispose();
    });
  });
}
