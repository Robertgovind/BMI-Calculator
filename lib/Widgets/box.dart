import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box({@required this.colour, this.cardChild, this.onClick});
  final Color? colour;
  final Widget? cardChild;
  final onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: cardChild,
      ),
    );
  }
}
