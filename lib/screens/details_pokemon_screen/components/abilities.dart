import 'package:flutter/material.dart';

import 'abilities_types.dart';

class Abilities extends StatelessWidget {
  final List abilities;
  final Color color;
  const Abilities({super.key, required this.abilities, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Abilities",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: AbilitiesType(
              typeArray: abilities,
              typeScroll: Axis.horizontal,
              colorPokemon: color),
        )
      ],
    );
  }
}
