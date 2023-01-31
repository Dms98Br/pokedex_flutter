import 'package:flutter/material.dart';

import 'base_states_item.dart';

class BaseState extends StatelessWidget {
  const BaseState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Text(
          "Base state",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(196, 144, 93, 1),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const BaseStateItem(
          color: Color.fromRGBO(196, 144, 93, 1),
          name: "HP",
          value: 40,
        ),
        const BaseStateItem(
          color: Color.fromRGBO(196, 144, 93, 1),
          name: "Attack",
          value: 55,
        ),
        const BaseStateItem(
          color: Color.fromRGBO(196, 144, 93, 1),
          name: "Defense",
          value: 50,
        ),
        const BaseStateItem(
          color: Color.fromRGBO(196, 144, 93, 1),
          name: "Special-attack",
          value: 45,
        ),
        const BaseStateItem(
          color: Color.fromRGBO(196, 144, 93, 1),
          name: "Special-defense",
          value: 65,
        ),
        const BaseStateItem(
          color: Color.fromRGBO(196, 144, 93, 1),
          name: "Speed",
          value: 55,
        ),
      ],
    );
  }
}
