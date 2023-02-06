import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_type.dart';
import 'package:pokedex/models/pokemon_evolution.dart';
import 'package:pokedex/themes/theme_color.dart';

import '../../../../helpers/fisrtLetterCapitalizes.dart';

class EvolutionTab extends StatelessWidget {
  final List evolutionsPokemons;
  const EvolutionTab({super.key, required this.evolutionsPokemons});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.tabColor,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: evolutionsPokemons.length,
              itemBuilder: (BuildContext context, int index) {
                PokemonEvolution pokemon =
                    evolutionsPokemons[index] as PokemonEvolution;
                return Card(
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text(
                            fisrtLetterCapitalizes(pokemon.name),
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 35,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  PokemonType(
                                    typeArray: pokemon.type,
                                    typeScroll: Axis.horizontal,
                                  ),
                                ],
                              )),
                          pokemon.image.contains('http')
                              ? Image.network(
                                  pokemon.image,
                                  width: 300,
                                  height: 300,
                                )
                              : Image.asset(
                                  pokemon.image,
                                  width: 300,
                                  height: 300,
                                ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
