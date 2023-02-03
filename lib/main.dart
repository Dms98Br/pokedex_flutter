import 'package:flutter/material.dart';
import 'package:pokedex/screens/details_pokemon_screen/details_pokemon_screen.dart';
import 'package:pokedex/screens/home_pokemon_screen/home_pokemon_screen.dart';
import 'package:pokedex/screens/models/pokemons.dart';
import 'package:pokedex/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //initialRoute: "home",
      home: const SplashScreen(),
      routes: {
        "home": (context) => const HomePokemonScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'details') {
          final Pokemons pokemon = settings.arguments as Pokemons;
          return MaterialPageRoute(
            builder: (context) {
              return DetailsPokemonScreen(pokemon: pokemon);
            },
          );
        }
        return null;
      },
    );
  }
}
