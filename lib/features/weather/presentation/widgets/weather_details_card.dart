import 'package:flutter/material.dart';

class WeatherDetailsCard extends StatelessWidget{

  const WeatherDetailsCard(
      {Key? key,
        required this.cityName,
        required this.countryName,
        required this.currentTemperature,
        required this.currentTemperatureDescription,
        required this.currentHumidity
      }) : super(key: key);

  final String cityName;
  final String countryName;
  final String currentTemperature;
  final String currentTemperatureDescription;
  final String currentHumidity;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(currentTemperatureDescription,  style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black54, fontSize: 25),),
        const SizedBox(height: 15,),
        Text(currentTemperature ,  style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black54,  fontSize: 40),),
        const SizedBox(height: 15,),
        Text("Country : $countryName" , style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black54,  fontSize: 18),),
        const SizedBox(height: 15,),
        Text("City : $cityName", style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black54, fontSize: 18),),
        const SizedBox(height: 15,),
        Text("Humidity : $currentHumidity",  style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black54, fontSize: 20),),
      ],
    );
  }

}