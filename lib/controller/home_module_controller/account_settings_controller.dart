import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AccountSettingController  extends GetxController{

  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();




  void onPayment(){
    Get.toNamed(AppConstant.kPaymentSettingScreen);
  }

  void onCategory(){
    Get.toNamed(AppConstant.kCategorySettingScreen);
  }

  void onAdd(){
    Get.toNamed(AppConstant.kPaymentAddScreen);
  }
}