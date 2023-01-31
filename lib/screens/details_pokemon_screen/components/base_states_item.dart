// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BaseStateItem extends StatelessWidget {
  final String name;
  final int value;
  final Color color;
  const BaseStateItem({
    Key? key,
    required this.name,
    required this.value,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Text(
                "$value",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: LinearProgressIndicator(
                  value: value / 100,
                  minHeight: 8,
                  backgroundColor: Colors.grey[300],
                  color: color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
