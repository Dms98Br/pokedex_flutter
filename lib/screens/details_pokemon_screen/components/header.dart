// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';

import '../../../components/pokemon_type.dart';
import '../../../helpers/generateColors.dart';

class HeaderDetails extends StatelessWidget {
  final int idPokemon;
  final String namePokemon;
  final String imagePokemon;
  final List typePokemon;
  final Color color;
  const HeaderDetails({
    Key? key,
    required this.idPokemon,
    required this.namePokemon,
    required this.imagePokemon,
    required this.typePokemon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imagePokemon,
                  width: 150,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "#$idPokemon",
                        style: TextStyle(
                            color: generateColor().colorLightOrDark(color)
                                ? Colors.black54
                                : Colors.white54,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        fisrtLetterCapitalizes(namePokemon),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: generateColor().colorLightOrDark(color)
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 100,
                        child: PokemonType(
                          typeArray: typePokemon,
                          typeScroll: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
