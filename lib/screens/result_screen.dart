import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shroom_calculator/components/app_text.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/constants/options.dart';
import 'package:shroom_calculator/screens/home_screen.dart';
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
          Center(
            child: Stack(
              children: [
                AppText(text: "40,5 g", fontsize: 80.0),
                AppText(text: "Cubernesis"),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: IconButton(
                      icon: const Icon(
                        Icons.replay_rounded,
                        weight: 10,
                        color: Color.fromARGB(255, 173, 48, 173),
                        shadows: [
                          BoxShadow(
                            color: const Color.fromARGB(100, 0, 0, 0),
                            spreadRadius: 10,
                            blurRadius: 5,
                            offset: Offset(1, 2), // Shadow position
                          ),
                        ],
                      ),
                      iconSize: 75,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
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
                    SizedBox(
                      width: 75,
                      height: 75,
                      child: AppText(
                        text:
                            "${options.enteredWeight}\n${options.weight?.value.toUpperCase()}",
                        fontsize: 30.0,
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
