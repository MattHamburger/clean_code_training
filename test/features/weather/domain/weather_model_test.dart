import 'package:clean_code_training/features/weather/domain/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherModel tests ::', () {
    test('equity test', () {
      final model = WeatherModel(cityName: 'San Jose', currentTemp: 190.00);

      expect(model.toString(),
          equals('WeatherModel{cityName: San Jose, cityName: 190.0}'));
    });
  });
}
