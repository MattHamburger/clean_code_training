import 'package:clean_code_training/features/weather/domain/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("weather entity test", () async{

    WeatherEntity weatherEntity =  WeatherEntity(
        isLoading: false,
        cityName:  "Aluva",
        countryName:  "IN",
        currentTemperature: 301.15,
        currentTemperatureDescription: "Haze",
        currentHumidity: "74");

    expect(weatherEntity.props,[ false, "Aluva", "IN", 301.15, "Haze", "74"]);

    weatherEntity = weatherEntity.merge();
    expect(weatherEntity.isLoading, false);
    expect(weatherEntity.cityName, "Aluva");


  });
}