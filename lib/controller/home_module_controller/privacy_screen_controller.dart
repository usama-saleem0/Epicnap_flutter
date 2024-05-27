import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:get/get.dart';

class PrivacyScreenController  extends GetxController{

  DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
  void onInfluncerTap({required String title,required String description , required String imageUrl}){
    Get.toNamed(AppConstant.kSingleInfluencerScreen,arguments: [title , description , imageUrl]);
  }


  void onCourseTap({required String title,required String description , required String imageUrl}){
    Get.toNamed(AppConstant.kSingleCourseScreen,arguments: [title , description , imageUrl]);
  }

  void onCoursesTap(){
    Get.toNamed(AppConstant.kCourseScreen);
  }

  void onInfluencersTap(){
    Get.toNamed(AppConstant.kInfluencerScreen);
  }
}