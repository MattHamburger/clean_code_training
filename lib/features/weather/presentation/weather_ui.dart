import 'package:clean_code_training/features/weather/domain/weather_view_model.dart';
import 'package:clean_code_training/features/weather/presentation/weather_presenter.dart';
import 'package:clean_framework/clean_framework_providers.dart';
import 'package:flutter/material.dart';

class WeatherUI extends UI<WeatherViewModel> {
  WeatherUI({Key? key}) : super(key: key);

  final editingController = TextEditingController();

  @override
  Presenter<ViewModel, Output, UseCase<Entity>> create(
    PresenterBuilder<WeatherViewModel> builder,
  ) {
    return WeatherPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, WeatherViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Things'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: TextField(
                    controller: editingController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a city',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search_sharp),
                  onPressed: () {
                    viewModel.fetchWeather(cityName: editingController.text);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          for (final vm in viewModel.weatherList)
            WeatherCard(
              vm: vm,
            ),
        ],
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key, required this.vm}) : super(key: key);

  final SingleWeatherViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(vm.cityName),
        ),
        Center(
          child: Text(
            '${vm.currentTemp}',
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text('feels like ${vm.currentTemp}'),
        ),
      ],
    );
  }
}
