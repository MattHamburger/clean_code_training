import 'package:clean_framework/clean_framework_providers.dart';

class PokemonModel extends Entity {
  PokemonModel({
    required this.image,
    required this.number,
    required this.name,
    required this.classification
  });

  final String image;
  final String number;
  final String name;
  final String classification;

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      image: json['image'] ?? '',
      number: json['number'] ?? '',
      name: json['name'] ?? '',
      classification: json['classification'] ?? '',
    );
  }

  @override
  List<Object?> get props => [image, number, name, classification];
}
