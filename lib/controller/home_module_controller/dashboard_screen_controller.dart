

import 'package:first_project/screens/custom_widgets/custom_dialog.dart';
import 'package:first_project/screens/home_module/analysis_screen.dart';
import 'package:first_project/screens/home_module/antisleep.dart';
import 'package:first_project/screens/home_module/course_screen.dart';
import 'package:first_project/screens/home_module/history_screen.dart';
import 'package:first_project/screens/home_module/influencer_home_screen.dart';
import 'package:first_project/screens/home_module/maindashboard_screen.dart';
import 'package:first_project/screens/home_module/profile_screen.dart';
import 'package:first_project/screens/home_module/support_screen.dart';
// import 'package:first_project/support.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../../screens/home_module/home.dart';
import '../../screens/home_module/influencer_screen.dart';

class DashboardScreenController  extends GetxController{

 RxInt currentIndex = 0.obs;


 RxString name = ''.obs;

 RxString timer = ''.obs;
 RxString bedtime = ''.obs;
 RxString wakeup = ''.obs;
 RxString bedtimes = ''.obs;
 RxInt totallastsleep = 0.obs;
 RxInt totalmonth = 0.obs;
 RxInt totalweek = 0.obs;

 RxString email = ''.obs;
 RxString country = ''.obs;

 RxInt id = 0.obs;
 RxInt sleepquality = 0.obs;
 RxInt sleepmood = 0.obs;
 RxInt sleepamount = 0.obs;
 RxInt totalsleep = 0.obs;
 RxInt totalsleepmonth = 0.obs;
 @override

 void onInit() {
  super.onInit();
  print('abcdssssssss');
  final userModel = Get.arguments as UserModel; // Cast the arguments to UserModel

  name.value = userModel.name ?? "Test Data";

  timer.value = userModel.lastAlarmTimer ?? "00:00";
  bedtime.value = userModel.lastbedtime ?? "00:00";

  email.value = userModel.email ?? "";

  id.value = userModel.id;
  sleepquality.value = userModel.sleepquality ?? 0;
  sleepmood.value = userModel.sleepmood ?? 0;
  sleepamount.value = userModel.sleepamount ?? 0;
  totalsleep.value = userModel.totalsleep ?? 0;
  totalmonth.value = userModel.totalmonth ?? 0;
  totalweek.value = userModel.totalweek ?? 0;
  totalsleepmonth.value = userModel.totalsleepmonth ?? 0;
  wakeup.value = userModel.wakeup ?? '0';

  totallastsleep.value = userModel.totallastsleep ?? 0;

  print('sleepamount ${sleepamount.value}');
 }


 final List<Widget> listOfScreens=[
  const MainDashboradScreen(),
  // const InfluencerHomeScreen(),
  const HistoryScreen(),
  // Support(),
  // const AntisleepScreen(),
  const AntisleepScreen(),
  const ProfileScreen(),
  // const ProfileScreen(),

 ];

 CustomDialog customDialog = CustomDialog();
 void onDialog(){
  CustomDialog.showMyDialog();
 }



}