import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlarmScreenController  extends GetxController{
  TextEditingController nameController = TextEditingController();

  void onAlarmTap(){
    Get.toNamed(AppConstant.kSetAlarmScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

}