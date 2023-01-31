import 'package:flutter/material.dart';
import 'package:pokedex/screens/details_pokemon_screen/details_pokemon_screen.dart';

void main() {
  runApp(const Pokedex());
}

class Pokedex extends StatelessWidget {
  const Pokedex({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DetailsPokemonScreen(),
    );
  }
}
