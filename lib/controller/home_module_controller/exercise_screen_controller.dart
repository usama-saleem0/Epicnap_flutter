import 'dart:async';

import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

 class ExerciseScreenController  extends GetxController  {
  RxInt number = 4.obs;
  RxInt number2 = 6.obs;
  RxInt number3 = 8.obs;
   RxInt _secondFlex = 2.obs;
  // late RxBool _isHolding;
  RxBool _isHolding = false.obs;
  RxBool isAnimationPlaying = false.obs;
  Timer? _animationTimer;

  RxBool isAnimationsPlaying = false.obs;
  RxBool showStartButton = true.obs;

  RxDouble animationValue = 0.25.obs;
  late AnimationController animationController;
  late Timer animationTimer;
  late AnimationController _animationController;

  void startAnimation() {
    showStartButton.value = false; // Hide the start button
    isAnimationsPlaying.value = true;
    _animationTimer?.cancel(); // Cancel previous timer if any
    _animationTimer = Timer.periodic(Duration(seconds: number.value), (timer) {
      if (isAnimationPlaying.value) {
        _secondFlex.value = 2;
        // _secondFlex.value = number.value - number2.value;
        isAnimationPlaying.value = false;
      } else {
        if (_secondFlex.value == 5) {
          // _secondFlex.value = number2.value - number3.value;
          _secondFlex.value = 2;
          isAnimationPlaying.value = true;
        } else {
          _secondFlex.value = 5;
        }
      }
    });
  }

  RxInt get secondFlex => _secondFlex;

  void onClose() {
    showStartButton.value = true; // Show the start button
    isAnimationsPlaying.value = false;
    _animationTimer?.cancel(); // Cancel timer on controller close
    super.onClose();
  }
  void onLoginTap(){
    Get.toNamed(AppConstant.kAcceptScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kBedtimeScreen);
  }

  void increment() {
    number++;
  }

  void increment2() {
    number2++;
  }

  void increment3() {
    number3++;
  }

  void decrement() {
    number--;
  }

  void decrement2() {
    number2--;
  }

  void decrement3() {
    number3--;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 6),
  //   )..addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       animationController.reverse();
  //     } else if (status == AnimationStatus.dismissed) {
  //       animationController.forward();
  //     }
  //   });
  //   animationController.forward();
  // }
  //
  // void startAnimations() {
  //   isAnimationPlaying.value = true;
  //   animationTimer = Timer.periodic(Duration(seconds: 2), (timer) {
  //     if (animationController.status == AnimationStatus.completed) {
  //       animationController.reverse();
  //     } else if (animationController.status == AnimationStatus.dismissed) {
  //       animationController.forward();
  //     }
  //   });
  // }
  //
  // @override
  // void onCloses() {
  //   animationController.dispose();
  //   animationTimer.cancel();
  //   super.onClose();
  // }

  //
  // RxDouble animationValue = 0.25.obs;
  // late AnimationController animationController;
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   animationController = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 6),
  //   )..addStatusListener((status) {
  //     if (status == AnimationStatus.completed) {
  //       animationController.reverse();
  //     } else if (status == AnimationStatus.dismissed) {
  //       animationController.forward();
  //     }
  //   });
  //   animationController.forward();
  // }
  //
  // @override
  // void onCloses() {
  //   animationController.dispose();
  //   super.onClose();
  // }
  //
  // void updateAnimationValue(double value) {
  //   animationValue.value = value;
  // }


}