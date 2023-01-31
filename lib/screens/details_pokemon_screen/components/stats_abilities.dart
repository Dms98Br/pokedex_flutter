import 'package:flutter/material.dart';
import 'package:pokedex/screens/details_pokemon_screen/components/abilities.dart';

import 'package:pokedex/themes/theme_color.dart';

import 'base_state.dart';

class StatsAbilitiesTab extends StatelessWidget {
  const StatsAbilitiesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.tabColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              BaseState(),
              SizedBox(
                height: 4,
              ),
              Abilities()
            ],
          ),
        ),
      ),
    );
  }
}
