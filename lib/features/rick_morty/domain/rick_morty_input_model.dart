import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyCharacterInputModel extends Input {
  RickMortyCharacterInputModel(
      {required this.name,
      required this.status,
      required this.species,
      required this.gender});

  final String name;
  final String status;
  final String species;
  final String gender;

  @override
  List<Object?> get props => [name, status, species, gender];
}
