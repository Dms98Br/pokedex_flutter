import 'package:pokedex/helpers/generateColors.dart';
import 'package:pokedex/data/pokemonsList.dart';
import 'package:pokedex/screens/models/pokemons.dart';

import '../screens/models/pokemon_stats.dart';

class PokemonService {
  Future<List<Pokemons>> getAll() async {
    List<Pokemons> list = [];
    for (var pokemon in pokemonsList) {
      final color =
          await generateColor().getColorImage(image: pokemon['image']);
      pokemon['color'].add(color);
      pokemon['stats'] = PokemonStats(
        hp: pokemon['stats']['hp'],
        attack: pokemon['stats']['attack'],
        defense: pokemon['stats']['defense'],
        speed: pokemon['stats']['speed'],
        specialAttack: pokemon['stats']['specialAttack'],
        specialDefense: pokemon['stats']['specialDefense'],
      );

      list.add(Pokemons.fromMap(pokemon));
    }
    return list;
  }
}
