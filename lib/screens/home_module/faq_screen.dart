import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/antisleep_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/history_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/privacy_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../custom_widgets/custom_textfield.dart';

class FaqScreen extends GetView<PrivacyScreenController>{

  const FaqScreen({Key? key}) : super(key: key);

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
          child: ListView(
            padding: EdgeInsets.all(0),

              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: GestureDetector(
                        onTap:(){
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Center(
                          child: Text(
                            'Help and Support',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),



                Row(
                  children: [
                    Expanded(


                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, top: 30),
                            child: Text(
                              'Frequently Ask Questions',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                  ],
                ),

                Container(
                  padding: const EdgeInsets.only(left:30, right:30, top: 15.0),

                  width: MediaQuery.of(context).size.width - 180,
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top:10, bottom: 10, right: 0, left: 0), // Adjust margin for the paddings
                              padding: EdgeInsets.all(10), // Adjust padding for the entire content
                              decoration: BoxDecoration(
                                color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                              ),
                              child: Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.onFaqTap();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Frequently Ask Questions',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),












                                          // Add other text widgets or content if needed
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),








                            ),

                          ),

                        ],
                      ),
                      // SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top:10, bottom: 10, right: 0, left: 0), // Adjust margin for the paddings
                              padding: EdgeInsets.all(10), // Adjust padding for the entire content
                              decoration: BoxDecoration(
                                color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                              ),
                              child: Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.onFaqTap();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Frequently Ask Questions',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),












                                          // Add other text widgets or content if needed
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),








                            ),

                          ),

                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top:10, bottom: 10, right: 0, left: 0), // Adjust margin for the paddings
                              padding: EdgeInsets.all(10), // Adjust padding for the entire content
                              decoration: BoxDecoration(
                                color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                              ),
                              child: Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.onFaqTap();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,



                                              children: [
                                                Text(
                                                  'Frequently Ask Questions',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),

                                                Container(
                                                  width: 300,
                                                  child: Text(
                                                    'Developing a fitness app involves collecting and processing personal data, which makes it crucial to address legal and privacy considerations to protect both your users and your business.',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                                                    maxLines: 4,  // Adjust the number of lines to show
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),












                                          // Add other text widgets or content if needed
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),








                            ),

                          ),

                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top:10, bottom: 10, right: 0, left: 0), // Adjust margin for the paddings
                              padding: EdgeInsets.all(10), // Adjust padding for the entire content
                              decoration: BoxDecoration(
                                color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                              ),
                              child: Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.onFaqTap();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Frequently Ask Questions',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),












                                          // Add other text widgets or content if needed
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),








                            ),

                          ),

                        ],
                      ),

                      Text(
                        'Developing a fitness app involves collecting and processing personal data, which makes it crucial to address legal and privacy considerations to protect both your users and your business.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 4,  // Adjust the number of lines to show
                      ),





                      SizedBox(height: 20,),

                      Row(
                        children: [
                          Container(
                            width:20,
                            child: Image.asset(
                              'assets/dot.png',
                              width: 50,

                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 300,
                            child: Text(
                              'Create a comprehensive privacy policy that outlines how you collect,',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                              maxLines: 4,  // Adjust the number of lines to show
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top:20, bottom: 10, right: 0, left: 0), // Adjust margin for the paddings
                              padding: EdgeInsets.all(10), // Adjust padding for the entire content
                              decoration: BoxDecoration(
                                color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                              ),
                              child: Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.onFaqTap();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Call for support',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/support.png',
                                                      width:25,
                                                ),


                                              ],
                                            ),
                                          ),












                                          // Add other text widgets or content if needed
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),








                            ),

                          ),

                        ],
                      ),

                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top:20, bottom: 10, right: 0, left: 0), // Adjust margin for the paddings
                              padding: EdgeInsets.all(10), // Adjust padding for the entire content
                              decoration: BoxDecoration(
                                color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                              ),
                              child: Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                    child: GestureDetector(
                                      onTap: () {
                                        // controller.onFaqTap();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Flexible(
                                            // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Contact us',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/mobile.png',
                                                  width:25,
                                                ),


                                              ],
                                            ),
                                          ),












                                          // Add other text widgets or content if needed
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),








                            ),

                          ),

                        ],
                      ),




                      SizedBox(height: 50,),


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