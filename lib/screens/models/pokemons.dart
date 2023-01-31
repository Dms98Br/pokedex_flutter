// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:pokedex/screens/models/pokemonEvolution.dart';

class Pokemons {
  String id;
  String name;
  String type;
  String image;
  String abilities;
  Pokemons({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.abilities,
  });

  Pokemons copyWith({
    String? id,
    String? name,
    String? type,
    String? image,
    String? abilities,
  }) {
    return Pokemons(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      image: image ?? this.image,
      abilities: abilities ?? this.abilities,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'image': image,
      'abilities': abilities,
    };
  }

  factory Pokemons.fromMap(Map<String, dynamic> map) {
    return Pokemons(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      image: map['image'] as String,
      abilities: map['abilities'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemons.fromJson(String source) =>
      Pokemons.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pokemons(id: $id, name: $name, type: $type, image: $image, abilities: $abilities)';
  }

  @override
  bool operator ==(covariant Pokemons other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.image == image &&
        other.abilities == abilities;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        type.hashCode ^
        image.hashCode ^
        abilities.hashCode;
  }
}
