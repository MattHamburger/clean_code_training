import 'package:clean_framework/clean_framework_providers.dart';

class AgeCalculatorEntity extends Entity {
  final String userName;
  final int userAge;

  AgeCalculatorEntity({this.userName = '', this.userAge = 0});

  @override
  List<Object?> get props => [userAge];

  AgeCalculatorEntity merge({
    String? userName,
    int? userAge,
  }) =>
      AgeCalculatorEntity(
        userName: userName ?? this.userName,
        userAge: userAge ?? this.userAge,
      );
}
