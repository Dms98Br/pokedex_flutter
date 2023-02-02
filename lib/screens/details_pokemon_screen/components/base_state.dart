import 'package:flutter/material.dart';

import 'base_states_item.dart';

class BaseState extends StatelessWidget {
  final Color color;
  const BaseState({super.key, required this.color});

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
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BaseStateItem(
          color: color,
          name: "HP",
          value: 40,
        ),
        BaseStateItem(
          color: color,
          name: "Attack",
          value: 55,
        ),
        BaseStateItem(
          color: color,
          name: "Defense",
          value: 50,
        ),
        BaseStateItem(
          color: color,
          name: "Special-attack",
          value: 45,
        ),
        BaseStateItem(
          color: color,
          name: "Special-defense",
          value: 65,
        ),
        BaseStateItem(
          color: color,
          name: "Speed",
          value: 55,
        ),
      ],
    );
  }
}
