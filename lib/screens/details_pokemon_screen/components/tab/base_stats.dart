import 'package:flutter/material.dart';
import 'package:pokedex/screens/models/pokemon_stats.dart';

import '../base_stats/base_stats_item.dart';

class BaseStats extends StatelessWidget {
  final Color color;
  final PokemonStats stats;

  const BaseStats({super.key, required this.color, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "Base stats",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BaseStateItem(
          color: color,
          name: "HP",
          value: stats.hp,
        ),
        BaseStateItem(
          color: color,
          name: "Attack",
          value: stats.attack,
        ),
        BaseStateItem(
          color: color,
          name: "Defense",
          value: stats.defense,
        ),
        BaseStateItem(
          color: color,
          name: "Special-attack",
          value: stats.specialAttack,
        ),
        BaseStateItem(
          color: color,
          name: "Special-defense",
          value: stats.specialDefense,
        ),
        BaseStateItem(
          color: color,
          name: "Speed",
          value: stats.speed,
        ),
      ],
    );
  }
}
