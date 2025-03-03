import 'package:flutter/material.dart';
import 'package:shroom_calculator/components/dosage_pick.dart';
import 'package:shroom_calculator/components/gender_pick.dart';
import 'package:shroom_calculator/components/number_button.dart';
import 'package:shroom_calculator/components/type_pick.dart';
import 'package:shroom_calculator/components/state_pick.dart';
import 'package:shroom_calculator/components/weight_input.dart';
import 'package:shroom_calculator/constants/constants.dart' as constants;
import 'package:shroom_calculator/constants/options.dart';
import 'package:shroom_calculator/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentStep = constants.CalcSteps.gender.value;
  Options options = Options();

  void changeStep(constants.CalcSteps step, {dynamic option}) {
    String nextStep = step.value;
    if (option != null && step == constants.CalcSteps.weight) {
      var splittedOption = option.split('-');
      options.enteredWeight = double.parse(splittedOption[0]);
      option =
          splittedOption[1] == "kg"
              ? constants.CalcWeight.kg
              : constants.CalcWeight.lb;
    }

    if (option != null) {
      options[step] = option;
      nextStep = Options.getNextStep(step);
    }

    setState(() {
      currentStep = nextStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    String imageText = 'genderText';

    Widget content = Text('An error occurred');

    if (currentStep == constants.CalcSteps.gender.value) {
      content = GenderPick(onPressedParent: changeStep);
      imageText = 'genderText';
    } else if (currentStep == constants.CalcSteps.weight.value) {
      content = WeightInput(onPressedParent: changeStep);
      imageText = 'weightText';
    } else if (currentStep == constants.CalcSteps.type.value) {
      content = TypePick(onPressedParent: changeStep);
      imageText = 'shroomTypeText';
    } else if (currentStep == constants.CalcSteps.state.value) {
      content = StatePick(onPressedParent: changeStep);
      imageText = 'shroomStateText';
    } else if (currentStep == constants.CalcSteps.dosage.value) {
      content = DosagePick(onPressedParent: changeStep);
      imageText = 'dosageText';
    } else if (currentStep == constants.CalcSteps.result.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(options: options),
          ),
        );
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: IconButton(
              icon: const Icon(Icons.info_outline),
              tooltip: 'Show information',
              onPressed: () {
                print("Information");
              },
              iconSize: 12,
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
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/$imageText.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: screen.height / 10,
              left: screen.width / 50,
            ),
            child: Align(
              alignment: Alignment(-1, 0),
              child: NumberButtons(onPressedParent: changeStep),
            ),
          ),
          Center(child: content),
        ],
      ),
    );
  }
}
