import 'package:clean_code_training/features/weather/domain/weather_use_case.dart';
import 'package:clean_code_training/features/weather/presentation/weather_presenter.dart';
import 'package:clean_code_training/features/weather/presentation/weather_ui.dart';
import 'package:clean_code_training/features/weather/presentation/weather_view_model.dart';
import 'package:clean_code_training/features/weather/presentation/widgets/search_weather_view.dart';
import 'package:clean_framework/clean_framework_providers.dart';
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
    expect(find.text('City : Aluva'), findsOneWidget);
    expect(find.text('Country : IN'), findsOneWidget);
    expect(find.text('Humidity : 74'), findsOneWidget);
  });

  testWidgets(
      'User will be able to enter the place name to perform a search operation',
      (WidgetTester tester) async {
    String? value;

    await ProviderTester().pumpWidget(
      tester,
      MaterialApp(
        home: Material(
          child: SearchWeatherView(
            isLoading: false,
            onPlaceNameSubmitted: (placeName) {
              value = placeName;
            },
          ),
        ),
      ),
    );

    expect(value, isNull);
    final placeTextFieldFinder = find.byKey(const Key('searchplacefield'));
    await tester.tap(placeTextFieldFinder);
    await tester.enterText(placeTextFieldFinder, 'Los Angeles');

    TextField searchField = tester.widget(find.byKey(const Key('searchplacefield')));
    searchField.onSubmitted!(searchField.controller!.value.text);

    await tester.pump(const Duration(seconds: 3));
    expect(value, equals("Los Angeles"));

  });


  testWidgets('WeatherUI presenter initialization test test',
          (WidgetTester tester) async {

        await ProviderTester().pumpWidget(
          tester,
          MaterialApp(
            home: WeatherUI(),
          ),
        );

        expect(find.text('Haze'), findsOneWidget);
        expect(find.text('28 °C'), findsOneWidget);
        expect(find.text('City : Aluva'), findsOneWidget);
        expect(find.text('Country : IN'), findsOneWidget);
        expect(find.text('Humidity : 74'), findsOneWidget);

      });

  testWidgets('WeatherUI onPlaceNameSubmitted callback test',
          (WidgetTester tester) async {

        await ProviderTester().pumpWidget(
          tester,
          MaterialApp(
            home: WeatherUI(
              create: (builder) => MockWeatherPresenter(builder: builder),
            ),
          ),
        );

        final placeTextFieldFinder = find.byKey(const Key('searchplacefield'));
        await tester.tap(placeTextFieldFinder);
        await tester.enterText(placeTextFieldFinder, 'Los Angeles');

        TextField searchField = tester.widget(find.byKey(const Key('searchplacefield')));
        searchField.onSubmitted!(searchField.controller!.value.text);

        await tester.pump(const Duration(seconds: 3));
        expect(MockWeatherPresenter.searchPlaceName, equals("Los Angeles"));

      });

}


class MockWeatherPresenter extends WeatherPresenter {
  MockWeatherPresenter({required PresenterBuilder<WeatherViewModel> builder})
      : super(builder: builder);

  static String searchPlaceName = '';

  @override
  WeatherViewModel createViewModel(WeatherUseCase useCase, WeatherUIOutput output) {
    return WeatherViewModel(
        isLoading: output.isLoading,
        cityName: output.cityName,
        countryName: output.countryName,
        currentTemperature: '${(-273.15+output.currentTemperature)} °C',
        currentTemperatureDescription: output.currentTemperatureDescription,
        currentHumidity: output.currentHumidity,
        searchWeather: (placeName){
          searchPlaceName = placeName;
      }
    );
  }

  @override
  WeatherUIOutput subscribe(_) =>
      WeatherUIOutput(
          isLoading: false,
          cityName: "Aluva",
          countryName: "IN",
          currentTemperature: 301.15,
          currentTemperatureDescription: "Haze",
          currentHumidity: "74"
      );
}
