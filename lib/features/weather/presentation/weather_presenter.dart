import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_code_training/features/weather/presentation/weather_view_model.dart';
import 'package:clean_code_training/providers.dart';
import 'package:clean_framework/clean_framework_providers.dart';

class WeatherPresenter extends Presenter<WeatherViewModel,WeatherUIOutput,WeatherUseCase>{

  WeatherPresenter({required PresenterBuilder<WeatherViewModel> builder}) :
        super(builder:builder, provider: weatherUseCaseProvider);

  @override
  WeatherViewModel createViewModel(WeatherUseCase useCase, WeatherUIOutput output) {
    return WeatherViewModel(
      isLoading: output.isLoading,
      cityName: output.cityName,
      countryName: output.countryName,
      currentTemperature: '${(-273.15+output.currentTemperature).ceil()} °C',
      currentTemperatureDescription: output.currentTemperatureDescription,
      currentHumidity: output.currentHumidity,
      searchWeather: useCase.searchWeather
    );
  }

}

