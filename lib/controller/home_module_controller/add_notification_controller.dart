// import 'package:audioplayers/audioplayers.dart';
// import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
// import 'package:first_project/utils/app_constant.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
// import 'dart:typed_data';
// import 'package:timezone/timezone.dart' as tz;
//
//
// class BedTimeScreenController  extends GetxController{
//
//   DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   final AudioPlayer audioPlayer = AudioPlayer();
//
//   // Variables to store selected alarm time and song path
//   // Rx<DateTime?> selectedTime = Rx<DateTime?>(DateTime.now());
//   tz.TZDateTime scheduledTime = tz.TZDateTime.from(selectedTime.value!, tz.local);
//
//   String selectedSongPath = 'path/to/your/alarm/song.mp3'; // Replace with your default song path
//
//   @override
//   void onInit() {
//     super.onInit();
//     initializeNotifications();
//   }
//
//   void initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     final InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//
//   Future<void> showNotification(String title, String body) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'alarm_notification',
//       'Alarm Notification',
//       // 'Channel for alarm notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//     );
//
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       platformChannelSpecifics,
//     );
//   }
//
//   Future<void> playAlarm(String assetPath) async {
//     await audioPlayer.play(assetPath, isLocal: true);
//   }
//
//   void selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     if (pickedTime != null) {
//       selectedTime.value = DateTime(
//         DateTime.now().year,
//         DateTime.now().month,
//         DateTime.now().day,
//         pickedTime.hour,
//         pickedTime.minute,
//       );
//     }
//   }
//
//   void scheduleAlarm() async {
//     // Check if selectedTime is null
//     if (selectedTime.value == null) {
//       Get.snackbar(
//         'Error',
//         'Please select an alarm time',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//
//     // Calculate time until alarm
//     final now = DateTime.now();
//     final timeUntilAlarm = selectedTime.value!.difference(now);
//
//     // Ensure selectedTime is not in the past
//     if (timeUntilAlarm.isNegative) {
//       Get.snackbar(
//         'Error',
//         'Selected alarm time has already passed',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       return;
//     }
//
//     // Schedule notification
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Alarm',
//       'Wake up!',
//       scheduledTime,
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'alarm_notification',
//           'Alarm Notification',
//           // 'Channel for alarm notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//           enableVibration: true,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.absoluteTime,
//     );
//
//     // Schedule audio playing
//     Future.delayed(timeUntilAlarm, () {
//       playAlarm(selectedSongPath);
//     });
//   }
//
//
//
//   void onInfluncerTap({required String title,required String description , required String imageUrl}){
//     Get.toNamed(AppConstant.kSingleInfluencerScreen,arguments: [title , description , imageUrl]);
//   }
//
//
//   void onCourseTap({required String title,required String description , required String imageUrl}){
//     Get.toNamed(AppConstant.kSingleCourseScreen,arguments: [title , description , imageUrl]);
//   }
//
//   void onCoursesTap(){
//     Get.toNamed(AppConstant.kCourseScreen);
//   }
//
//   void onTracking(){
//     Get.toNamed(AppConstant.kTrackingScreen);
//   }
//
//   void onanalysisTap(){
//     Get.toNamed(AppConstant.kAnalysisScreen);
//   }
// }


import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/screens/home_module/analysis_screen.dart';
import 'package:first_project/screens/home_module/bedtime_screen.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'package:timezone/timezone.dart' as tz;

import '../../model/alarm_model.dart';
import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../screens/home_module/alarm_screen.dart';
import '../../web_services/user_services.dart';

class AddNotificationController extends GetxController {

  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  UserModel? userModel;


  @override
  void onInit() {
    super.onInit();

    loadUserModel();
    // getUserModelFromSharedPreferences();
  }










  Future<void> loadUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userModelJson = prefs.getString('userModel');
    if (userModelJson != null) {
      Map<String, dynamic> userModelMap = jsonDecode(userModelJson);
      userModel = UserModel.fromJson(userModelMap, "");

      print('latest , $userModel');
      // Notify listeners that userModel has been loaded
      update();
    } else {
      // Handle case where userModelJson is null
      // For example, you can show a message to the user or redirect to the login screen
    }
  }

  UserServices userServices = UserServices();
  ProgressDialog progressDialog = ProgressDialog();


  Future<void> addNotifications() async {
    int time;
    progressDialog.showDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);

    time = int.parse(timeController.text);


    if (userId != null ) {
      // Call storeAlarm with userId
      UserModel userModel = await userServices.savenotifications(id: userId, title: titleController.text, time: time);

      print(userModel.notify.toString());
      if (userModel.message == "successful") {
        progressDialog.dismissDialog();
        Get.to(() => BedTimeScreen(), arguments: userModel);
        // Get.back();







      } else {
        progressDialog.dismissDialog();
        Get.to(() => BedTimeScreen(), arguments: userModel);
      }
    } else {
      // Handle the case where userId is null
      print("User ID is null");
      progressDialog.dismissDialog();
    }
  }


  void onAddTap(){
    Get.toNamed(AppConstant.kAddNotificationScreen);
  }
}
