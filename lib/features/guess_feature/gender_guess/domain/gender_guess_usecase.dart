import 'package:clean_code_training/features/guess_feature/gender_guess/domain/gender_guess_entity.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class GenderGuessUseCase extends UseCase<GenderGuessEntity> {
  GenderGuessUseCase()
      : super(entity: GenderGuessEntity(), outputFilters: {
          GenderGuessUIOutput: (GenderGuessEntity entity) =>
              GenderGuessUIOutput(userGender: entity.userGender)
        });

  Future<void> onGenderLoad() async {
    entity = entity.merge(userGender: 'male');
  }

  Future<void> onGenderChange(String gender) async {
    entity = entity.merge(userGender: gender);
  }
}

class GenderGuessUIOutput extends Output {
  final String userGender;

  GenderGuessUIOutput({required this.userGender});

  @override
  List<Object?> get props => [userGender];
}
