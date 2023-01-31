import 'package:flutter/material.dart';
import 'package:pokedex/components/pokemon_type.dart';
import 'package:pokedex/data/pokemonsList.dart';
import 'package:pokedex/screens/models/pokemonEvolution.dart';
import 'package:pokedex/themes/theme_color.dart';

import '../../../helpers/fisrtLetterCapitalizes.dart';

class EvolutionTab extends StatelessWidget {
  const EvolutionTab({super.key});
  @override
  Widget build(BuildContext context) {
    print(pokemonsList[0]['evolution'].length);
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
              scrollDirection: Axis.horizontal,
              itemCount: pokemonsList[0]['evolution'].length,
              itemBuilder: (BuildContext context, int index) => Card(
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Text(
                          fisrtLetterCapitalizes(
                              pokemonsList[0]['evolution'][index]['name']),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        PokemonType(
                          typeText: pokemonsList[0]['evolution'][index]['type'],
                        ),
                        Image.asset(
                          pokemonsList[0]['evolution'][index]['image'],
                          width: 300,
                          height: 300,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
