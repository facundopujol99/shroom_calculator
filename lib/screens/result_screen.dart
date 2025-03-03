import 'package:flutter/material.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/constants/options.dart';
import 'package:shroom_calculator/services/image_service.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.options});

  final Options options;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 175,
            height: 175,
            child: TextButton(
              onPressed: () {},
              child: IconButton(
                icon: const Icon(Icons.info_outline),
                tooltip: 'Show information',
                onPressed: () {
                  print("Information");
                },
              ),
            ),
          ),
          Container(
            width: screen.width,
            height: screen.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.75),
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.25),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    ImageService.getGenderImageName(CalcGender.masculine),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageService.getGenderImageName(
                              options[CalcSteps.gender],
                            ),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageService.getWeightIconName(
                              options[CalcSteps.weight],
                            ),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageService.getTypeIconName(
                              options[CalcSteps.type],
                            ),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageService.getStateIconName(
                              options[CalcSteps.state],
                            ),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Container(
                      width: 75,
                      height: 75,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            ImageService.getDosageIconName(
                              options[CalcSteps.dosage],
                            ),
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
