// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';
import 'package:pokedex/themes/theme_color.dart';

class PokemonType extends StatelessWidget {
  final typeText;
  const PokemonType({super.key, required this.typeText});

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      label: Text(
        fisrtLetterCapitalizes(typeText),
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: ThemeColors.typeColorPokemons[typeText.toLowerCase()],
    );
  }
}
