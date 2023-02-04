// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonStats {
  int hp;
  int attack;
  int defense;
  int speed;
  int specialAttack;
  int specialDefense;
  PokemonStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.speed,
    required this.specialAttack,
    required this.specialDefense,
  });

  PokemonStats copyWith({
    int? hp,
    int? attack,
    int? defense,
    int? speed,
    int? specialAttack,
    int? specialDefense,
  }) {
    return PokemonStats(
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      speed: speed ?? this.speed,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'speed': speed,
      'specialAttack': specialAttack,
      'specialDefense': specialDefense,
    };
  }

  factory PokemonStats.fromMap(Map<String, dynamic> map) {
    return PokemonStats(
      hp: map['hp'] as int,
      attack: map['attack'] as int,
      defense: map['defense'] as int,
      speed: map['speed'] as int,
      specialAttack: map['specialAttack'] as int,
      specialDefense: map['specialDefense'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonStats.fromJson(String source) =>
      PokemonStats.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonStats(hp: $hp, attack: $attack, defense: $defense, speed: $speed, specialAttack: $specialAttack, specialDefense: $specialDefense)';
  }

  @override
  bool operator ==(covariant PokemonStats other) {
    if (identical(this, other)) return true;

    return other.hp == hp &&
        other.attack == attack &&
        other.defense == defense &&
        other.speed == speed &&
        other.specialAttack == specialAttack &&
        other.specialDefense == specialDefense;
  }

  @override
  int get hashCode {
    return hp.hashCode ^
        attack.hashCode ^
        defense.hashCode ^
        speed.hashCode ^
        specialAttack.hashCode ^
        specialDefense.hashCode;
  }
}
