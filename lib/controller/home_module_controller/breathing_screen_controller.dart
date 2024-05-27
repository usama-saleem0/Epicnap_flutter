import 'package:first_project/screens/home_module/exercise_screen.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/home_module/animation_screen.dart';

class BreathingScreenController  extends GetxController{

  void onLoginTap(){
    Get.toNamed(AppConstant.kAcceptScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kExerciseScreen);
    // MaterialPageRoute(builder: (context) => ExerciseScreen());
  }

}