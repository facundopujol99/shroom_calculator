import 'package:flutter/material.dart';
import 'package:shroom_calculator/components/app_text.dart';
import 'package:shroom_calculator/components/dosage_pick.dart';
import 'package:shroom_calculator/components/gender_pick.dart';
import 'package:shroom_calculator/components/number_button.dart';
import 'package:shroom_calculator/components/type_pick.dart';
import 'package:shroom_calculator/components/state_pick.dart';
import 'package:shroom_calculator/components/weight_pick.dart';
import 'package:shroom_calculator/constants/constants.dart' as constants;
import 'package:shroom_calculator/constants/options.dart';
import 'package:shroom_calculator/screens/information_screen.dart';
import 'package:shroom_calculator/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  constants.CalcSteps currentStep = constants.CalcSteps.gender;
  Options options = Options();

  void changeStep(constants.CalcSteps step, {dynamic option}) {
    constants.CalcSteps nextStep = step;
    if (option != null && step == constants.CalcSteps.weight) {
      var splittedOption = option.split('-');
      options.enteredWeight = int.parse(splittedOption[0]);
      option =
          splittedOption[1] == "kg"
              ? constants.CalcWeight.kg
              : constants.CalcWeight.lb;
    }

    if (option != null) {
      options[step] = option;
      nextStep = Options.getNextStep(step);
      if (nextStep == constants.CalcSteps.result) {
        nextStep = options.getNextEmptyStep();
      }
    }

    setState(() {
      currentStep = nextStep;
    });
  }

  void navigateToInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => InformationScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    String text = '';

    Widget content = AppText(text: "Loading...", fontsize: 30, isUnderlined: true);

    if (currentStep == constants.CalcSteps.gender) {
      content = GenderPick(onPressedParent: changeStep);
      text = 'TU GÉNERO?';
    } else if (currentStep == constants.CalcSteps.weight) {
      content = WeightPick(onPressedParent: changeStep);
      text = 'TU PESO?';
    } else if (currentStep == constants.CalcSteps.type) {
      content = TypePick(onPressedParent: changeStep);
      text = 'HONGOS?\nTRUFAS?';
    } else if (currentStep == constants.CalcSteps.state) {
      content = StatePick(onPressedParent: changeStep);
      text = 'SECOS?\nFRESCOS?';
    } else if (currentStep == constants.CalcSteps.dosage) {
      content = DosagePick(onPressedParent: changeStep);
      text = 'DOSIS?';
    } else if (currentStep == constants.CalcSteps.result) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(options: options),
          ),
        );
        setState(() {
          options = Options();
          currentStep = constants.CalcSteps.gender;
        });
      });
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      floatingActionButton: IconButton(
              icon: const Icon(
                Icons.info,
                color: Color.fromARGB(200, 20, 20, 240),
              ),
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
          Align(alignment: Alignment(0, -0.25), child: AppText(text: text)),
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
          Center(child: content)
        ],
      ),
    );
  }
}
