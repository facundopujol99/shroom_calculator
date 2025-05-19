import 'package:shroom_calculator/constants/constants.dart';

class Options {
  CalcGender? gender;
  CalcWeight? weight;
  CalcType? type;
  CalcState? state;
  CalcDosage? dosage;

  int? enteredWeight;

  CalcSteps getNextEmptyStep(){
    if(gender == null){
      return CalcSteps.gender;
    }else if(weight == null){
      return CalcSteps.weight;
    }else if(type == null){
      return CalcSteps.type;
    }else if(state == null){
      return CalcSteps.state;
    }else if(dosage == null){
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
    var weightConversion = weight?.value.toLowerCase() == 'kg' ? 1.0 : 0.45359237;
    weightKg *= weightConversion;
    
      // Base dosage (in grams, dry form)
      final Map<String, Map<String, double>> dosageTable = {
        'micro': {'mushroom': 0.2, 'truffle': 0.75},
        'low': {'mushroom': 0.75, 'truffle': 3.0},
        'medium': {'mushroom': 1.75, 'truffle': 7.0},
        'high': {'mushroom': 3.5, 'truffle': 12.0},
      };

      // Safety check
      if (!dosageTable.containsKey(dosageLevel) ||
          !dosageTable[dosageLevel]!.containsKey(type)) {
        throw ArgumentError('Invalid dosage level or type');
      }

      double baseDose = dosageTable[dosageLevel]![type]!;

      // Adjust for weight (70kg = baseline)
      double weightFactor = weightKg / 70.0;

      // Optional gender factor
      double genderFactor = 1.0;
      if (gender.toLowerCase() == 'female') {
        genderFactor = 0.95;
      }

      // Wet vs dry
      double stateFactor = state.toLowerCase() == 'drop' ? 10.0 : 1.0;

      // Final dosage
      return baseDose * weightFactor * genderFactor * stateFactor;
    }
}
