import 'package:flutter/material.dart';
import 'package:pokedex/components/appBar.dart';
import 'package:pokedex/components/hamburger_menu.dart';
import 'package:pokedex/screens/home_pokemon_screen/components/pokemon_card.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:pokedex/themes/theme_color.dart';
import '../../components/loading_screen.dart';

class HomePokemonScreen extends StatefulWidget {
  const HomePokemonScreen({super.key});

  @override
  State<HomePokemonScreen> createState() => _HomePokemonScreenState();
}

class _HomePokemonScreenState extends State<HomePokemonScreen> {
  List _database = [];
  final String _limit = '10';
  int _offset = 0;
  bool _loadingMore = false;
  bool _loadingInitial = false;
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _initialCharge();
    _controller = ScrollController()..addListener(_loadPokemon);
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
        child: Column(
          children: [
            Expanded(
              child: _loadingInitial
                  ? const LoadingScreen(
                      color: Colors.black,
                    )
                  : ListView.builder(
                      controller: _controller,
                      itemCount: _database.length,
                      itemBuilder: (context, i) {
                        final Pokemons pokemon = _database[i] as Pokemons;

                        return PokemonCards(pokemon: pokemon);
                      },
                    ),
            ),
            if (_loadingMore)
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 40),
                child: Image.asset(
                  'assets/images/pikachu_running.gif',
                ),
              )
          ],
        ),
      ),
    );
  }

  void _initialCharge() async {
    setState(() {
      _loadingInitial = true;
    });
    final getPokemons = await PokemonService().getAll(_limit, _offset);

    setState(() {
      _database = getPokemons;
      _loadingInitial = false;
    });
  }

  void _loadPokemon() async {
    if (_loadingMore == false) {
      setState(() {
        _loadingMore = true;
      });
      _offset += int.parse(_limit);
      final getPokemons = await PokemonService().getAll(_limit, _offset);
      for (var pokemon in getPokemons) {
        setState(() {
          _database.add(pokemon);
        });
      }
      setState(() {
        _loadingMore = false;
      });
    }
  }
}
