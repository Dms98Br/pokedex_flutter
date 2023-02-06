import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemons.dart';

import '../../../components/pokemon_type.dart';
import '../../../helpers/fisrtLetterCapitalizes.dart';
import '../../../helpers/generateColors.dart';

class PokemonCards extends StatelessWidget {
  final Pokemons pokemon;
  const PokemonCards({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12, left: 12),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            "details",
            arguments: pokemon,
          );
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: pokemon.color.isNotEmpty
                ? pokemon.color[0]
                : const Color(0xFF404040),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#${pokemon.id}",
                      style: TextStyle(
                        color:
                            generateColor().colorLightOrDark(pokemon.color[0])
                                ? Colors.black54
                                : Colors.white54,
                      ),
                    ),
                    Text(
                      fisrtLetterCapitalizes(pokemon.name),
                      style: TextStyle(
                        color:
                            generateColor().colorLightOrDark(pokemon.color[0])
                                ? Colors.black
                                : Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: PokemonType(
                        typeArray: pokemon.type,
                        typeScroll: Axis.horizontal,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pokemon.image.toString().contains('http')
                        ? Image.network(
                            pokemon.image.toString(),
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                          )
                        : Image.asset(
                            pokemon.image.toString(),
                            alignment: Alignment.center,
                            width: 70,
                            height: 70,
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
