// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';
import 'package:pokedex/themes/theme_color.dart';

class PokemonType extends StatelessWidget {
  final List typeArray;
  final Axis typeScroll;
  const PokemonType(
      {super.key, required this.typeArray, required this.typeScroll});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: typeArray.length,
      shrinkWrap: true,
      scrollDirection: typeScroll,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Chip(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            padding: const EdgeInsets.all(1),
            label: Text(
              fisrtLetterCapitalizes(typeArray[i]),
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor:
                ThemeColors.typeColorPokemons[typeArray[i].toLowerCase()],
          ),
        );
      },
    );
  }
}
