import 'package:clean_code_training/features/feature_four/domain/feature_four_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureFourUseCase extends UseCase<FeatureFourEntity> {
  FeatureFourUseCase()
      : super(
          entity: FeatureFourEntity(),
          outputFilters: {
            FeatureFourUIOutput: (entity) => FeatureFourUIOutput(),
          },
        );
}

class FeatureFourUIOutput extends Output {
  @override
  List<Object?> get props => [];
}
