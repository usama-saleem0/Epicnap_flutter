import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpScreenController  extends GetxController{
  final TextEditingController emailController = TextEditingController();
  void onVerifyTap(){
    Get.toNamed(AppConstant.kCreatePasswordScreen);
  }

}