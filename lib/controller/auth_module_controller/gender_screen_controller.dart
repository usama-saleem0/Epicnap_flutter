import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';
enum Gender { Male, Female, Other }
class GenderScreenController  extends GetxController{
  TextEditingController emailController = TextEditingController();
  // String? selectedGender;

  late SharedPreferences _prefs;
  RxString selectedGender = ''.obs;


  @override
  void onInit() {
    super.onInit();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    selectedGender.value = _prefs.getString('selectedGender') ?? '';
  }

  Future<void> saveSelectedGender() async {
    await _prefs.setString('selectedGender', selectedGender.value);
  }
  void onLoginTap() async {
    Get.toNamed(AppConstant.kEmailScreen);
    // await saveEmailInSession(emailController.text);
    await saveSelectedGender();
  }


  // void setGender(Gender? gender) {
  //   selectedGender = gender;
  //   update(); // Notify GetX to update the UI
  // }
  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

  Future<void> saveEmailInSession(String gender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('gender', gender);
  }


}