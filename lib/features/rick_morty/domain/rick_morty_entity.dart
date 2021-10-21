import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyEntity extends Entity {
  
  final bool isLoading;
  final String name;
  final String status;
  final String species;
  final String gender;

  RickMortyEntity(
      {this.isLoading = false,
      this.name = "",
      this.status = "",
      this.species = "",
      this.gender = ""});

  @override
  List<Object?> get props => [isLoading, name, status, species, gender];
}
