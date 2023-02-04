// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pokedex/models/pokemon_stats.dart';

class Pokemons {
  String id;
  String name;
  List type;
  String image;
  String imageShiny;
  List color;
  List abilities;
  PokemonStats stats;
  List evolutions;
  Pokemons(
      {required this.id,
      required this.name,
      required this.type,
      required this.image,
      required this.imageShiny,
      required this.color,
      required this.abilities,
      required this.evolutions,
      required this.stats});

  Pokemons copyWith({
    String? id,
    String? name,
    List? type,
    String? image,
    String? imageShiny,
    List? color,
    List? abilities,
    PokemonStats? stats,
    List? evolutions,
  }) {
    return Pokemons(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      image: image ?? this.image,
      imageShiny: imageShiny ?? this.imageShiny,
      color: color ?? this.color,
      abilities: abilities ?? this.abilities,
      stats: stats ?? this.stats,
      evolutions: evolutions ?? this.evolutions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'image': image,
      'imageShiny': imageShiny,
      'color': color,
      'abilities': abilities,
      'stats': stats,
      'evolutions': evolutions,
    };
  }

  factory Pokemons.fromMap(Map<String, dynamic> map) {
    return Pokemons(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'],
      image: map['image'] as String,
      imageShiny: map['imageShiny'] as String,
      color: map['color'],
      abilities: map['abilities'],
      stats: map['stats'],
      evolutions: map['evolutions'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemons.fromJson(String source) =>
      Pokemons.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pokemons(id: $id, name: $name, type: $type, image: $image, imageShiny: $imageShiny, color: $color, abilities: $abilities, evolutions: $evolutions)';
  }

  @override
  bool operator ==(covariant Pokemons other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.type, type) &&
        other.image == image &&
        other.imageShiny == imageShiny &&
        listEquals(other.color, color) &&
        listEquals(other.abilities, abilities) &&
        listEquals(other.evolutions, evolutions);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        image.hashCode ^
        imageShiny.hashCode ^
        color.hashCode ^
        abilities.hashCode ^
        evolutions.hashCode;
  }
}
