import 'dart:convert';

import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';

class PrehistoryScreenController  extends GetxController{
  UserModel? userModel;
  DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
  MainDashboardScreenController mainDashboardScreenController=Get.find<MainDashboardScreenController>();
  TextEditingController noteController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController optimisticsController = TextEditingController();
  TextEditingController usefulController = TextEditingController();
  TextEditingController relaxedController = TextEditingController();
  TextEditingController problemsController = TextEditingController();
  TextEditingController thinkingsController = TextEditingController();
  TextEditingController feelingController = TextEditingController();
  TextEditingController mindsController = TextEditingController();
  TextEditingController sleepController = TextEditingController();
  TextEditingController wakeController = TextEditingController();
  TextEditingController bedController = TextEditingController();


  TextEditingController aboutController = TextEditingController();
  TextEditingController wereController = TextEditingController();
  TextEditingController doingController = TextEditingController();
  TextEditingController withController = TextEditingController();
  RxInt selectedIndex = (-1).obs;


  SharedPreferences? _prefs;
  DateTime _lastModalTime = DateTime.now().subtract(Duration(days: 1));


  // @override
  // void onInit() {
  //   super.onInit();
  //   _loadLastModalTime();
  // }
  RxString bedtime = '' .obs;
  RxString wakeup = ''.obs;
  RxString wakeTime = ''.obs;
  ProgressDialog progressDialog = ProgressDialog();
  UserServices userServices = UserServices();


  RxInt selectedNumber = 0.obs;
  RxInt selectedNumber2 = 0.obs;
  RxInt selectedNumber3 = 0.obs;
  RxInt selectedNumber4 = 0.obs;
  RxInt selectedNumber5 = 0.obs;
  RxInt selectedNumber6 = 0.obs;
  RxInt selectedNumber7 = 0.obs;

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

  Future<void> getUserMode() async{
    progressDialog.showDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);

    bedtime.value = bedController.text;


    int bedValue = int.tryParse(bedController.text) ?? 0;
    int wakeValue = int.tryParse(wakeController.text) ?? 0;

    int calculatedValue = wakeValue + 12 - bedValue;
    wakeTime.value = calculatedValue.toString();



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
    // Call a method to load the userModel when the controller initializes
    loadUserModel();
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


  Future<void> getUserModes() async{
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

  Future<void> getUserModess() async{
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
}