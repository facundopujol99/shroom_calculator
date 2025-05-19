import 'package:flutter/material.dart';
import 'package:shroom_calculator/components/app_text.dart';
import 'package:shroom_calculator/constants/constants.dart';
import 'package:shroom_calculator/constants/options.dart';
import 'package:shroom_calculator/screens/home_screen.dart';
import 'package:shroom_calculator/screens/information_screen.dart';
import 'package:shroom_calculator/services/image_service.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.options});
  final Options options;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    var result = options.calculateShroomDose();

    void navigateToInfo() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InformationScreen()),
      );
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: IconButton(
        icon: const Icon(Icons.info, color: Color.fromARGB(200, 20, 20, 240)),
        tooltip: 'Show information',
        onPressed: () {
          navigateToInfo();
        },
        iconSize: 40,
      ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
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
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: screen.height / 24),
                      child: AppText(
                        text: "${result.toStringAsFixed(1)} g",
                        fontsize: 80.0,
                      ),
                    ),
                    AppText(text: "Cubencis", fontsize: 80.0),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: TextButton(
                        child: AppText(text: "Volver a Calcular", fontsize: 40.0),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
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
