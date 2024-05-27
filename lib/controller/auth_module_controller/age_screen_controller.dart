import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AgeScreenController  extends GetxController{
  TextEditingController ageController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  Rx<DateTime> selectedDate = DateTime.now().obs;

  void onLoginTap() async{
    print(dateController.text);
    await saveAgeInSession(dateController.text);
    Get.toNamed(AppConstant.kGenderScreen);
  }
  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

  Future<void> saveAgeInSession(String age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('age', age);
  }
}