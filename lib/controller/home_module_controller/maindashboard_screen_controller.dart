import 'dart:convert';

import 'package:first_project/controller/home_module_controller/bedtime_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/notification_screen_controller.dart';
import 'package:first_project/screens/home_module/analysis_screen.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/history_model.dart';
import '../../model/influncer_model.dart';
import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../screens/home_module/alarm_screen.dart';
import '../../web_services/user_services.dart';

class MainDashboardScreenController  extends GetxController{

  DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
  BedTimeScreenController bedTimeScreenController=Get.find<BedTimeScreenController>();
  NotificationScreenController notificationScreenController=Get.find<NotificationScreenController>();
  TextEditingController noteController = TextEditingController();
  TextEditingController sleepController = TextEditingController();
  TextEditingController wakeController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  RxBool isSwitched = false.obs;
  RxBool isSwitched2 = false.obs;
  RxString selectedTime = '00:00'.obs;

  RxString historyWakeup = '0'.obs;
  RxString historyBedtime = '0'.obs;

  late UserModel userModel;




  RxInt selectedIndex = (-1).obs;

  SharedPreferences? _prefs;
  DateTime _lastModalTime = DateTime.now().subtract(Duration(days: 1));


  // @override
  // void onInit() {
  //   super.onInit();
  //   _loadLastModalTime();
  // }





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
  @override
  void onInit() {
    super.onInit();

    getUserModelFromSharedPreferences();
    loadSelectedTime();


    // getUserModelFromSharedPreferences();
  }


  void getUserModelFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userModelJson = prefs.getString('userModel');
    if (userModelJson != null) {
      // Convert the serialized string back into a UserModel object
      userModel = UserModel.fromJson(jsonDecode(userModelJson), "");
      print("storeModel: ${userModel}");
    } else {
      // Handle the case where userModelJson is null
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

  void onanalysisTap(){
    // Get.toNamed(AppConstant.kTrackingScreen);
    // Get.toNamed(AppConstant.kAnalysisScreen);
    // Get.off(() => AnalysisScreen(), arguments: userModel);
    Get.to(() => AnalysisScreen(), arguments: userModel);
  }


  void ontrackingTap(){
    Get.toNamed(AppConstant.kTrackingScreen);
    // Get.toNamed(AppConstant.kAnalysisScreen);
    // Get.off(() => AnalysisScreen(), arguments: userModel);
    // Get.to(() => AnalysisScreen(), arguments: userModel);
  }


  void onalarmTap(){
    // Get.toNamed(AppConstant.kAlarmScreen);
    Get.to(() => AlarmScreen(), arguments: userModel);
  }
  void onbreathingTap(){
    Get.toNamed(AppConstant.kBreathingScreen);
  }

  void onProfileTap(){
    Get.toNamed(AppConstant.kProfileScreen);
  }


  void onHistoryTap(){
    Get.toNamed(AppConstant.kHistoryScreen);
  }

  void onNotificationTap(){
    Get.toNamed(AppConstant.kNotificationScreen);
  }

  ProgressDialog progressDialog = ProgressDialog();
  UserServices userServices = UserServices();

  // Future<void> getUserMode() async {
  //
  //
  //   progressDialog.showDialog();
  //     UserModel userModel=await userServices.savenotes(note: noteController.text, feelings: selectedIndex.value, ratings:selectedStars.value, like:selectedIndex2.value);
  //     print(userModel.toString());
  //   if (userModel.message == "successful") {
  //     print(userModel.name);
  //
  //     progressDialog.dismissDialog();
  //
  //   } else {
  //     progressDialog.dismissDialog();
  //   }
  //
  //
  // }


      Future<void> getUserMode() async{
       progressDialog.showDialog();
       SharedPreferences prefs = await SharedPreferences.getInstance();
       int? userId = prefs.getInt('userId');
       print(userId);

       if (userId != null ) {
         String res = await userServices.savenotes(note: noteController.text,
             feelings: selectedIndex.value,
             ratings: selectedStars.value,
             like: selectedIndex2.value,
             wakeup:wakeController.text,
             bedtime:bedController.text,
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


  Future<void> loadSelectedTime() async {
    _prefs = await SharedPreferences.getInstance();
    // Retrieve selected time from SharedPreferences and set it to the RxString variable
    selectedTime.value = _prefs?.getString('selectedTime') ?? '00:00';
    print('selectedTime.value ${selectedTime.value}');

  }


  // Future<void> Historydata() async{
  //   progressDialog.showDialog();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? userId = prefs.getInt('userId');
  //   print(userId);
  //
  //   if (userId != null ) {
  //     String res = await userServices.History(date: 16,
  //
  //      );
  //     if (res == "successful") {
  //       progressDialog.dismissDialog();
  //       Get.back();
  //     }
  //     else {
  //       progressDialog.dismissDialog();
  //     }
  //   }
  //   else{
  //     progressDialog.dismissDialog();
  //   }
  // }

  Future<void> main(String title) async {
    int titleAsInt = int.parse(title);


        print(titleAsInt);

    try {
      progressDialog.showDialog();
      final HistoryModel? history = await userServices.History(date: titleAsInt);
      if (history != null) {
        // Do something with the history object
        print(history);
        historyWakeup.value = history.wakeup;
        historyBedtime.value = history.bedtime;

        print(historyBedtime.value);
        progressDialog.dismissDialog();

        Get.toNamed(AppConstant.kPrehistoryScreen);

        // Example: Printing the history object
      } else {
        progressDialog.dismissDialog();
        print('No history found for the given date.');
      }
    } catch (e) {
      progressDialog.dismissDialog();
      print('Error: $e');
    }
  }


  // Future<void> edits() async{
  //
  //
  //   progressDialog.showDialog();
  //   InfluencerModel influencerModel=await userServices.editProfile(user: userController.text, email: emailController.text, description: descriptionController.text, introduction:introductionController.text,
  //     education:eductionController.text, id: influencerId , image: imageFile,
  //   );
  //   print(influencerModel.toString());
  //   if(influencerModel !=null){
  //     progressDialog.dismissDialog();
  //     name.value = influencerModel.name;
  //     description.value = influencerModel.description;
  //     email.value = influencerModel.email;
  //     education.value = influencerModel.education;
  //     about.value = influencerModel.about;
  //     // imageUrl.value = influencerModel.imageUrl;
  //     imageUrl.value = influencerModel.imageUrl?.isNotEmpty ?? false
  //         ? "https://abiola.conceptrecall.com/images/${influencerModel.imageUrl}"
  //         : "https://t3.ftcdn.net/jpg/05/02/17/94/240_F_502179445_7kWfZy9ayWqgxvynbnrwoTE6pFEch3mb.jpg";
  //     message.value = 'edit';
  //     print(message.value);
  //     // Get.offNamed(AppConstant.kInfluencerDashboardScreen,arguments: influencerModel);
  //     Get.offNamed(AppConstant.kInfluencerDashboardScreen);
  //   }
  //
  //   else{
  //     progressDialog.dismissDialog();
  //   }
  //
  //   // ProgressDialog progressDialog = ProgressDialog();
  // }

}