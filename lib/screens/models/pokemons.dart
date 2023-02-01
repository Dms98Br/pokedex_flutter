// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Pokemons {
  String id;
  String name;
  List type;
  String image;
  List color;
  List abilities;
  List evolutions;
  Pokemons({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.color,
    required this.abilities,
    required this.evolutions,
  });

  Pokemons copyWith({
    String? id,
    String? name,
    List? type,
    String? image,
    List? color,
    List? abilities,
    List? evolutions,
  }) {
    return Pokemons(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      image: image ?? this.image,
      color: color ?? this.color,
      abilities: abilities ?? this.abilities,
      evolutions: evolutions ?? this.evolutions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'image': image,
      'color': color,
      'abilities': abilities,
      'evolutions': evolutions,
    };
  }

  factory Pokemons.fromMap(Map<String, dynamic> map) {
    return Pokemons(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'],
      image: map['image'] as String,
      color: map['color'],
      abilities: map['abilities'],
      evolutions: map['evolutions'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemons.fromJson(String source) =>
      Pokemons.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pokemons(id: $id, name: $name, type: $type, image: $image, color: $color, abilities: $abilities, evolutions: $evolutions)';
  }

  @override
  bool operator ==(covariant Pokemons other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        listEquals(other.type, type) &&
        other.image == image &&
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
        color.hashCode ^
        abilities.hashCode ^
        evolutions.hashCode;
  }
}
