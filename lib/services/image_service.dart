import 'package:shroom_calculator/constants/constants.dart';

class ImageService {

  static String getGenderImageName(CalcGender? gender){
    if(gender == null){
      return "assets/number_1.png";
    }
    return "assets/${gender.value}.png";
  }

  static String getWeightIconName(CalcWeight? weight){
    if(weight == null){
      return "assets/number_2.png";
    }
    return "assets/weight_${weight.value}.png";
  }

  static String getDosageIconName(CalcDosage? dosage){
    if(dosage == null){
      return "assets/number_5.png";
    }
    return "assets/${dosage.value}Icon.png";
  }

  static String getDosageTextName(CalcDosage? dosage){
    return "assets/${dosage?.value}Text.png";
  }

  static String getTypeIconName(CalcType? type){
    if(type == null){
      return "assets/number_3.png";
    }
    return "assets/${type.value}Icon.png";
  }

  static String getStateIconName(CalcState? state){
    if(state == null){
      return "assets/number_4.png";
    }
    return "assets/${state.value}Icon.png";
  }
}