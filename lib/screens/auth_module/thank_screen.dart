
import 'package:first_project/controller/auth_module_controller/thank_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/accept_screen_controller.dart';
import '../custom_widgets/custom_primary_button.dart';

class ThankScreen extends GetView<ThankScreenController>{
  const ThankScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                // SizedBox(height: 250),
                Container(
                  color: Colors.transparent,

                  child: Text(
                    textAlign: TextAlign.center,
                    'Thank You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,


                    ),
                  ),

                  // child: Image.asset(
                  //   'assets/White version 1.png',
                  //   width: 220,
                  // ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(right: 30,left: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    'We thank you for considering participation in this study and for contributing to the advancement of sleep health research. Your involvement is instrumental in shaping the future of sleep interventions and mental well-being.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      // fontWeight: FontWeight.bold,


                    ),
                    overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                    maxLines: 12,
                  ),
                ),


                Padding(
                  padding: EdgeInsets.only(right: 60,left: 60, top:30 ),
                  child: CustomPrimaryButton(buttonText: "Continue Setup", onButtonPressed: (){
                    controller.onLoginTap();
                  },
                    buttonColor: Color(0xff8650F6),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }


}