import 'package:clean_code_training/features/weather/domain/weather_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherViewModel tests ::', () {
    test('equity test', () {
      Future<void> fetchWeather({
        required String cityName,
        bool? isRefresh,
      }) async {}
      final model = WeatherViewModel(
        fetchWeather: fetchWeather,
      );

      expect(
          model.props,
          equals([
            false,
            [],
            fetchWeather,
          ]));
    });
  });

  group('SingleWeatherViewModel tests ::', () {
    test('equity test', () {
      final model = SingleWeatherViewModel(
        cityName: 'San Jose',
        currentTemp: 190.00,
      );

      expect(
          model.props,
          equals([
            'San Jose',
            190.00,
          ]));
    });
  });
}
