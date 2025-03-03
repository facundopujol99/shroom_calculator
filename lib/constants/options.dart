import 'package:shroom_calculator/constants/constants.dart';

class Options {
  CalcGender? gender;
  CalcWeight? weight;
  CalcType? type;
  CalcState? state;
  CalcDosage? dosage;

  double? enteredWeight;

  static String getNextStep(CalcSteps step) {
    switch (step) {
      case CalcSteps.gender:
        return CalcSteps.weight.value;
      case CalcSteps.weight:
        return CalcSteps.type.value;
      case CalcSteps.type:
        return CalcSteps.state.value;
      case CalcSteps.state:
        return CalcSteps.dosage.value;
      case CalcSteps.dosage:
        return CalcSteps.result.value;
      case CalcSteps.result:
        return CalcSteps.gender.value;
    }
  }

  dynamic operator [](CalcSteps step) {
    switch (step) {
      case CalcSteps.gender:
        return gender;
      case CalcSteps.weight:
        return weight;
      case CalcSteps.type:
        return type;
      case CalcSteps.state:
        return state;
      case CalcSteps.dosage:
        return dosage;
      case CalcSteps.result:
        return this;
    }
  }

  void operator []=(CalcSteps step, dynamic value) {
    switch (step) {
      case CalcSteps.gender:
        if (value is CalcGender) {
          gender = value;
        } else {
          throw ArgumentError('Expected a Gender value');
        }
        break;
      case CalcSteps.weight:
        if (value is CalcWeight) {
          weight = value;
        } else {
          throw ArgumentError('Expected a Weight value');
        }
        break;
      case CalcSteps.type:
        if (value is CalcType) {
          type = value;
        } else {
          throw ArgumentError('Expected a Type value');
        }
        break;
      case CalcSteps.state:
        if (value is CalcState) {
          state = value;
        } else {
          throw ArgumentError('Expected a State value');
        }
        break;
      case CalcSteps.dosage:
        if (value is CalcDosage) {
          dosage = value;
        } else {
          throw ArgumentError('Expected a Dosage value');
        }
        break;
      case CalcSteps.result:
        throw UnimplementedError();
    }
  }
}
