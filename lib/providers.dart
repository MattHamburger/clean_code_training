import 'package:clean_code_training/features/feature_four/domain/feature_four_entity.dart';
import 'package:clean_code_training/features/feature_four/domain/feature_four_use_case.dart';
import 'package:clean_code_training/features/feature_one/domain/feature_one_entity.dart';
import 'package:clean_code_training/features/feature_one/domain/feature_one_use_case.dart';
import 'package:clean_code_training/features/feature_three/domain/feature_three_entity.dart';
import 'package:clean_code_training/features/feature_three/domain/feature_three_use_case.dart';
import 'package:clean_code_training/features/feature_two/domain/feature_two_entity.dart';
import 'package:clean_code_training/features/feature_two/domain/feature_two_use_case.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_entity.dart';
import 'package:clean_code_training/features/pokemon/domain/pokemon_use_case.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_providers.dart';

ProvidersContext _providersContext = ProvidersContext();

ProvidersContext get providersContext => _providersContext;

final featureOneUseCaseProvider =
    UseCaseProvider<FeatureOneEntity, FeatureOneUseCase>(
  (_) => FeatureOneUseCase(),
);

final featureTwoUseCaseProvider =
    UseCaseProvider<FeatureTwoEntity, FeatureTwoUseCase>(
  (_) => FeatureTwoUseCase(),
);

final featureThreeUseCaseProvider =
    UseCaseProvider<FeatureThreeEntity, FeatureThreeUseCase>(
  (_) => FeatureThreeUseCase(),
);

final featureFourUseCaseProvider =
    UseCaseProvider<FeatureFourEntity, FeatureFourUseCase>(
  (_) => FeatureFourUseCase(),
);

final pokemonUseCaseProvider =
    UseCaseProvider<PokemonEntity, PokemonUseCase>(
  (_) => PokemonUseCase(),
);
