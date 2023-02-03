// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonEvolution {
  String id;
  String name;
  String type;
  String image;
  PokemonEvolution({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
  });

  PokemonEvolution copyWith({
    String? id,
    String? name,
    String? type,
    String? image,
  }) {
    return PokemonEvolution(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'type': type,
      'image': image,
    };
  }

  factory PokemonEvolution.fromMap(Map<String, dynamic> map) {
    return PokemonEvolution(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonEvolution.fromJson(String source) =>
      PokemonEvolution.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonEvolution(id: $id, name: $name, type: $type, image: $image)';
  }

  @override
  bool operator ==(covariant PokemonEvolution other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.type == type &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ type.hashCode ^ image.hashCode;
  }
}
