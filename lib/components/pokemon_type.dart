// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';
import 'package:pokedex/themes/theme_color.dart';

class PokemonType extends StatelessWidget {
  final List typeArray;
  const PokemonType({super.key, required this.typeArray});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: typeArray.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) {
        return Chip(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          padding: EdgeInsets.all(1),
          label: Text(
            fisrtLetterCapitalizes(typeArray[i]),
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor:
              ThemeColors.typeColorPokemons[typeArray[i].toLowerCase()],
        );
      },
    );
  }
}
