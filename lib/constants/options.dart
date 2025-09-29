import 'package:shroom_calculator/constants/constants.dart';

class Options {
  CalcGender? gender;
  CalcWeight? weight;
  CalcType? type;
  CalcState? state;
  CalcDosage? dosage;

  int? enteredWeight;

  CalcSteps getNextEmptyStep() {
    if (gender == null) {
      return CalcSteps.gender;
    } else if (weight == null) {
      return CalcSteps.weight;
    } else if (type == null) {
      return CalcSteps.type;
    } else if (state == null) {
      return CalcSteps.state;
    } else if (dosage == null) {
      return CalcSteps.dosage;
    }
    return CalcSteps.result;
  }

  static CalcSteps getNextStep(CalcSteps step) {
    switch (step) {
      case CalcSteps.gender:
        return CalcSteps.weight;
      case CalcSteps.weight:
        return CalcSteps.type;
      case CalcSteps.type:
        return CalcSteps.state;
      case CalcSteps.state:
        return CalcSteps.dosage;
      case CalcSteps.dosage:
        return CalcSteps.result;
      case CalcSteps.result:
        return CalcSteps.gender;
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

  double calculateShroomDose() {
    var gender = this.gender?.value.toLowerCase() ?? 'male';
    var dosageLevel = dosage?.value.toLowerCase() ?? 'medium';
    var type = this.type?.value.toLowerCase() ?? 'mushroom';
    var state = this.state?.value.toLowerCase() ?? 'dry';
    var weightKg = enteredWeight?.toDouble() ?? 70.0;
    var weightConversion =
        weight?.value.toLowerCase() == 'kg' ? 1.0 : 0.45359237;
    weightKg *= weightConversion;

    const dosageTable = {
      "mushroom": {
        "drop": {"micro": 2.7, "low": 11.3, "medium": 27.0, "high": 40.5},
        "dry": {"micro": 0.3, "low": 1.1, "medium": 2.7, "high": 4.0},
      },
      "truffle": {
        "drop": {"micro": 1.2, "low": 8.5, "medium": 11.7, "high": 19.8},
        "dry": {"micro": 0.8, "low": 5.6, "medium": 7.6, "high": 12.9},
      },
    };

    double referenceDosage = dosageTable[type]![state]![dosageLevel]!;
    double calculatedDosage = (weightKg / 90.0) * referenceDosage;

    double genderFactor = 1.0;
    if (gender.toLowerCase() == 'female') {
      genderFactor = 0.95;
    }

    return double.parse((calculatedDosage * genderFactor).toStringAsFixed(2));
  }
}
