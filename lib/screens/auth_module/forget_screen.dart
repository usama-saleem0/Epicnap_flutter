
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/forget_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../custom_widgets/custom_primary_button.dart';
import '../custom_widgets/custom_textfield.dart';




class ForgetScreen extends GetView<ForgetScreenController> {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: <Widget>[
        
        
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xffF5F5FF)
        
                  ),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 8,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 20,),
                          Image.asset(
                            'assets/abiola.png', // Replace with the path to your back icon image
                            // Adjust the height according to your design
                          ),
                          SizedBox(height: 20,),
                          const Text(
                            'Forgot Password!',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Dont worry!  It occurs. Please enter the email address linked with your account.',
                              style: TextStyle(
                                color: Color(0xff8391A1),
                                fontSize: 16,


                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child:CustomTextField(controller: controller.emailController,hintText: "Email",prefixIcon:const Icon(
                              Icons.email,
                              color: Color(0xffc7cdd2),
                            ),),
                          ),



        
                        
        
                          const Padding(
                            padding: EdgeInsets.only(bottom: 30 ),

                          ),
                          CustomPrimaryButton(buttonText: "Send Code", height: 60, onButtonPressed: (){
                            // controller.login();
                            controller.onOtpTap();
                          },
                            buttonColor: CustomAppColor.kBlackColor,
                          ),


        
        
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 340),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Back to? ',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Login',
                                      style: const TextStyle(
                                        color: Color(0xffFFBA59),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    recognizer: TapGestureRecognizer()..onTap=() {
                                      Get.back();
                                    }
                                    ),
                                  ],
                                ),
                              ),
                            ),
        
                          ),
        
        
        
        
                        ]
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }


}



