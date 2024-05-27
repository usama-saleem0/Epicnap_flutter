import 'dart:convert';

import 'package:first_project/screens/home_module/bedtime_screen.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../home_module_controller/dashboard_screen_controller.dart';

class AnalysisScreenController  extends GetxController{

  DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
  late UserModel userModel;


  @override
  void onInit() {
    super.onInit();

    getUserModelFromSharedPreferences();




  }


  void onLoginTap(){
    Get.toNamed(AppConstant.kAcceptScreen);
  }

  void onRegisterTap(){
    // Get.toNamed(AppConstant.kBedtimeScreen);

    Get.to(() => BedTimeScreen(), arguments: userModel);
  }

  void onbackTap(){
    Get.toNamed(AppConstant.kMainDashboardScreen);
  }

  void getUserModelFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userModelJson = prefs.getString('userModel');
    if (userModelJson != null) {
      // Convert the serialized string back into a UserModel object
      userModel = UserModel.fromJson(jsonDecode(userModelJson), "");
      print("storeModel: ${userModel}");
    } else {

    }
  }

}