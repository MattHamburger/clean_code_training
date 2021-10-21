import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyViewModel extends ViewModel {
  
  RickMortyViewModel(
      {required this.isLoading,
      required this.name,
      required this.status,
      required this.species,
      required this.gender});

  final bool isLoading;
  final String name;
  final String status;
  final String species;
  final String gender;

  @override
  List<Object?> get props => [isLoading, name, status, species, gender];
}
