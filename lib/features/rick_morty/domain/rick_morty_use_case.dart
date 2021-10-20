import 'package:clean_code_training/features/rick_morty/domain/rick_morty_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class RickMortyUseCase extends UseCase<RickMortyEntity> {
  
  RickMortyUseCase() : super(entity: RickMortyEntity(), outputFilters: { RickMortyUIOutput: (entity) => RickMortyUIOutput()});
}

class RickMortyUIOutput extends Output {
  @override
  List<Object?> get props => [];
}
