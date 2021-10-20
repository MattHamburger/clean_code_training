import 'package:clean_code_training/features/weather/presentation/weather_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class WeatherPresenter extends Presenter<WeatherViewModel,Output,UseCase>{

  WeatherPresenter({required PresenterBuilder<WeatherViewModel> builder}) :
        super(builder:builder, provider: weatherUseCaseProvider);

  @override
  WeatherViewModel createViewModel(UseCase useCase, Output output) {
    return WeatherViewModel(
      isLoading: false,
      cityName: "Aluva",
      countryName: "IN",
      currentTemperature: "28 °C",
      currentTemperatureDescription: "Haze",
      currentHumidity: "74"
    );
  }



}