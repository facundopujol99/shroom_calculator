import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/constants/options.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key, required this.onPressedParent, required this.step, required this.options});
  final Function(CalcSteps) onPressedParent;
  final Options options;
  final CalcSteps step;
  
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressedParent(step);
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
    );
  }
}
