

import 'package:first_project/screens/home_module/account_setting_screen.dart';
import 'package:first_project/screens/home_module/course_screen.dart';
import 'package:first_project/screens/home_module/influencer_home_screen.dart';
import 'package:first_project/support.dart';
import 'package:first_project/supportmessage.dart';
import 'package:first_project/web_services/web_service_url.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../../screens/custom_widgets/custom_dialog.dart';
import '../../screens/home_module/payment_add_screen.dart';


class InfluencerDashboardScreenController  extends GetxController{

  RxInt currentIndex = 0.obs;
  RxString name = ''.obs;
  RxString description = ''.obs;
  RxString email = ''.obs;
  RxString about = ''.obs;
  RxString education = ''.obs;
  RxString imageUrl = ''.obs;
  RxInt id = 0.obs;
  @override
  // void onInit() {
  //   super.onInit();
  //
  //
  //   name.value = Get.arguments.influencerModel != null ?Get.arguments.influencerModel.name:"Test Data";
  //   description.value = Get.arguments.influencerModel.description;
  //   email.value = Get.arguments.influencerModel.email;
  //   about.value = Get.arguments.influencerModel.about;
  //   education.value = Get.arguments.influencerModel.education;
  //   id.value = Get.arguments.influencerModel.authId;
  //
  //   print(description.value);
  //   // Now you can use userModel in your controller
  //
  // }


  void onInit() {

    super.onInit();
    print('abcd');
    final userModel = Get.arguments as UserModel; // Cast the arguments to UserModel

    name.value = userModel.influencerModel.name ?? "Test Data";
    description.value = userModel.influencerModel.description ?? "";
    email.value = userModel.influencerModel.email ?? "";
    about.value = userModel.influencerModel.about ?? "";
    education.value = userModel.influencerModel.education ?? "";
    // imageUrl.value = userModel.influencerModel.imageUrl ?? "";
    imageUrl.value = userModel.influencerModel.imageUrl?.isNotEmpty ?? false
        ? "https://abiola.conceptrecall.com/images/${userModel.influencerModel.imageUrl}"
        : "https://t3.ftcdn.net/jpg/05/02/17/94/240_F_502179445_7kWfZy9ayWqgxvynbnrwoTE6pFEch3mb.jpg";
    id.value = userModel.influencerModel.authId;

    print("dddddd $imageUrl");
  }


  final List<Widget> listOfScreens=[
    // Get.arguments(userModel);
    // const HomeScreen(),
    const InfluencerHomeScreen(),
    // const CourseScreen(),
    const AccountSettingScreen(),
    SupportChat(),
    // Support(),
    const PaymentAddScreen()
  ];

  CustomDialog customDialog = CustomDialog();
  void onDialog(){
    CustomDialog.showMyDialog();
  }

}