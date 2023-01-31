import 'package:flutter/material.dart';
import 'package:pokedex/themes/theme_color.dart';

class ShinyTab extends StatelessWidget {
  const ShinyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.tabColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pokemons/133_eevee_shiny_133.png",
              width: 300,
              height: 300,
            )
          ],
        ),
      ),
    );
  }
}
