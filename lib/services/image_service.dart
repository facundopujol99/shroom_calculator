import 'package:shroom_calculator/constants/constants.dart';

class ImageService {

  static String getGenderImageName(CalcGender gender){
    return "assets/${gender.value}.png";
  }

  static String getWeightIconName(CalcWeight weight){
    return "assets/weight_${weight.value}.png";
  }

  static String getDosageIconName(CalcDosage dosage){
    return "assets/${dosage.value}Icon.png";
  }

  static String getDosageTextName(CalcDosage dosage){
    return "assets/${dosage.value}Text.png";
  }

  static String getTypeIconName(CalcType type){
    return "assets/${type.value}Icon.png";
  }

  static String getStateIconName(CalcState state){
    return "assets/${state.value}Icon.png";
  }
}