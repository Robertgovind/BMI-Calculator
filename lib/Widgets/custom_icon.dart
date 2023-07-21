import 'package:flutter/material.dart';

class RoundIconCustmz extends StatelessWidget {
  const RoundIconCustmz({@required this.icon, @required this.updateWeight});
  final IconData? icon;
  final updateWeight;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        height: 55,
        width: 55,
      ),
      elevation: 7,
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
      onPressed: updateWeight,
    );
  }
}
