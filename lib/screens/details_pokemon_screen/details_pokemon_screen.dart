import 'package:flutter/material.dart';
import 'package:pokedex/screens/details_pokemon_screen/components/header/header.dart';
import 'package:pokedex/screens/models/pokemons.dart';

import '../../helpers/fisrtLetterCapitalizes.dart';
import '../../helpers/generateColors.dart';
import 'components/evolutions/evolutions.dart';
import 'components/tab/shiny.dart';
import 'components/abilities/abilities_stats.dart';

class DetailsPokemonScreen extends StatefulWidget {
  final Pokemons pokemon;

  const DetailsPokemonScreen({
    super.key,
    required this.pokemon,
  });

  @override
  State<DetailsPokemonScreen> createState() => _DetailsPokemonScreenState();
}

class _DetailsPokemonScreenState extends State<DetailsPokemonScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late Color color = Colors.white;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getColor();
    });
    super.initState();
  }

  _getColor() async {
    final auxColor =
        await generateColor().getColorImage(image: widget.pokemon.image);
    setState(() {
      color = auxColor;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${fisrtLetterCapitalizes(pokemon.name)}',
              style: TextStyle(
                color: generateColor().colorLightOrDark(color)
                    ? Colors.black
                    : Colors.white,
              ),
            ),
            Text(
              '#${pokemon.id}',
              style: TextStyle(
                color: generateColor().colorLightOrDark(color)
                    ? Colors.black54
                    : Colors.white54,
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(
          color: generateColor().colorLightOrDark(color)
              ? Colors.black
              : Colors.white,
        ),
      ),
      //drawer: const HamburgerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          HeaderDetails(
            idPokemon: int.parse(pokemon.id),
            namePokemon: pokemon.name,
            imagePokemon: pokemon.image,
            typePokemon: pokemon.type,
            color: color,
          ),
          TabBar(
            unselectedLabelColor: Colors.black45,
            labelPadding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 100),
            dividerColor: Colors.black45,
            labelColor: Colors.black,
            indicatorColor: color,
            tabs: const [
              Tab(
                text: 'Stats/Abilities',
              ),
              Tab(
                text: 'Shiny',
              ),
              Tab(
                text: 'Evolutions',
              ),
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Center(
                  child: StatsAbilitiesTab(
                    color: color,
                    abilities: pokemon.abilities,
                    stats: pokemon.stats,
                  ),
                ),
                Center(
                  child: ShinyTab(image: pokemon.imageShiny),
                ),
                Center(
                  child: EvolutionTab(evolutionsPokemons: pokemon.evolutions),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
