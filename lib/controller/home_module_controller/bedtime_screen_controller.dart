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

class BedTimeScreenController extends GetxController {
  // late UserModel storeModel;
  // DashboardScreenController dashboardScreenController =
  // Get.find<DashboardScreenController>();
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  UserModel? userModel;
  var switches = <RxBool>[].obs;
  RxBool isSwitched = false.obs;
  RxBool notifySwitched = false.obs;
  RxBool isAlarmSwitched = false.obs;

  RxBool isSwitched2 = false.obs;
  RxBool isSwitched3 = false.obs;
  RxString alarmTime = '00:00'.obs;
  RxString bedTime = '00:00'.obs;

  RxInt indexValue = 0. obs;





  void initializeSwitches(int count) {
    switches.value = List.generate(userModel?.notify?.length?? 0, (index) => false.obs);
  }
  RxList<AlarmModel> alarms = <AlarmModel>[].obs;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final AudioPlayer audioPlayer = AudioPlayer();


  // Variables to store selected alarm time and song path
  Rx<DateTime?> selectedTime = Rx<DateTime?>(DateTime.now());
  String selectedSongPath = 'https://epicnap.com/wp-content/uploads/2024/02/Drifting-into-sleep-final-1-2.mp3';

  @override
  void onInit() {
    super.onInit();
    initializeNotifications();
    loadUserModel();
    // getUserModelFromSharedPreferences();
  }





  // Future<void> getUserModelFromSharedPreferences() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userModelJson = prefs.getString('userModel');
  //   if (userModelJson != null) {
  //     // Convert the serialized string back into a UserModel object
  //     storeModel = UserModel.fromJson(jsonDecode(userModelJson), "");
  //   } else {
  //     // Handle the case where userModelJson is null
  //   }
  // }




  // void initializeNotifications() async {
  //
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //   AndroidInitializationSettings('@mipmap/ic_launcher');
  //
  //   final InitializationSettings initializationSettings =
  //   InitializationSettings(android: initializationSettingsAndroid);
  //
  //
  //   // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  //
  //
  // }


  void initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    // DarwinNotificationDetails(threadIdentifier: 'thread_id');

    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (id, title, body, payload) async {
          // Handle the notification tapped logic here
        });


    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future<void> showNotification(String title, String body) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'alarm_notification',
      'Alarm Notification',
      // 'Channel for alarm notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  // Future<void> playAlarm(String assetPath) async {
  //   final player = AudioPlayer();
  //   await player.play(UrlSource('https://epicnap.com/wp-content/uploads/2024/02/Drifting-into-sleep-final-1-2.mp3'));
  //
  // }

  // void onDidReceiveNotificationResponse(
  //      String? payload) async {
  //
  //
  // }

  // void playAlarm(String assetPath) async {
  //   await audioPlayer.play(UrlSource(assetPath));
  //
  //   // Show notification with action button to stop the music
  //   await flutterLocalNotificationsPlugin.show(
  //     1,
  //     'Alarm is playing',
  //     'Tap to stop the alarm',
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'alarm_notification',
  //         'Alarm Notification',
  //         importance: Importance.high,
  //         priority: Priority.high,
  //         enableVibration: true,
  //
  //         playSound: false, // Disable sound to prevent duplicate sound with audioPlayer
  //       ),
  //     ),
  //     payload: 'stop_music', // Use a unique payload to identify the action
  //   );
  // }



  void playAlarm(String assetPath) async {
    await audioPlayer.play(UrlSource(assetPath));

    // Show notification with action button to stop the music
    await flutterLocalNotificationsPlugin.show(
      1,
      'Alarm is playing',
      'Tap to stop the alarm',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          importance: Importance.high,
          priority: Priority.high,
          enableVibration: true,

          playSound: false, // Disable sound to prevent duplicate sound with audioPlayer
        ),
        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      payload: 'stop_music', // Use a unique payload to identify the action
    );
  }


  void playtime() async {


    // Show notification with action button to stop the music
    await flutterLocalNotificationsPlugin.show(
      1,
      'Its time to go bed',
      'this is your bedtime routine',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          importance: Importance.high,
          priority: Priority.high,
          enableVibration: true,

          playSound: false, // Disable sound to prevent duplicate sound with audioPlayer
        ),

        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      payload: 'stop_music', // Use a unique payload to identify the action
    );
  }

  void playBrush() async {


    // Show notification with action button to stop the music
    await flutterLocalNotificationsPlugin.show(
      1,
      // 'Its time to Brush teeth',

      userModel?.notify?[indexValue.value]?.title ?? '',
      'Hurry up please follow the Notification',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          importance: Importance.high,
          priority: Priority.high,
          enableVibration: true,

          playSound: false, // Disable sound to prevent duplicate sound with audioPlayer
        ),

        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      payload: 'stop_music', // Use a unique payload to identify the action
    );
  }


  void playDrink() async {


    // Show notification with action button to stop the music
    await flutterLocalNotificationsPlugin.show(
      1,
      'Its time to Drink water',
      'this is your Drinking water time routine',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          importance: Importance.high,
          priority: Priority.high,
          enableVibration: true,

          playSound: false, // Disable sound to prevent duplicate sound with audioPlayer
        ),
        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      payload: 'stop_music', // Use a unique payload to identify the action
    );
  }


  void playMeditation() async {


    // Show notification with action button to stop the music
    await flutterLocalNotificationsPlugin.show(
      1,
      'Its time to Listen Meditate',
      'this is your Listing meditation time routine',
      NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          importance: Importance.high,
          priority: Priority.high,
          enableVibration: true,

          playSound: false, // Disable sound to prevent duplicate sound with audioPlayer
        ),
        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      payload: 'stop_music', // Use a unique payload to identify the action
    );
  }

  void selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      selectedTime.value = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
    print(selectedTime.value);
    saveSelectedTime(selectedTime.value);
  }


  void scheduleAlarm(String audioUrl) async {
    // Check if selectedTime is null
    DateTime? savedTime = await getSavedTime();




    if (savedTime  == null) {
      Get.snackbar(
        'Error',
        'Please select an alarm time',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }


    alarmTime.value = savedTime.toString() ?? '00:00';
    print( 'alarm time ${alarmTime.value}');
    // Convert selectedTime to TZDateTime using the local timezone
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(
      savedTime,

      tz.local,
    );

    // Calculate time until alarm
    final now = tz.TZDateTime.now(tz.local);
    final timeUntilAlarm = scheduledTime.difference(now);

    print('timer $scheduledTime , now $now');

    // Ensure selectedTime is not in the past
    if (timeUntilAlarm.isNegative) {
      Get.snackbar(
        'Error',
        'Selected alarm time has already passed',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Schedule notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Wake up!',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          // 'Channel for alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
        ),

        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
    Get.back();
    // Schedule audio playing
    Future.delayed(timeUntilAlarm, () {
      playAlarm(audioUrl);
    });
    Store(audioUrl);


  }


  void scheduleAlarms() async {
    // Check if selectedTime is null

    print('bedtime ${selectedTime.value}');

    bedTime.value = selectedTime.value.toString() ?? '00:00' ;
    print( 'alarm time ${alarmTime.value}');
    if (selectedTime.value == null) {
      Get.snackbar(
        'Error',
        'Please select an alarm time',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Convert selectedTime to TZDateTime using the local timezone
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(
      selectedTime.value!,
      tz.local,
    );

    // Calculate time until alarm
    final now = tz.TZDateTime.now(tz.local);
    final timeUntilAlarm = scheduledTime.difference(now);

    // Ensure selectedTime is not in the past
    if (timeUntilAlarm.isNegative) {
      Get.snackbar(
        'Error',
        'Selected bed time has already passed',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Schedule notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Wake up!',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          // 'Channel for alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
        ),
        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );

    print('time , $timeUntilAlarm');
    // Get.back();
    Future.delayed(timeUntilAlarm, () {
      playtime();
    });

    bedTimeStore();
    if(isSwitched.value){
      notifyBrush();
    }


    if(isSwitched2.value){
      notifyDrink();
    }


    if(isSwitched3.value){
      notifyMeditation();
    }

  }


  void notifyBrush() async {
    print('brush');
    // Check if selectedTime is null
    if (selectedTime.value == null) {
      Get.snackbar(
        'Error',
        'Please select an alarm time',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Convert selectedTime to TZDateTime using the local timezone
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(
      selectedTime.value!,
      tz.local,
    );

    // Calculate time until alarm
    final now = tz.TZDateTime.now(tz.local);
    final timeUntilAlarm = scheduledTime.difference(now);

    // Ensure selectedTime is not in the past
    if (timeUntilAlarm.isNegative) {
      Get.snackbar(
        'Error',
        'Selected bed time has already passed',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // final int notifyTime = userModel?.notify?[indexValue.value]?.time?? 0;
    // final timeBeforeAlarm = timeUntilAlarm - const Duration(minutes: notifyTime);
    final int notifyTime = userModel?.notify?[indexValue.value]?.time ?? 0;
    print(' timeron  $notifyTime');
    final timeBeforeAlarm = timeUntilAlarm - Duration(minutes: notifyTime);
    // Schedule notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Wake up!',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          // 'Channel for alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
        ),
        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),


      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );

    print('time , $timeUntilAlarm');
    // Get.back();
    Future.delayed(timeBeforeAlarm, () {
      playBrush();
    });

    // bedTimeStore();

  }


  void notifyDrink() async {
    print('brush');
    // Check if selectedTime is null
    if (selectedTime.value == null) {
      Get.snackbar(
        'Error',
        'Please select an alarm time',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Convert selectedTime to TZDateTime using the local timezone
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(
      selectedTime.value!,
      tz.local,
    );

    // Calculate time until alarm
    final now = tz.TZDateTime.now(tz.local);
    final timeUntilAlarm = scheduledTime.difference(now);

    // Ensure selectedTime is not in the past
    if (timeUntilAlarm.isNegative) {
      Get.snackbar(
        'Error',
        'Selected bed time has already passed',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    final timeBeforeAlarm = timeUntilAlarm - const Duration(minutes: 15);
    // Schedule notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Wake up!',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          // 'Channel for alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
        ),
        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );

    print('time , $timeUntilAlarm');
    // Get.back();
    Future.delayed(timeBeforeAlarm, () {
      playDrink();
    });

    // bedTimeStore();

  }

  void notifyMeditation() async {
    print('brush');
    // Check if selectedTime is null
    if (selectedTime.value == null) {
      Get.snackbar(
        'Error',
        'Please select an alarm time',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    // Convert selectedTime to TZDateTime using the local timezone
    tz.TZDateTime scheduledTime = tz.TZDateTime.from(
      selectedTime.value!,
      tz.local,
    );

    // Calculate time until alarm
    final now = tz.TZDateTime.now(tz.local);
    final timeUntilAlarm = scheduledTime.difference(now);

    // Ensure selectedTime is not in the past
    if (timeUntilAlarm.isNegative) {
      Get.snackbar(
        'Error',
        'Selected bed time has already passed',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    final timeBeforeAlarm = timeUntilAlarm - const Duration(minutes: 10);
    // Schedule notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Wake up!',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'alarm_notification',
          'Alarm Notification',
          // 'Channel for alarm notifications',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
        ),
        iOS: DarwinNotificationDetails(
          threadIdentifier: 'thread_id', // Specify a thread identifier for iOS
          presentSound: true, // Specify to play sound on iOS
          presentAlert: true, // Specify to show alert on iOS
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );

    print('time , $timeUntilAlarm');
    // Get.back();
    Future.delayed(timeBeforeAlarm, () {
      playMeditation();
    });

    // bedTimeStore();

  }
  UserServices userServices = UserServices();
  ProgressDialog progressDialog = ProgressDialog();

  Future<void> bedTimeStore() async {
    print('bedtime');
    progressDialog.showDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);
    DateTime? dateTimeValue = selectedTime.value;
    if (userId != null && dateTimeValue != null) {
      // Call storeAlarm with userId
      UserModel userModel = await userServices.storeBedtime(id: userId, timer: dateTimeValue);

      print(userModel.toString());
      if (userModel.message == "successful") {
        print(userModel.name);

        progressDialog.dismissDialog();
        Get.off(() => AnalysisScreen(), arguments: userModel);

      } else {
        progressDialog.dismissDialog();
      }
    } else {
      // Handle the case where userId is null
      print("User ID is null");
      progressDialog.dismissDialog();
    }
  }

  
  Future<void> Store(String song) async {
    progressDialog.showDialog();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    print(userId);
    DateTime? dateTimeValue = await getSavedTime();

    print('values $dateTimeValue');
    // DateTime? dateTimeValue = selectedTime.value;
    if (userId != null && dateTimeValue != null) {
      // Call storeAlarm with userId
      UserModel userModel = await userServices.storeAlarm(id: userId, song: song, timer: dateTimeValue);

      print(userModel.toString());
      if (userModel.message == "successful") {
        print(userModel.name);

        progressDialog.dismissDialog();
        Get.off(() => AlarmScreen(), arguments: userModel);
        // Get.off(() => AlarmScreen(userModel: userModel));

        // Get.back();
        // Get.to(() => AlarmScreen(userModel: userModel));
        //

      } else {
        progressDialog.dismissDialog();
      }
    } else {
      // Handle the case where userId is null
      print("User ID is null");
      progressDialog.dismissDialog();
    }
  }



  // void scheduleAlarm() async {
  //   // Check if selectedTime is null
  //   if (selectedTime.value == null) {
  //     Get.snackbar(
  //       'Error',
  //       'Please select an alarm time',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }
  //
  //   // Convert selectedTime to TZDateTime using the local timezone
  //   tz.TZDateTime scheduledTime = tz.TZDateTime.from(
  //     selectedTime.value!,
  //     tz.local,
  //   );
  //
  //   // Calculate time until alarm
  //   final now = tz.TZDateTime.now(tz.local);
  //   final timeUntilAlarm = scheduledTime.difference(now);
  //
  //   // Ensure selectedTime is not in the past
  //   if (timeUntilAlarm.isNegative) {
  //     Get.snackbar(
  //       'Error',
  //       'Selected alarm time has already passed',
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     return;
  //   }
  //
  //   // Schedule notification
  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     0,
  //     'Alarm',
  //     'Wake up!',
  //     scheduledTime,
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'alarm_notification',
  //         'Alarm Notification',
  //         importance: Importance.max,
  //         priority: Priority.high,
  //         enableVibration: true,
  //       ),
  //     ),
  //     androidAllowWhileIdle: true,
  //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  //
  //   // Show a notification with an action button to stop the music
  //   await flutterLocalNotificationsPlugin.show(
  //     1,
  //     'Stop Music',
  //     'Tap to stop the alarm',
  //     NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'stop_music_channel',
  //         'Stop Music',
  //         importance: Importance.high,
  //         priority: Priority.high,
  //       ),
  //     ),
  //     payload: 'stop_music',
  //   );
  //
  //   // Schedule audio playing
  //   Future.delayed(timeUntilAlarm, () {
  //     playAlarm(selectedSongPath);
  //   });
  // }

  void onInfluncerTap(
      {required String title,
        required String description,
        required String imageUrl}) {
    Get.toNamed(AppConstant.kSingleInfluencerScreen,
        arguments: [title, description, imageUrl]);
  }

  void onCourseTap(
      {required String title,
        required String description,
        required String imageUrl}) {
    Get.toNamed(AppConstant.kSingleCourseScreen,
        arguments: [title, description, imageUrl]);
  }

  void onDashboardTap() {
    Get.toNamed(AppConstant.kDashboardScreen);
  }

  void onTracking() {
    Get.toNamed(AppConstant.kTrackingScreen);
  }

  void onanalysisTap() {
    Get.toNamed(AppConstant.kMUSICScreen);
  }


  void saveSelectedTime(DateTime? selectedTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedTime', selectedTime.toString());
  }

// Retrieve selected time value from SharedPreferences
  Future<DateTime?> getSavedTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTimeStr = prefs.getString('selectedTime');
    if (savedTimeStr != null) {
      return DateTime.parse(savedTimeStr);
      print('timing ${DateTime.parse(savedTimeStr)}');
    }
    return null; // Return null if no value is saved
  }

  void onDidReceiveNotificationResponse(NotificationResponse details) async {
    await audioPlayer.stop();
  }


  void onLibraryScreen(){
    Get.toNamed(AppConstant.kLibraryScreen);
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



  // Future<void> addNotification() async{
  //   int time;
  //   progressDialog.showDialog();
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int? userId = prefs.getInt('userId');
  //
  //   time = int.parse(timeController.text);
  //
  //   print(userId);
  //
  //   if (userId != null ) {
  //     String res = await userServices.savenotification(title: titleController.text,
  //         time: time,
  //
  //         user_id:userId);
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
        Get.to(() => BedTimeScreen(), arguments: userModel);
        // Get.back();



        progressDialog.dismissDialog();



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
