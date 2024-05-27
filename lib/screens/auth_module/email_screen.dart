import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/email_screen_controller.dart';
import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../custom_widgets/custom_textfield.dart';

class EmailScreen extends GetView<EmailScreenController>{
  const EmailScreen({super.key});

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
              margin: EdgeInsets.only(top: 120, bottom: 60,right: 30,left: 30), // Adjust margin for the paddings
              padding: EdgeInsets.all(20), // Adjust padding for the entire content
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF).withOpacity(0.1), // Set your desired box color
                borderRadius: BorderRadius.circular(20), // Optional: Add border radius
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.only(right: 30,left: 30, top: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      'We’re almost done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,


                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right:0, left: 5, top: 50, bottom: 10),
                        child: Text(
                          textAlign: TextAlign.start,
                          'Enter your email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,


                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0,),
                    child:CustomTextField(controller: controller.emailController,hintText: "yourmail@email.com"

                    ),
                  ),


                  Padding(
                    padding: EdgeInsets.only(right: 40,left: 40, top:50 ),
                    child: CustomPrimaryButton(buttonText: "Continue", onButtonPressed: (){
                      controller.onLoginTap();
                    },
                      buttonColor: Color(0xff8650F6),
                    ),
                  ),


                  // Divider(height: 100,),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            height: 100,

                          ),
                        ),
                      ),
                      Text(
                        'Or continue with',
                        style: TextStyle(
                          color: Colors.white, // Set text color
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(
                            height: 100,
                             // Set divider color
                          ),
                        ),
                      ),
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left:12, right:12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Expanded(
                            flex: 1,
                      child: Image.asset(
                        'assets/Group_facebook.png',


                      ),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                            flex: 1,


                          child: Image.asset(
                            'assets/Group_google.png',
                            // width: 30,
                            // height: 25,

                          ),
                            // child: _buildIcon('assets/Group_google.png', const Color(0xff000))),


                        ),

                      ],
                    ),
                  ),

                  SizedBox(height: 40,)




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