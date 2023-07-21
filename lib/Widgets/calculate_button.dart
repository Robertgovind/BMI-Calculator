import 'package:bmi_calculator/Components/constants.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({this.onPressed, this.title});
  final onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        color: const Color(0xFFEB1555),
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
            title.toString(),
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}

