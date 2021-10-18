import 'package:clean_code_training/features/feature_three/domain/feature_three_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureThreeUseCase extends UseCase<FeatureThreeEntity> {
  FeatureThreeUseCase()
      : super(
          entity: FeatureThreeEntity(),
          outputFilters: {
            FeatureThreeUIOutput: (entity) => FeatureThreeUIOutput(),
          },
        );
}

class FeatureThreeUIOutput extends Output {
  @override
  List<Object?> get props => [];
}
