import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/services/image_service.dart';

class GenderPick extends StatelessWidget {
  const GenderPick({super.key, required this.onPressedParent});
  final Function(CalcSteps, {CalcGender option}) onPressedParent;

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
              onPressed: () {onPressedParent(CalcSteps.gender, option: CalcGender.masculine);},
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getGenderImageName(CalcGender.masculine)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: TextButton(
              onPressed: () {onPressedParent(CalcSteps.gender, option: CalcGender.femenine);},
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getGenderImageName(CalcGender.femenine)),
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
