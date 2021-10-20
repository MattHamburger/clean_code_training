import 'package:clean_code_training/features/weather/presentation/weather_ui.dart';
import 'package:clean_framework/clean_framework_tests.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WeatherUI initial load should show some default data',
      (WidgetTester tester) async {
    await ProviderTester().pumpWidget(
      tester,
      MaterialApp(
        home: WeatherUI(
          create: (builder) => MockWeatherPresenter(builder: builder),
        ),
      ),
    );

    expect(find.text('Haze'), findsOneWidget);
    expect(find.text('28 °C'), findsOneWidget);

   });
}
