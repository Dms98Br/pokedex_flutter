import 'package:flutter/material.dart';
import 'package:pokedex/screens/details_pokemon_screen/components/tab/abilities.dart';
import 'package:pokedex/screens/models/pokemon_stats.dart';

import 'package:pokedex/themes/theme_color.dart';

import '../tab/base_stats.dart';

class StatsAbilitiesTab extends StatelessWidget {
  final Color color;
  final List abilities;
  final PokemonStats stats;
  const StatsAbilitiesTab(
      {super.key,
      required this.color,
      required this.abilities,
      required this.stats});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.tabColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseStats(
                color: color,
                stats: stats,
              ),
              const SizedBox(
                height: 4,
              ),
              Abilities(
                abilities: abilities,
                color: color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
