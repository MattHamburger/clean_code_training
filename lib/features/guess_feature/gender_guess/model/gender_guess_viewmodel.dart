import 'package:clean_framework/clean_framework_providers.dart';

class GenderViewModel extends ViewModel{
  final String userGender;

  GenderViewModel({required this.userGender});

  @override

  List<Object?> get props => [userGender];

}