import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/constants/options.dart';
import 'package:shroom_calculator/services/image_service.dart';

class NumberButtons extends StatefulWidget {
  const NumberButtons({
    super.key,
    required this.onPressedParent,
    required this.options,
  });
  final Function(CalcSteps) onPressedParent;
  final Options options;

  @override
  _NumberButtonsState createState() => _NumberButtonsState();
}

class _NumberButtonsState extends State<NumberButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            widget.onPressedParent(CalcSteps.gender);
          },
          child: Ink(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageService.getGenderImageName(
                    widget.options[CalcSteps.gender],
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onPressedParent(CalcSteps.weight);
          },
          child: Ink(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageService.getWeightIconName(
                    widget.options[CalcSteps.weight],
                  ),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onPressedParent(CalcSteps.type);
          },
          child: Ink(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageService.getTypeIconName(widget.options[CalcSteps.type]),
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onPressedParent(CalcSteps.state);
          },
          child: Ink(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageService.getStateIconName(
                    widget.options[CalcSteps.state],
                  ),),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            widget.onPressedParent(CalcSteps.dosage);
          },
          child: Ink(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageService.getDosageIconName(
                    widget.options[CalcSteps.dosage],
                  ),),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
