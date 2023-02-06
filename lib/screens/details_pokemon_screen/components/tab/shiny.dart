import 'package:flutter/material.dart';
import 'package:pokedex/themes/theme_color.dart';

class ShinyTab extends StatelessWidget {
  final String image;
  const ShinyTab({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.tabColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image.toString().contains('http')
                ? Image.network(
                    image,
                    width: 300,
                    height: 300,
                  )
                : Image.asset(
                    image,
                    width: 300,
                    height: 300,
                  )
          ],
        ),
      ),
    );
  }
}
