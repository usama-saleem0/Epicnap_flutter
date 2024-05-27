import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetScreenController  extends GetxController{
  final TextEditingController emailController = TextEditingController();

  void onOtpTap(){
    Get.toNamed(AppConstant.kOtpScreen);
  }
}