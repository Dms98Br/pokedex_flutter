// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';

import '../../../helpers/generateColors.dart';

class AbilitiesType extends StatelessWidget {
  final List typeArray;
  final Axis typeScroll;
  final Color colorPokemon;
  const AbilitiesType(
      {super.key,
      required this.typeArray,
      required this.typeScroll,
      required this.colorPokemon});

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
              style: TextStyle(
                  color: generateColor().colorLightOrDark(colorPokemon)
                      ? Colors.black54
                      : Colors.white54),
            ),
            backgroundColor: colorPokemon,
          ),
        );
      },
    );
  }
}
