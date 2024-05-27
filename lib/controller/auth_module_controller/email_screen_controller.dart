import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';

class EmailScreenController  extends GetxController{
  TextEditingController emailController = TextEditingController();



  void onLoginTap() async {
    Get.toNamed(AppConstant.kSetPassScreen);
    await saveEmailInSession(emailController.text);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

  Future<void> saveEmailInSession(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }


}