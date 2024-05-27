import 'package:first_project/controller/auth_module_controller/analysis_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/breathing_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/screens/home_module/animation_screen.dart';
import 'package:first_project/screens/home_module/antisleep.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreathingScreen extends GetView<BreathingScreenController> {
  const BreathingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30),// Wrap your Column with a Container
                    height: MediaQuery.of(context).size.height * 0.9, // Adjust the height as needed
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Color(0xFF161D34),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: Image.asset(
                                          'assets/previous.png',
                                          width: 25,
                                          height: 25,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 300,
                                        padding: const EdgeInsets.only(right: 25.0),
                                        child: Center(
                                          child: Text(
                                            'Breathing exercise',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.only(left: 30, right: 30),
              
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                                    ),
              
                                    // color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xff8650F6),
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
                                    ),
              
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
              
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(
              
                              horizontal: 60
                          ),
                          child: CustomPrimaryButton(buttonText: 'Start Exercise', onButtonPressed: (){
                            controller.onRegisterTap();
                            // Get.to(() => AnimationScreen());

                          },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
                        ),
              
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BreathingScreen(),
  ));
}
