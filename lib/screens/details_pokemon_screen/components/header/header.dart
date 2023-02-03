// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';

import '../../../../components/pokemon_type.dart';
import '../../../../helpers/generateColors.dart';

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
      height: MediaQuery.of(context).size.height / 3.5,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePokemon,
            width: 150,
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                child: PokemonType(
                  typeArray: typePokemon,
                  typeScroll: Axis.horizontal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
