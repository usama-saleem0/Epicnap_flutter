
import 'package:first_project/controller/home_module_controller/influencer_dashoard_controller.dart';

import 'package:get/get.dart';

import '../../utils/app_constant.dart';

class InfluencerHomeController  extends GetxController{

   InfluencerDashboardScreenController influencerDashboardScreenController = Get.find<InfluencerDashboardScreenController>();


  void onEditTap(){
    // Get.toNamed(AppConstant.kEditProfileScreen);
    // Get.offNamed(AppConstant.kEditProfileScreen);
  }

  void onAccountTap(){
    Get.toNamed(AppConstant.kAccountSetting);
  }

  RxString title = 'Influncer'.obs;
  RxString description = 'Lorem ipsum, dolor sit amet consectetur adipisicing elit'.obs;
  RxString imageUrl = 'assets/influencer5.jpg'.obs;

  // void onInit() {
  //   name.value=Get.arguments[0];
  //
  //
  //   super.onInit();
  // }
}
