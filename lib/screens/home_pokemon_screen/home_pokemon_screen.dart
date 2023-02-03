import 'package:flutter/material.dart';
import 'package:pokedex/components/appBar.dart';
import 'package:pokedex/components/hamburger_menu.dart';
import 'package:pokedex/components/page_default.dart';
import 'package:pokedex/components/pokemon_type.dart';
import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';
import 'package:pokedex/screens/models/pokemons.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:pokedex/themes/theme_color.dart';

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
        child: ListView.builder(
          itemCount: database.length,
          itemBuilder: (context, i) {
            final Pokemons pokemon = database[i] as Pokemons;

            return Padding(
              padding:
                  const EdgeInsets.only(top: 6, bottom: 6, right: 12, left: 12),
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
                                color: generateColor()
                                        .colorLightOrDark(pokemon.color[0])
                                    ? Colors.black54
                                    : Colors.white54,
                              ),
                            ),
                            Text(
                              fisrtLetterCapitalizes(pokemon.name),
                              style: TextStyle(
                                color: generateColor()
                                        .colorLightOrDark(pokemon.color[0])
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
                            Image.asset(
                              pokemon.image.toString(),
                              alignment: Alignment.center,
                              width: 70,
                              height: 70,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
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
