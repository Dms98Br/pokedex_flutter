import 'package:flutter/material.dart';
import 'package:pokedex/components/hamburger_menu.dart';
import 'package:pokedex/components/pokemon_type.dart';
import 'package:pokedex/screens/details_pokemon_screen/components/header.dart';
import 'package:pokedex/screens/models/pokemons.dart';

import 'components/evolutions.dart';
import 'components/shiny.dart';
import 'components/stats_abilities.dart';

class DetailsPokemonScreen extends StatefulWidget {
  const DetailsPokemonScreen({super.key});

  @override
  State<DetailsPokemonScreen> createState() => _DetailsPokemonScreenState();
}

class _DetailsPokemonScreenState extends State<DetailsPokemonScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(196, 144, 93, 1),
      ),
      drawer: const HamburgerMenu(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HeaderDetails(
            id: 133,
            name: 'eevee',
            image: "assets/images/pokemons/133_eevee_133.png",
            type: 'normal',
          ),
          TabBar(
            unselectedLabelColor: Colors.black,
            labelPadding:
                EdgeInsets.only(right: MediaQuery.of(context).size.width / 100),
            labelColor: const Color.fromRGBO(196, 144, 93, 1),
            indicatorColor: const Color.fromRGBO(196, 144, 93, 1),
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
                const Center(
                  child: StatsAbilitiesTab(),
                ),
                const Center(
                  child: ShinyTab(),
                ),
                const Center(
                  child: EvolutionTab(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
