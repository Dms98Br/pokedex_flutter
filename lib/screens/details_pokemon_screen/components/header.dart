import 'package:flutter/material.dart';
import 'package:pokedex/helpers/fisrtLetterCapitalizes.dart';

import '../../../components/pokemon_type.dart';

class HeaderDetails extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final String type;
  const HeaderDetails({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  image,
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
                    children: [
                      Text(
                        "#$id",
                        style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        fisrtLetterCapitalizes(name),
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      PokemonType(typeText: type),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
