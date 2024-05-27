import 'package:first_project/utils/app_constant.dart';
import 'package:get/get.dart';

class WelcomeScreenController  extends GetxController{

  void onLoginTap(){
    Get.toNamed(AppConstant.kAcceptScreen);
    // Get.toNamed(AppConstant.kSplashScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }


  void onAlreadyLoginTap(){
    Get.toNamed(AppConstant.kNewLoginScreen);
    // Get.toNamed(AppConstant.kSplashScreen);
  }

}