import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';

class NameScreenController  extends GetxController{
  TextEditingController nameController = TextEditingController();

  ProgressDialog progressDialog = ProgressDialog();
  UserServices userServices = UserServices();
  void onLoginTap() async {
    print(nameController.text);
    await saveNameInSession(nameController.text);

    Get.toNamed(AppConstant.kAgeScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

  Future<void> saveNameInSession(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

}