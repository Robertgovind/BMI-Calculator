import 'package:bmi_calculator/Widgets/box.dart';
import 'package:bmi_calculator/Components/constants.dart';
import 'package:bmi_calculator/Widgets/calculate_button.dart';
import 'package:flutter/material.dart';


class ResultsPage extends StatelessWidget {
   const ResultsPage(
      {required this.bmiReslut,
      required this.condition,
      required this.description});
  final String bmiReslut;
  final String condition;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Your reslut:",
                style: kReslutStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Box(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    condition,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiReslut,
                    style: kBMIreslutStyle,
                  ),
                  Text(
                    description,
                    style: kResultBodyStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            title: 'RE-CALCULATE',
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
