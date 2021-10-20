import 'package:clean_code_training/features/feature_two/domain/feature_two_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureTwoUseCase extends UseCase<FeatureTwoEntity> {
  FeatureTwoUseCase()
      : super(
          entity: FeatureTwoEntity(),
          outputFilters: {
            FeatureTwoUIOutput: (entity) => FeatureTwoUIOutput(),
          },
        );
}

class FeatureTwoUIOutput extends Output {
  @override
  List<Object?> get props => [];
}
