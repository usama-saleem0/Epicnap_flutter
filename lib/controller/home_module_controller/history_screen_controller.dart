import 'dart:convert';

import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/history_model.dart';
import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../screens/home_module/bedtime_screen.dart';
import '../../web_services/user_services.dart';
import 'notification_screen_controller.dart';

class HistoryScreenController  extends GetxController{
  // late UserModel? userModel;
  UserModel? userModel;
  DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
  NotificationScreenController notificationScreenController=Get.find<NotificationScreenController>();

  TextEditingController aboutController = TextEditingController();
  TextEditingController wereController = TextEditingController();
  TextEditingController doingController = TextEditingController();
  TextEditingController withController = TextEditingController();
  // late UserModel userModel;


  @override
  void onInit() {
    super.onInit();

    getUserModelFromSharedPreferences();
    // Call a method to load the userModel when the controller initializes
    loadUserModel();
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
  void onInfluncerTap({required String title,required String description , required String imageUrl}){
    Get.toNamed(AppConstant.kSingleInfluencerScreen,arguments: [title , description , imageUrl]);
  }


  void onCourseTap({required String title,required String description , required String imageUrl}){
    Get.toNamed(AppConstant.kSingleCourseScreen,arguments: [title , description , imageUrl]);
  }

  void onCoursesTap(){
    Get.toNamed(AppConstant.kCourseScreen);
  }

  void onInfluencersTap(){
    Get.toNamed(AppConstant.kInfluencerScreen);
  }


  void onbedtimeTap(){
    // Get.toNamed(AppConstant.kBedtimeScreen);
    Get.to(() => BedTimeScreen(), arguments: userModel);
  }

  // late UserModel userModel;

  Future<void> loadUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userModelJson = prefs.getString('userModel');
    if (userModelJson != null) {
      Map<String, dynamic> userModelMap = jsonDecode(userModelJson);
      userModel = UserModel.fromJson(userModelMap, "");
      // Notify listeners that userModel has been loaded
      update();
    } else {
      // Handle case where userModelJson is null
      // For example, you can show a message to the user or redirect to the login screen
    }
  }
  // Future<void> loadUserModel() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userModelJson = prefs.getString('userModel');
  //   if (userModelJson != null) {
  //     Map<String, dynamic> userModelMap = jsonDecode(userModelJson);
  //     userModel = UserModel.fromJson(userModelMap, "");
  //
  //     // print('userModel);
  //   } else {
  //     // Handle case where userModelJson is null
  //   }
  // }





  RxInt selectedIndex = (-1).obs;

  void selectImage(int index) {
    if (selectedIndex.value == index) {
      selectedIndex.value = -1; // Deselect if already selected
    } else {
      selectedIndex.value = index; // Select the tapped image
    }

    // Send the selected index to the backend
    if (selectedIndex.value != -1) {
      print('Selected index: ${selectedIndex.value}');
      // Send the selectedIndex to the backend
    }
  }


  List<String> imagePaths = [
    'assets/emo.png',
    'assets/emo2.png',
    'assets/emo3.png',
    'assets/emo4.png',
    'assets/emo5.png',
  ];


  RxInt selectedIndex2 = (-1).obs;

  void selectImage2(int index) {
    if (selectedIndex2.value == index) {
      selectedIndex2.value = -1; // Deselect if already selected
    } else {
      selectedIndex2.value = index; // Select the tapped image
    }

    // Send the selected index to the backend
    if (selectedIndex2.value != -1) {
      print('Selected index2: ${selectedIndex2.value}');
      // Send the selectedIndex to the backend
    }
  }


  List<String> likeimage = [
    'assets/like.png',
    'assets/unlike.png',

  ];


  RxInt selectedStars = 0.obs;

  void setRating(int stars) {
    selectedStars.value = stars;
    // You can perform any additional actions here, such as sending the rating to the backend
    print('User rated $stars stars');
  }

  ProgressDialog progressDialog = ProgressDialog();
  UserServices userServices = UserServices();

  Future<void> getUserMode() async{
    progressDialog.showDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);

    if (userId != null ) {
      String res = await userServices.savesurvey(about: aboutController.text,
          were: wereController.text,
          doing: doingController.text,
          withs: withController.text,
          feelings: selectedIndex.value,
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



  Future<void> main() async {
// Create an instance of UserServices
    try {
      final controller = HistoryScreenController();
      final HistoryModel? history = await userServices.History(date: 16);
      if (history != null) {
        print(history);
      } else {
        print('No history found for the given date.');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}