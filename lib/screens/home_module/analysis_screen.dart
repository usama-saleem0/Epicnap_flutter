import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/auth_module_controller/analysis_screen_controller.dart';
import '../../model/user_model.dart';

class AnalysisScreen extends GetView<AnalysisScreenController>{
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnalysisScreenController controller = Get.put(AnalysisScreenController());
    UserModel? userModel = Get.arguments as UserModel?;
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
                
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFF161D34),
                    child: Column(
                      children: [



                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          Get.back();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 20.0,),
                                          child: Image.asset(
                                            'assets/previous.png', // Replace with the path to your back icon image
                                            width: 15, // Adjust the width according to your design

                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30.0, top: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              '12 October, 2023',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),

                                            Text(
                                              'Sleep analysis',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  // Add other text widgets if needed
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0, top: 10),
                              child: GestureDetector(
                                // onTap:(){
                                //   controller.onbackTap();
                                // },
                                child: Image.asset(
                                  'assets/top.png',
                                  width: 50,

                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Image.asset(
                          'assets/Group 36730.png',
                          width: 250,
                          height: 250,
                        ),

                      ],
                    ),
                  ),
                ),


                Expanded(
                
                
                
                  flex: 1,
                  child: ClipRRect(
                
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: Container(
                      color: Color(0xff020305),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20,),

                              Text(
                                'Sleep information',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
                                      padding: EdgeInsets.all(10), // Adjust padding for the entire content
                                      decoration: BoxDecoration(
                                        color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                        borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white.withOpacity(0.1), // shadow color
                                                        spreadRadius: 0, // spread radius
                                                        blurRadius: 15, // blur radius
                                                        offset: Offset(0, 4), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    'assets/bed.png',
                                                    width: 40,
                                                  ),
                                                ),
                                              ),

                                              // Add other text widgets or content if needed
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      // '10 : PM',
                                                      // userModel !=null ?  formatTime(userModel!.lastbedtime):'0:00',

                                                      controller.dashboardScreenController.bedtime.value != ''
                                                          ? formatTime(controller.dashboardScreenController.bedtime.value)
                                                          : '00:00',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),

                                                    Text(
                                                      'Went to bed',
                                                      style: TextStyle(
                                                        fontSize: 12,

                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),


                                              // Add other text widgets or content if needed
                                            ],
                                          ),
                                        ],
                                      ),








                                    ),

                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 0), // Adjust margin for the paddings
                                      padding: EdgeInsets.all(10), // Adjust padding for the entire content
                                      decoration: BoxDecoration(
                                        color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                        borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white.withOpacity(0.2), // shadow color
                                                        spreadRadius: 0, // spread radius
                                                        blurRadius: 7, // blur radius
                                                        offset: Offset(0, 4), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    'assets/clock.png',
                                                    width: 40,
                                                  ),
                                                ),
                                              ),


                                              // Add other text widgets or content if needed
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                // padding: const EdgeInsets.only(left: 0.0, top: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '6 Hour',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),

                                                    Text(
                                                      'Went to bed',
                                                      style: TextStyle(
                                                        fontSize: 12,

                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),



                                              // Add other text widgets or content if needed
                                            ],
                                          ),
                                        ],
                                      ),



                                    ),

                                  ),
                                ],
                              ),

                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
                                      padding: EdgeInsets.all(10), // Adjust padding for the entire content
                                      decoration: BoxDecoration(
                                        color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                        borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white.withOpacity(0.1), // shadow color
                                                        spreadRadius: 0, // spread radius
                                                        blurRadius: 15, // blur radius
                                                        offset: Offset(0, 4), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    'assets/moonsleep.png',
                                                    width: 40,
                                                  ),
                                                ),
                                              ),

                                              // Add other text widgets or content if needed
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '22 min',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),

                                                    Text(
                                                      'Went to bed',
                                                      style: TextStyle(
                                                        fontSize: 12,

                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),


                                              // Add other text widgets or content if needed
                                            ],
                                          ),
                                        ],
                                      ),



                                    ),

                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 0), // Adjust margin for the paddings
                                      padding: EdgeInsets.all(10), // Adjust padding for the entire content
                                      decoration: BoxDecoration(
                                        color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                        borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(left: 0, bottom: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white.withOpacity(0.2), // shadow color
                                                        spreadRadius: 0, // spread radius
                                                        blurRadius: 7, // blur radius
                                                        offset: Offset(0, 4), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Image.asset(
                                                    'assets/zz.png',
                                                    width: 40,
                                                  ),
                                                ),
                                              ),


                                              // Add other text widgets or content if needed
                                            ],
                                          ),

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                // padding: const EdgeInsets.only(left: 0.0, top: 10),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '2h 30min',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),

                                                    Text(
                                                      'Deep sleep',
                                                      style: TextStyle(
                                                        fontSize: 12,

                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              // Add other text widgets or content if needed
                                            ],
                                          ),
                                        ],
                                      ),


                                    ),

                                  ),
                                ],
                              ),





                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.symmetric(

                                    horizontal: 30
                                ),
                                child: CustomPrimaryButton(buttonText: 'Set your bedtime routine', onButtonPressed: (){
                                  // controller.onRegisterTap();
                                  Get.put(AnalysisScreenController()).onRegisterTap();
                                },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
                              ),// Add some space between the buttons


                              const SizedBox(height: 30),
                
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                
                
                
              ],
            ),
                
                
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  String formatTime(String timeString) {
    final parsedTime = DateTime.parse('2022-01-01 $timeString');
    return DateFormat('h:mm a').format(parsedTime);
  }
}