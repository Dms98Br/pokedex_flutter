// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pokedex/themes/theme_color.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[
            ThemeColors.appBarColor1,
            ThemeColors.backgroudColor2,
          ],
        )),
      ),
    );
  }
}
