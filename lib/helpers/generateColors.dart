// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class generateColor {
  static getColorImage({
    required AssetImage image,
  }) async {
    PaletteGenerator? paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      image,
      maximumColorCount: 20,
    );
    return paletteGenerator.dominantColor?.color;
  }

  bool colorlightOrDark(Color color) {
    String valueColor =
        color.value.toRadixString(16).padLeft(6, '').toUpperCase();

    final r = int.parse(
        valueColor.substring(
          2,
          4,
        ),
        radix: 16);
    final g = int.parse(valueColor.substring(4, 6), radix: 16);
    final b = int.parse(valueColor.substring(6, 8), radix: 16);
    final lum = (r * 299 + g * 587 + b * 114) / 1000;

    if (lum > 128) {
      print('Cor clara');
      return true;
    } else {
      print("Cor escura");
      return false;
    }
  }
}
