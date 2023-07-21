import 'package:bmi_calculator/Widgets/box.dart';
import 'package:bmi_calculator/Widgets/calculate_button.dart';
import 'package:bmi_calculator/Widgets/cardIcon.dart';
import 'package:bmi_calculator/Components/constants.dart';
import 'package:bmi_calculator/Components/functionality.dart';
import 'package:bmi_calculator/Screens/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Widgets/custom_icon.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color femaleCardColour = inactiveCardColor;

  int height = 200;
  int weight = 60;
  int age = 18;

  Gender? selGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Box(
                    colour: selGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const cardIcons(FontAwesomeIcons.mars, 'MALE'),
                    onClick: () {
                      setState(() {
                        selGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Box(
                    colour: selGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const cardIcons(FontAwesomeIcons.mars, 'FEMALE'),
                    onClick: () {
                      setState(() {
                        selGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Box(
              colour: inactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: labelStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberStyle,
                      ),
                      const Text(
                        "cm",
                        style: labelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 14),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 25),
                      overlayColor: const Color(0xFFEB1555).withOpacity(0.4),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 250,
                      onChanged: (double newVal) {
                        setState(() {
                          height = newVal.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onClick: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Box(
                    colour: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: labelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconCustmz(
                              icon: FontAwesomeIcons.minus,
                              updateWeight: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            RoundIconCustmz(
                              icon: FontAwesomeIcons.plus,
                              updateWeight: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onClick: () {},
                  ),
                ),
                Expanded(
                  child: Box(
                    colour: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconCustmz(
                              icon: FontAwesomeIcons.minus,
                              updateWeight: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            RoundIconCustmz(
                              icon: FontAwesomeIcons.plus,
                              updateWeight: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onClick: () {},
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            title: 'CALCULATE',
            onPressed: () {
              CalculatorFunctionlality res =
                  CalculatorFunctionlality(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiReslut: res.calculateBMI(),
                      condition: res.getReslut(),
                      description: res.getSuggestion(),
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

