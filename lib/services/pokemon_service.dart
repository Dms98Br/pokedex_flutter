import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/helpers/generateColors.dart';
import 'package:pokedex/data/pokemonsList.dart';
import 'package:pokedex/screens/models/pokemons.dart';

class PokemonService {
  Future<List<Pokemons>> getAll() async {
    List<Pokemons> list = [];
    for (var pokemon in pokemonsList) {
      final color =
          await generateColor().getColorImage(image: pokemon['image']);
      pokemon['color'].add(color);

      list.add(Pokemons.fromMap(pokemon));
    }
    return list;
  }
}
