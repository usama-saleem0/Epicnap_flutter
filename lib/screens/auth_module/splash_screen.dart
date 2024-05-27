import 'dart:async';

import 'package:first_project/controller/auth_module_controller/splash_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashScreenController>{
  // const SplashScreen({super.key});
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.offNamed(AppConstant.kNewLoginScreen);
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF281f57),
              Color(0xFF161D34),
              Color(0xFF161D34),
              Color(0xFF281f57),
            ],
            stops: [0.0, 0.1, 0.85, 1.0],
          ),
        ),
        child: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 200),
                // Container(
                //   color: Colors.transparent,
                //
                //   child: Image.asset(
                //     'assets/White version 1.png',
                //     width: 280,
                //   ),
                // ),
                Obx(() => AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: controller.opacity.value,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    width: 280,
                    height: 280,
                    transform: Matrix4.identity()..scale(controller.scale.value),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/White version 1.png'),
                      ),
                    ),
                  ),
                )),

                SizedBox(height: 30),



              ],
            ),
          ),
        ),
      ),
    );
  }


}