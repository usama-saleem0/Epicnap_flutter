import 'package:first_project/utils/app_constant.dart';
import 'package:get/get.dart';

class SplashScreenController  extends GetxController{

  var opacity = 0.0.obs;
  var scale = 0.5.obs;

  @override
  void onInit() {
    super.onInit();
    // Start the animation when the controller is initialized
    animateLogo();
  }

  void animateLogo() async {
    // Delay before starting the animation
    await Future.delayed(Duration(seconds: 1));
    // Animate opacity
    opacity.value = 1.0;
    // Animate scale
    scale.value = 1.0;
  }


  void onLoginTap(){
    Get.toNamed(AppConstant.kAcceptScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

}