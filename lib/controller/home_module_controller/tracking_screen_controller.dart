import 'dart:async';

import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

// class TrackingScreenController  extends GetxController{
//   TextEditingController nameController = TextEditingController();
//
//   DashboardScreenController dashboardScreenController=Get.find<DashboardScreenController>();
//   final _stopWatchTimer = StopWatchTimer();
//   final _isRunning = false.obs;
//   final _elapsedTime = '00:00:00'.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _stopWatchTimer.rawTime.listen((value) {
//       _elapsedTime.value = StopWatchTimer.getDisplayTime(value);
//     });
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//     _stopWatchTimer.dispose();
//   }
//
//   void startTimer() {
//     _stopWatchTimer.onStartTimer();
//     _isRunning.value = true;
//   }
//
//   void stopTimer() {
//     _stopWatchTimer.onStopTimer();
//     _isRunning.value = false;
//   }
//
//   void resetTimer() {
//     _stopWatchTimer.onResetTimer();
//     _elapsedTime.value = '00:00:00';
//   }
//
//   void onLoginTap(){
//     Get.toNamed(AppConstant.kAcceptScreen);
//   }
//
//   void onRegisterTap(){
//     Get.toNamed(AppConstant.kAlarmScreen);
//   }
//
//   void onMusicTap(){
//     Get.toNamed(AppConstant.kMUSICScreen);
//   }

class TrackingScreenController extends GetxController {
  TextEditingController nameController = TextEditingController();

  DashboardScreenController dashboardScreenController = Get.find<DashboardScreenController>();
  final _stopWatchTimer = StopWatchTimer();
  final _isRunning = false.obs;
  final _elapsedTime = '00:00:00'.obs;

  @override
  void onInit() {
    super.onInit();
    _stopWatchTimer.rawTime.listen((value) {
      _elapsedTime.value = StopWatchTimer.getDisplayTime(value);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _stopWatchTimer.dispose();
  }

  void startTimer() {
    print('object');
    _stopWatchTimer.onStartTimer();
    _isRunning.value = true;
  }

  void stopTimer() {
    _stopWatchTimer.onStopTimer();
    _isRunning.value = false;
  }

  void resetTimer() {
    _stopWatchTimer.onResetTimer();
    _elapsedTime.value = '00:00:00';
  }

  void onLoginTap() {
    Get.toNamed(AppConstant.kAcceptScreen);
  }

  void onRegisterTap() {
    Get.toNamed(AppConstant.kAlarmScreen);
  }

  void onMusicTap() {
    Get.toNamed(AppConstant.kMUSICScreen);
  }

  String get elapsedTime => _elapsedTime.value;
}

