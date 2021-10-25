import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_code_training/features/weather/presentation/weather_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  test("weather view model test", () async{

    WeatherViewModel weatherViewModel =  WeatherViewModel(
        isLoading: false,
        cityName:  "Aluva",
        countryName:  "IN",
        currentTemperature: "28 °C",
        currentTemperatureDescription: "Haze",
        currentHumidity: "74", searchWeather: WeatherUseCase().searchWeather);

    expect(weatherViewModel.props,[ false, "Aluva", "IN", "28 °C", "Haze", "74"]);

  });
}
