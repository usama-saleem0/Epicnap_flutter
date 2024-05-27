import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/bedtime_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../../controller/home_module_controller/add_notification_controller.dart';
import '../../model/user_model.dart';
import '../custom_widgets/custom_textfield.dart';
import '../custom_widgets/prograssdialog.dart';

class AddNotificationScreen extends GetView<AddNotificationController>{

  const AddNotificationScreen({Key? key}) : super(key: key);




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
            padding: EdgeInsets.all(0),

              children: [
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(

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
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Add Notification Routine',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                            ],
                          ),
                          // Add other text widgets if needed
                        ],
                      ),
                    ),

                  ],
                ),
            SizedBox(height: 20,),


                Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Column(
                    children: [






                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Notification Title',

                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: CustomTextField(
                          controller: controller.titleController,
                          hintText: "add here a notification title",
                        ),
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Notification Time ',

                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: CustomTextField(
                          controller: controller.timeController,
                          hintText: "how much time before bedtime time",
                          keyBoardType: TextInputType.number,
                        ),
                      ),


                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(right: 40, left: 40, top: 0),
                        child: CustomPrimaryButton(
                          buttonText: "Submit",
                          onButtonPressed: () {
                            controller.addNotifications();
                            // Get.put(BedTimeScreenController().addNotifications());

                          },
                          buttonColor: Color(0xff8650F6),
                        ),
                      ),

                      SizedBox(height: 20,),



                      SizedBox(height: 20,),
                    ],

                    // Add your modal content here
                  ),
                ),
                SizedBox(height: 20,),


                SizedBox(height: 20,),





        ],
          ),
        ),
      ),
    );
  }




}