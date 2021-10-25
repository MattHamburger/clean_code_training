import 'package:flutter/material.dart';

class SearchWeatherView extends StatelessWidget {

  final bool isLoading;
  final Function(String) onPlaceNameSubmitted;
  TextEditingController? controller =  TextEditingController();

  SearchWeatherView({Key? key, required this.isLoading, required this.onPlaceNameSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(20) ,height: 60,
      child: TextField(
          key: const Key('searchplacefield'),
          controller: controller,
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w300),
          onSubmitted: (value){ if(value.isNotEmpty) onPlaceNameSubmitted(value); },
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left : 15,top: 15),
                hintText: "Enter place name",
                hintStyle: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black54),
                border: const OutlineInputBorder(),
                prefix: isLoading ? const CircularProgressIndicator(): const Padding(
                  padding: EdgeInsets.only(right:8.0, top: 3),
                  child:  Icon(Icons.search,color: Colors.black54,),
                ) ,)
              ),
    );
  }
}
