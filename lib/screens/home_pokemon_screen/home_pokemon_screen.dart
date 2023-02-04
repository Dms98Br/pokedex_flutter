import 'package:flutter/material.dart';
import 'package:pokedex/components/appBar.dart';
import 'package:pokedex/components/hamburger_menu.dart';
import 'package:pokedex/components/page_default.dart';
import 'package:pokedex/components/pokemon_type.dart';
import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';
import 'package:pokedex/screens/home_pokemon_screen/components/pokemon_card.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:pokedex/themes/theme_color.dart';

import '../../components/loading_screen.dart';
import '../../helpers/generateColors.dart';

class HomePokemonScreen extends StatefulWidget {
  const HomePokemonScreen({super.key});

  @override
  State<HomePokemonScreen> createState() => _HomePokemonScreenState();
}

class _HomePokemonScreenState extends State<HomePokemonScreen> {
  List database = [];
  @override
  void initState() {
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(55.0),
        child: AppBarComponent(),
      ),
      drawer: const HamburgerMenu(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ThemeColors.backgroudColor1, ThemeColors.backgroudColor2],
          ),
        ),
        child: database.isEmpty
            ? const LoadingScreen(
                color: Colors.black,
              )
            : ListView.builder(
                itemCount: database.length,
                itemBuilder: (context, i) {
                  final Pokemons pokemon = database[i] as Pokemons;

                  return PokemonCards(pokemon: pokemon);
                },
              ),
      ),
    );
  }

  void refresh() async {
    final testePokemon = await PokemonService().getAll();
    setState(() {
      database = testePokemon;
    });
  }
}
