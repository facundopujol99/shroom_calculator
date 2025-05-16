import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';

class NumberButtons extends StatelessWidget {
  const NumberButtons({super.key, required this.onPressedParent});
  final Function(CalcSteps) onPressedParent;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            onPressedParent(CalcSteps.gender);
          },
          child: Ink(
            width: 40,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/number_1.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onPressedParent(CalcSteps.weight);
          },
          child: Ink(
            width: 40,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/number_2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onPressedParent(CalcSteps.type);
          },
          child: Ink(
            width: 40,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/number_3.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onPressedParent(CalcSteps.state);
          },
          child: Ink(
            width: 40,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/number_4.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            onPressedParent(CalcSteps.dosage);
          },
          child: Ink(
            width: 40,
            height: 60,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/number_5.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
