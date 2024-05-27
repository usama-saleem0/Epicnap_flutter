import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_datefield.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../custom_widgets/custom_textfield.dart';

class NameScreen extends GetView<NameScreenController>{
  const NameScreen({super.key});

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
          child: ListView(
              padding: EdgeInsets.all(0), // Remove any padding
              children: [
             Container(
              margin: EdgeInsets.only(top: 190, bottom: 0,right: 30,left: 30), // Adjust margin for the paddings
              padding: EdgeInsets.all(20), // Adjust padding for the entire content
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF).withOpacity(0.1), // Set your desired box color
                borderRadius: BorderRadius.circular(20), // Optional: Add border radius
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(right: 30,left: 30, top: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      'What’s your name?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,


                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50,),
                    child:CustomTextField(controller: controller.nameController,hintText: "Your Name",


                    ),
                  ),






                  Padding(
                    padding: EdgeInsets.only(right: 40,left: 40, top:50 ),
                    child: CustomPrimaryButton(buttonText: "Next", onButtonPressed: (){
                      controller.onLoginTap();
                    },
                      buttonColor: Color(0xff8650F6),
                    ),
                  ),

                  SizedBox(height: 30,)


                ],
              ),
            ),
        ],
          ),
        ),
      ),
    );
  }


}