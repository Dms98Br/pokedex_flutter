// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class generateColor {
  Future<Color> getColorImage({
    required String image,
  }) async {
    final locationImage = image.toString().contains('http');
    PaletteGenerator? paletteGenerator;
    if (locationImage) {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        NetworkImage(image),
        maximumColorCount: 20,
      );
    } else {
      paletteGenerator = await PaletteGenerator.fromImageProvider(
        AssetImage(image),
        maximumColorCount: 20,
      );
    }

    if (paletteGenerator.colors.first.toString().isNotEmpty) {
      return paletteGenerator.colors.first;
    }
    return const Color.fromRGBO(234, 255, 234, 1);
  }

  bool colorLightOrDark(Color color) {
    //? The function of colorLightOrDark that a colour
    //? exemplo Color(0xffe8eff1)
    //* valueColor transforma a color de 32 bit em 16 bit
    String valueColor =
        color.value.toRadixString(16).padLeft(6, '').toUpperCase();
    //? valueColor outputs in this way FFDFE4EC. The first two characters are disregarded because it deals with the opacity of the colour
    //? A substring is made to take doid in two the value of the hex.
    //? This int.parse reformed from "DF" to 223.
    final red = int.parse(valueColor.substring(2, 4), radix: 16);
    //?  That int.parse from "E4" to 228
    final green = int.parse(valueColor.substring(4, 6), radix: 16);
    //? This int.parse reformed from "EC" to 236
    final blue = int.parse(valueColor.substring(6, 8), radix: 16);
    //? The lum does the math to report clarity
    final lum = (red * 299 + green * 587 + blue * 114) / 1000;

    if (lum > 128) {
      return true;
    } else {
      return false;
    }
  }
}
