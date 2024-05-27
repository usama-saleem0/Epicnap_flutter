
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/register_screen_controller.dart';
import '../../utils/app_constant.dart';
import '../custom_widgets/custom_textfield.dart';




class RegisterScreen extends GetView<RegisterScreenController>{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
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
                    // const Padding(
                    //   padding: EdgeInsets.only(bottom: 10),
                    //   child: Text(
                    //     'abiola.co',
                    //     style: TextStyle(
                    //       color: Color(0xffE17922),
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

                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Align the buttons to the center horizontally
                        children: [
                          Obx(
                          ()=>ElevatedButton(
                              onPressed: () {
                                controller.isUser.value = true;
                                // Handle the first button press
                              },
                              style: ElevatedButton.styleFrom(
                                primary:controller.isUser.value? CustomAppColor.kOrange:CustomAppColor.kWhiteColor,
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child:  Text(
                                  'As a User',
                                  style: TextStyle(fontSize: 18, color: controller.isUser.value?CustomAppColor.kWhiteColor:Colors.black54),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16), // Add spacing between the two buttons
                          Obx(
                              ()=> ElevatedButton(
                              onPressed: () {
                                controller.isUser.value = false;
                                // Handle the second button press
                              },
                              style: ElevatedButton.styleFrom(
                                primary: controller.isUser.value ? CustomAppColor.kWhiteColor:CustomAppColor.kOrange, // Change the color for the second button
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              child:  Text(
                                'As a Influencer',
                                style: TextStyle(fontSize: 18, color: controller.isUser.value ?Colors.black54:CustomAppColor.kWhiteColor ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Hello!',
                      style: TextStyle(
                        color: Color(0xffFFBA59),
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Register to get started',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child:CustomTextField(controller: controller.usernameController,hintText: "Name",prefixIcon:const Icon(
                        Icons.person,
                        color: Color(0xffc7cdd2),
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child:CustomTextField(controller: controller.emailController,hintText: "Email",prefixIcon:const Icon(
                        Icons.email,
                        color: Color(0xffc7cdd2),
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child:CustomTextField(controller: controller.passwordController,hintText: "Password",
                        isPassword: true,
                        showPassword: true,
                        prefixIcon:const Icon(
                        Icons.lock,

                        color: Color(0xffc7cdd2),
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child:CustomTextField(controller: controller.confirmpasswordController,hintText: "Confirm Password",
                        isPassword: true,
                        showPassword: true,
                        prefixIcon:const Icon(
                          Icons.lock,

                          color: Color(0xffc7cdd2),
                        ),),
                    ),
                    // buildEmail(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child:CustomTextField(controller: controller.countryController,hintText: "Country",

                        prefixIcon:const Icon(
                          Icons.public,

                          color: Color(0xffc7cdd2),
                        ),),
                    ),
                   // Add spacing between the buttons
                    const SizedBox(height: 30),
        
        
                    CustomPrimaryButton(buttonText: "Create Account", onButtonPressed: (){
                      // controller.register();
                    },
                      buttonColor: CustomAppColor.kBlackColor,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30 , top:5),
                      child: Text(
                        'Or Register with',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
        
                        ),
                      ),
                    ),
        
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
        
                        _buildIcon('assets/google_logo.png', const Color(0xff000000)),
                        const SizedBox(width: 20),
                        _buildIcon('assets/facebook_logo.png', const Color(0xff000000)),
                        const SizedBox(width: 20),
                        _buildIcon('assets/apple.png', const Color(0xff000000)),
                      ],
                    ),
        
        
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, top: 40),
                      child: RichText(
                        text:  TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Login now',
                              style: const TextStyle(
                                color: Color(0xffFFBA59), // Set brown color for 'Register now'
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()..onTap=(){
                                Get.toNamed(AppConstant.kLoginScreen);
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

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: const Border.symmetric(),
            boxShadow: [
              const BoxShadow(
                color: Colors.white12,
                blurRadius: 6,
                offset: Offset(0, 2),
              )
            ],
          ),
          height: 60,
          child: const TextField(
            // controller: emailController,  // Attach the controller here
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xffc7cdd2),
              ),
              hintText: 'Email',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
            ),
            // Capture the email input
          ),
        ),
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(
                color: Colors.white12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
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
                color: Color(0xffdbdfe3),
              ),
              hintText: 'Password',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
            ),
             // Attach the controller for the password
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              const BoxShadow(
                color: Colors.white12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
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
                color: Color(0xffdbdfe3),
              ),
              hintText: 'Confirm Password',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
            ),
             // Attach the same controller for confirm password
          ),
        ),
      ],
    );
  }

  Widget buildCountry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: const Border.symmetric(),
            boxShadow: [
              const BoxShadow(
                color: Colors.white12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          child: const TextField(
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.public,
                color: Color(0xffc7cdd2),
              ),
              hintText: 'Country',
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
            ),
             // Attach the controller for the Country
          ),
        ),
      ],
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
        padding: const EdgeInsets.all(6), // Adjust padding if necessary
        child: Image.asset(
          imagePath,
          width: 60, // Set the width of the logo
          height: 30, // Set the height of the logo
          color: Colors.grey[200], // Set icon color here
        ),
      ),
    );
  }

}