import 'package:clean_code_training/features/feature_one/domain/feature_one_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class FeatureOneUseCase extends UseCase<FeatureOneEntity> {
  FeatureOneUseCase()
      : super(
          entity: FeatureOneEntity(),
          outputFilters: {
            FeatureOneUIOutput: (entity) => FeatureOneUIOutput(),
          },
        );
}

class FeatureOneUIOutput extends Output {
  @override
  List<Object?> get props => [];
}
