import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.hasMargin});
  final bool hasMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: hasMargin ? EdgeInsets.only(right: 10) : null,
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
