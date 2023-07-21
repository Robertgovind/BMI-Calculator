import 'package:bmi_calculator/Components/constants.dart';
import 'package:flutter/material.dart';



class cardIcons extends StatelessWidget {
  const cardIcons(this.icon, this.sex);
  final IconData icon;
  final String sex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          sex,
          style: labelStyle,
        ),
      ],
    );
  }
}
