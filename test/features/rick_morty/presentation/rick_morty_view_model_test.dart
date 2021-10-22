import 'package:clean_code_training/features/rick_morty/presentation/rick_morty_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check Rick And Morty Model', () {
    RickMortyViewModel rickMortyViewModel =
        RickMortyViewModel(isLoading: true, characters: [
      SingleCharacterViewModel(
          name: 'Rick', species: 'Human', gender: 'Male', status: 'Alive')
    ]);

    expect(rickMortyViewModel.props, [
      true,
      [
        SingleCharacterViewModel(
            name: 'Rick', species: 'Human', gender: 'Male', status: 'Alive')
      ]
    ]);
  });
}
