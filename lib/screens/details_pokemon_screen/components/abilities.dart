import 'package:flutter/material.dart';

class Abilities extends StatelessWidget {
  const Abilities({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: 8,
        ),
        Text(
          "Abilities",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(196, 144, 93, 1),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Run-away",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "Anticipation",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "Adaptability",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
