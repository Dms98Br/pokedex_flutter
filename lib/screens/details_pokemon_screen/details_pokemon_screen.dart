import 'package:flutter/material.dart';
import 'package:pokedex/components/hamburger_menu.dart';
import 'package:pokedex/components/pokemon_type.dart';
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
          Container(
            height: MediaQuery.of(context).size.height / 4,
            color: const Color.fromRGBO(196, 144, 93, 1),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/pokemons/133_eevee_133.png",
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "#133",
                              style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Eevee",
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            PokemonType(typeText: 'normal'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          TabBar(
            unselectedLabelColor: Colors.black,
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
                Center(
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
