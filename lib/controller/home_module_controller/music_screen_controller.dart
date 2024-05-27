import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MusicScreenController  extends GetxController{
  TextEditingController nameController = TextEditingController();

  RxList<bool> isLiked = List.generate(8, (_) => false).obs; // Initialize with false for each item

  void toggleLike(int index) {
    isLiked[index] = !isLiked[index]; // Toggle the like state
  }
  final previousRoute = Get.previousRoute;
  void onAlarmTap(){
    Get.toNamed(AppConstant.kSetAlarmScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

}