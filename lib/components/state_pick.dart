import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/services/image_service.dart';

class StatePick extends StatelessWidget {
  const StatePick({super.key, required this.onPressedParent});
  final Function(CalcSteps, {CalcState option}) onPressedParent;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight / 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: TextButton(
              onPressed: () {
                onPressedParent(CalcSteps.state, option: CalcState.dry);
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getStateIconName(CalcState.dry)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: TextButton(
              onPressed: () {
                onPressedParent(CalcSteps.state, option: CalcState.drop);
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getStateIconName(CalcState.drop)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
