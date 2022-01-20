import 'package:clean_framework/clean_framework_providers.dart';

class GenderGuessEntity extends Entity {
final String userGender;

  GenderGuessEntity(
      {this.userGender=''});

  @override
  List<Object?> get props => [userGender];

  GenderGuessEntity merge(
      {String?userGender}) =>
      GenderGuessEntity(
      userGender: userGender??this.userGender);
}
