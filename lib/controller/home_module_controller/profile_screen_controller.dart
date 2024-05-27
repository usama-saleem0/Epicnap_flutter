import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';

class ProfileScreenController  extends GetxController{
  DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
  TextEditingController noteController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController optimisticsController = TextEditingController();
  TextEditingController usefulController = TextEditingController();
  TextEditingController relaxedController = TextEditingController();
  TextEditingController problemsController = TextEditingController();
  TextEditingController thinkingsController = TextEditingController();
  TextEditingController feelingController = TextEditingController();
  TextEditingController mindsController = TextEditingController();

  //
  // void onLogoutTap(){
  //   Get.toNamed(AppConstant.kWelcomeScreen);
  // }

  RxInt selectedStars = 0.obs;
  RxInt selectedNumber = 0.obs;
  RxInt selectedNumber2 = 0.obs;
  RxInt selectedNumber3 = 0.obs;
  RxInt selectedNumber4 = 0.obs;
  RxInt selectedNumber5 = 0.obs;
  RxInt selectedNumber6 = 0.obs;
  RxInt selectedNumber7 = 0.obs;
  void setRating(int stars) {
    selectedStars.value = stars;
    // You can perform any additional actions here, such as sending the rating to the backend
    print('User rated $stars stars');
  }





  void setNumber(int rating) {
    selectedNumber.value = rating;


    print(selectedNumber.value);
  }


  void setNumber2(int rating) {
    selectedNumber2.value = rating;


    print(selectedNumber2.value);
  }

  void setNumber3(int rating) {
    selectedNumber3.value = rating;


    print(selectedNumber3.value);
  }
  void setNumber4(int rating) {
    selectedNumber4.value = rating;


    print(selectedNumber4.value);
  }

  void setNumber5(int rating) {
    selectedNumber5.value = rating;


    print(selectedNumber5.value);
  }
  void setNumber6(int rating) {
    selectedNumber6.value = rating;


    print(selectedNumber6.value);
  }

  void setNumber7(int rating) {
    selectedNumber7.value = rating;


    print(selectedNumber7.value);
  }


  void onLogoutTap() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn'); // Remove the 'isLoggedIn' key
    Get.offNamed(AppConstant.kWelcomeScreen); // Navigate to the welcome screen
  }

  void onPrivacyTap(){
    Get.toNamed(AppConstant.kPrivacyScreen);
  }


  void onResearchTap(){
    Get.toNamed(AppConstant.kResearchScreen);
  }

  void onFaqTap(){
    Get.toNamed(AppConstant.kFaqScreen);
  }

  void onSettingsTap(){
    Get.toNamed(AppConstant.kSettingsScreen);
  }
  ProgressDialog progressDialog = ProgressDialog();
  UserServices userServices = UserServices();

  Future<void> getUserMode() async{
    progressDialog.showDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);

    if (userId != null ) {
      String res = await userServices.saveweeklysurvey(optimistics: optimisticsController.text,
          useful: usefulController.text,
          relaxed: relaxedController.text,
          problems: problemsController.text,
          thinkings: thinkingsController.text,
          people: feelingController.text,
          minds: mindsController.text,
          number1:selectedNumber.value,
          number2:selectedNumber2.value,
          number3:selectedNumber3.value,
          number4:selectedNumber4.value,
          number5:selectedNumber5.value,
          number6:selectedNumber6.value,
          number7:selectedNumber7.value,



          user_id:userId);
      if (res == "successful") {
        progressDialog.dismissDialog();
        Get.back();
      }
      else {
        progressDialog.dismissDialog();
      }
    }
    else{
      progressDialog.dismissDialog();
    }
  }



  Future<void> deleteUser() async{
    print('here');
    progressDialog.showDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);

    if (userId != null ) {
      String res = await userServices.deleteuser(



          user_id:userId);
      if (res == "successful") {
        progressDialog.dismissDialog();
        // await prefs.remove('isLoggedIn');
        await prefs.clear();
        Get.offNamed(AppConstant.kWelcomeScreen);
      }
      else {
        progressDialog.dismissDialog();
      }
    }
    else{
      progressDialog.dismissDialog();
    }
  }

}