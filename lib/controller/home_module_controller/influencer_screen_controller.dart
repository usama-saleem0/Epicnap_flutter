import 'package:first_project/utils/app_constant.dart';
import 'package:get/get.dart';

import 'dashboard_screen_controller.dart';

class InfluencerScreenController  extends GetxController{
  DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();

  void onInfluncerTap({required String title,required String description , required String imageUrl}){
    Get.toNamed(AppConstant.kSingleInfluencerScreen,arguments: [title , description , imageUrl]);
  }

}