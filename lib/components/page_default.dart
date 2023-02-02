// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class PageDefault extends StatelessWidget {
  final Widget itens;
  final List<Color> colorArray;
  const PageDefault({
    Key? key,
    required this.itens,
    required this.colorArray,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colorArray,
        ),
      ),
      child: itens,
    );
  }
}
