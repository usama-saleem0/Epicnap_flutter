import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/screens/custom_widgets/custom_textfield.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/login_screen_controller.dart';


class LoginScreen extends GetView<LoginScreenController>{
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(

              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffF5F5FF),

              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // const Padding(
                      //   padding: EdgeInsets.only(bottom: 20 ),
                      //   child: Text(
                      //     'abiola.co',
                      //     style: TextStyle(
                      //       color: Color(0xffDA8938),
                      //       fontSize: 48,
                      //       fontWeight: FontWeight.bold,
                      //
                      //     ),
                      //   ),
                      // ),
                        SizedBox(height: 20,),
                       Image.asset(
                        'assets/abiola.png', // Replace with the path to your back icon image
                         // Adjust the height according to your design
                      ),
                      SizedBox(height: 30,),
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Text(
                        'Glad to see you, Again',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,

                        ),
                      ),


                      // Padding(
                      //   padding: const EdgeInsets.only(left: 28, right: 28),
                      //   child: Center(
                      //     child: const Text(
                      //       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                      //       style: TextStyle(
                      //         color: Colors.black87,
                      //         fontSize: 16,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Back for more brilliance? Log in now and lets pick up where you left off!',
                          style: TextStyle(
                            color: Color(0xff8391A1),
                            fontSize: 16,


                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 50,bottom: 20),
                        child:CustomTextField(controller: controller.emailController,hintText: "Enter your Email",prefixIcon:const Icon(
                          Icons.email,

                        ),),
                      ),
                      CustomTextField(controller: controller.passwordController,
                        isPassword: true,
                        showPassword: true,

                        hintText: "Password",prefixIcon: const Icon(
                        Icons.lock,
                        // color: Color(0xff566573),

                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom: 30),
                        child: Align(
                          alignment: Alignment
                              .centerRight, // Align "Forgot Password?" to the right
                          child: TextButton(
                            onPressed: () {
                              // Get.to(Forget());
                              controller.onForgotTap();
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomPrimaryButton(buttonText: "Sign In", onButtonPressed: (){
                       // controller.login();
                      },
                      buttonColor: CustomAppColor.kBlackColor,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30 , top:20),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left:30, right:30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(
                                flex: 1,
                                child: _buildIcon('assets/google_logo.png', const Color(0xff000))),
                            const SizedBox(width: 25),
                            Expanded(
                                flex: 1,
                                child: _buildIcon('assets/facebook_logo.png', const Color(0xff000))),
                            const SizedBox(width: 20),
                            Expanded(
                                flex: 1,
                                child: _buildIcon('assets/apple.png', const Color(0xff000))),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 40 , ),
                        child: RichText(

                          text: TextSpan(
                            children: [
                               const TextSpan(
                                text: 'Dont have a account? ',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                               TextSpan(
                                text:'Register now',
                                style: const TextStyle(
                                  color: Color(0xffFFBA59), // Set brown color for 'Register now'
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ), recognizer: TapGestureRecognizer()..onTap=(){
                                Get.toNamed(AppConstant.kRegisterScreen);
                              }
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
      ),

    );
  }

  Widget _buildIcon(String imagePath, Color borderColor) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Set border radius here
        border: Border.all(color: borderColor, width: 3),
        color: const Color(0xff000000),
        // Set border color and width here
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10), // Adjust padding if necessary
        child: Image.asset(
          imagePath,
          width: 30, // Set the width of the logo
          height: 25, // Set the height of the logo
          color: Colors.grey[200], // Set icon color here
        ),
      ),
    );
  }


  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                const BoxShadow(
                    color: Colors.white12, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: const TextField(

            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,

                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  // color: Color(0xff566573),
                  color: Color(0xffdbdfe3),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  // color: Colors.white,
                )),
          ),
        )
      ],
    );
  }


}