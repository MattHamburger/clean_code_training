import 'package:clean_framework/clean_framework_providers.dart';
class AgeCalculatorEntity extends Entity{
  final String userName;
  final String userAge;

  AgeCalculatorEntity({this.userName='', this.userAge='50'});


  @override
  List<Object?> get props => [userAge];

}