import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/services/image_service.dart';

class DosagePick extends StatelessWidget {
  const DosagePick({super.key, required this.onPressedParent});
  final Function(CalcSteps, {CalcDosage option}) onPressedParent;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
        bottom: screenHeight.height / 12,
        right: screenHeight.width / 4,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getDosageTextName(CalcDosage.high)),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 105,
                height: 105,
                child: TextButton(
                  onPressed: () {
                    onPressedParent(CalcSteps.dosage, option: CalcDosage.high);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageService.getDosageIconName(CalcDosage.high)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 105,
                height: 105,
                child: TextButton(
                  onPressed: () {
                    onPressedParent(CalcSteps.dosage, option: CalcDosage.medium);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageService.getDosageIconName(CalcDosage.medium)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getDosageTextName(CalcDosage.medium)),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getDosageTextName(CalcDosage.low)),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                width: 105,
                height: 105,
                child: TextButton(
                  onPressed: () {
                    onPressedParent(CalcSteps.dosage, option: CalcDosage.low);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageService.getDosageIconName(CalcDosage.low)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 105,
                height: 105,
                child: TextButton(
                  onPressed: () {
                    onPressedParent(CalcSteps.dosage, option: CalcDosage.micro);
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(ImageService.getDosageIconName(CalcDosage.micro)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageService.getDosageTextName(CalcDosage.micro)),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
