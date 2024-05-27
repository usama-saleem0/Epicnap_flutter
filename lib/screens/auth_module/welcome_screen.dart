import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView<WelcomeScreenController>{
  const WelcomeScreen({super.key});

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
                SizedBox(height: 250),
                Container(
                  color: Colors.transparent,

                  child: Image.asset(
                    'assets/White version 1.png',
                    width: 220,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.only(right: 30,left: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Improve your sleep quality with us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,


                    ),
                  ),
                ),




                
                Padding(
                  padding: EdgeInsets.only(right: 20,left: 20, top:30 ),
                  child: GestureDetector(
                    onTap: () {
                      // Add your functionality or navigation logic here
                      controller.onLoginTap();
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 100, right: 100, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color:  Color(0xff8650F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Setup profile',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),


            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: Color(0xff8650F6),
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                      controller.onAlreadyLoginTap();
                        // Add navigation logic to the login screen
                      },
                  ),
                ],
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