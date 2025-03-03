enum CalcGender {
  masculine('masculine'),
  femenine('femenine');

  final String value;
  const CalcGender(this.value);
}

enum CalcDosage {
  micro('micro'),
  low('low'),
  medium('medium'),
  high('high');

  final String value;
  const CalcDosage(this.value);
}

enum CalcWeight {
  kg('kg'),
  lb('lb');

  final String value;
  const CalcWeight(this.value);
}

enum CalcType {
  mushroom('mushroom'),
  truffle('truffle');

  final String value;
  const CalcType(this.value);
}

enum CalcState {
  dry('dry'),
  drop('drop');

  final String value;
  const CalcState(this.value);
}

enum CalcSteps {
  gender('gender'),
  weight('weight'),
  type('type'),
  state('state'),
  dosage('dosage'),
  result('result');

  final String value;
  const CalcSteps(this.value);
}
