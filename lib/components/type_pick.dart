import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/services/image_service.dart';

class TypePick extends StatelessWidget {
  const TypePick({super.key, required this.onPressedParent});
  final Function(CalcSteps, {CalcType option}) onPressedParent;

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
                onPressedParent(CalcSteps.type, option: CalcType.mushroom);
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getTypeIconName(CalcType.mushroom)),
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
                onPressedParent(CalcSteps.type, option: CalcType.truffle);
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getTypeIconName(CalcType.truffle)),
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
