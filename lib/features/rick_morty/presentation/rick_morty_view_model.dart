import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyViewModel extends ViewModel {
  RickMortyViewModel({required this.isLoading, required this.characters});

  final bool isLoading;
  final List<SingleCharacterViewModel> characters;

  @override
  List<Object?> get props => [isLoading, characters];
}

class SingleCharacterViewModel extends ViewModel {
  SingleCharacterViewModel(
      {this.name = '',
      this.status = '',
      this.species = '',
      this.gender = ''});

  final String name;
  final String status;
  final String species;
  final String gender;

  @override
  List<Object?> get props => [name, status, species, gender];
}
