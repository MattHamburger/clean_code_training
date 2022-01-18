import 'package:clean_framework/clean_framework_providers.dart';

class AgeCalculatorEntity extends Entity {
  final String userName;
  final String userAge;

  AgeCalculatorEntity({this.userName = '', this.userAge = ''});

  @override
  List<Object?> get props => [userAge];

  AgeCalculatorEntity merge({
    String? userName,
    String? userAge,
  }) =>
      AgeCalculatorEntity(
          userName: userName ?? this.userName,
          userAge: userAge ?? this.userAge);
}
