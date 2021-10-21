import 'package:clean_code_training/features/rick_morty/domain/rick_morty_input_model.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyEntity extends Entity {
  final bool isLoading;
  final List<RickMortyCharacterInputModel> characters;

  RickMortyEntity({this.isLoading = false, this.characters = const []});

  @override
  List<Object?> get props => [isLoading, characters];
}
