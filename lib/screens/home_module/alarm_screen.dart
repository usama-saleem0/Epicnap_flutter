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
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../../controller/home_module_controller/alarm_screen_controller.dart';
import '../../model/user_model.dart';
import '../custom_widgets/custom_textfield.dart';

class AlarmScreen extends GetView<BedTimeScreenController>{

  // final UserModel userModel;

  // const AlarmScreen({Key? key, required this.userModel}) : super(key: key);
  const AlarmScreen({Key? key}) : super(key: key);

  Future<void> saveSelectedDays(int alarmIndex, List<bool> selectedDays) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Convert bool list to int list (0 for false, 1 for true)
    List<int> selectedDaysInt = selectedDays.map((day) => day ? 1 : 0).toList();
    prefs.setStringList('alarm_$alarmIndex', selectedDaysInt.map((e) => e.toString()).toList());
  }

  Future<List<bool>> loadSelectedDays(int alarmIndex, int daysCount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? selectedDaysString = prefs.getStringList('alarm_$alarmIndex');
    if (selectedDaysString != null) {
      return selectedDaysString.map((day) => day == '1').toList();
    }
    // If no data saved, return a list of false (all unselected)
    return List.generate(daysCount, (index) => false);
  }


  @override
  Widget build(BuildContext context) {
    // UserModel? userModel;
    // print(userModel);
    // UserModel storeModel = controller.storeModel;
    UserModel? userModel = Get.arguments as UserModel?;



    // UserModel? userModels = controller.userModel;
    print(userModel);
    // UserModel? userModel = Get.arguments as UserModel?;

    // UserModel userModel = Get.arguments as UserModel;

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
                                    'assets/previous.png',
                                    // Replace with the path to your back icon image
                                    width: 15, // Adjust the width according to your design

                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.back();
                                  // controller.onDashboardTap();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    'Alarm',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          // Add other text widgets if needed
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.put(BedTimeScreenController()).onLibraryScreen();

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Image.asset(
                          'assets/top.png',
                          width: 50,

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                // Obx(() {
                //   final DateTime? selectedTime = controller.selectedTime.value;
                //   return selectedTime != null
                //       ? Text(
                //     'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
                //     style: TextStyle(fontSize: 16, color: Colors.white),
                //   )
                //       : Container(); // Show nothing if selectedTime is null
                // }),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(
                      top: 0, bottom: 0, right: 20, left: 20),
                  // Adjust margin for the paddings
                  padding: EdgeInsets.all(15),
                  // Adjust padding for the entire content
                  decoration: BoxDecoration(
                    color: Color(0xffD8D8D8).withOpacity(0.2),
                    // Set your desired box color
                    borderRadius: BorderRadius.circular(
                        20), // Optional: Add border radius
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Container(

                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.white.withOpacity(
                                                  0.1), // shadow color
                                              spreadRadius: 0, // spread radius
                                              blurRadius: 15, // blur radius
                                              offset: Offset(0,
                                                  4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          'assets/clock.png',
                                          width: 60,


                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Set new alarm',
                                            style: TextStyle(
                                              fontSize: 22,
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
                          Container(


                            padding: EdgeInsets.only(left: 0.0,),
                            child: GestureDetector(
                              onTap: () {
                                // controller.selectTime(context);
                                Get.put(BedTimeScreenController().selectTime(context));


                              },
                              child: Image.asset(
                                'assets/plus.png',
                                // Replace with the path to your back icon image
                                width: 40, // Adjust the width according to your design

                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(right: 0.0),
                          //   child:Image.asset(
                          //     'assets/plus.png',
                          //     width: 40,
                          //
                          //
                          //   ),
                          //
                          //
                          //
                          // ),

                        ],
                      ),


                      SizedBox(height: 10,),

                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),


                Container(
                  padding: EdgeInsets.only(left: 30, bottom: 20),
                  child: Text(
                    'Running alarms',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),


                myRowWidget(userModel , context),



                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
                //         padding: EdgeInsets.all(20), // Adjust padding for the entire content
                //         decoration: BoxDecoration(
                //           color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                //           borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                //         ),
                //         child: Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //
                //                 Flexible(
                //                   // padding: const EdgeInsets.only(left: 0.0, top: 0),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '06 : 30 AM',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         padding: EdgeInsets.only(left: 0),
                //                         child: Text(
                //                           'wake up from sleep',
                //                           style: TextStyle(
                //                             fontSize: 14,
                //
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                       Container(
                //                         padding: EdgeInsets.only(left: 10, right:10, top: 15),
                //                         height: 50,
                //                         child: ListView(
                //                           scrollDirection: Axis.horizontal,
                //                           children: [
                //                             _buildProductCard(context ,'Mo'),
                //                             _buildProductCard(context ,'Tu' ),
                //                             _buildProductCard(context ,'We' ),
                //                             _buildProductCard(context ,'Th'),
                //                             _buildProductCard(context ,'Fr' ),
                //                             _buildProductCard(context ,'Sa' ),
                //                             _buildProductCard(context ,'Su'),
                //
                //                           ],
                //                         ),
                //                       ),
                //
                //                     ],
                //                   ),
                //
                //                 ),
                //
                //
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0.0,bottom: 30),
                //                   child: Switch(
                //                     value: true, // Set your initial switch state here
                //                     onChanged: (bool value) {
                //                       // Update the state variable when the switch is toggled
                //                       // setState(() {
                //                       //   isSwitched = value;
                //                       // });
                //
                //                       // You can perform additional actions based on the switch value here
                //                       if (isSwitched) {
                //                         // Switch is ON
                //                         print('Switch is ON');
                //                         // Perform actions when the switch is ON
                //                       } else {
                //                         // Switch is OFF
                //                         print('Switch is OFF');
                //                         // Perform actions when the switch is OFF
                //                       }
                //                     },
                //                     activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
                //                     inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                //                     inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                //                   ),
                //                 ),
                //
                //
                //
                //
                //
                //
                //
                //
                //                 // Add other text widgets or content if needed
                //               ],
                //             ),
                //
                //           ],
                //         ),
                //
                //
                //
                //
                //
                //
                //
                //
                //       ),
                //
                //     ),
                //
                //   ],
                // ),
                //
                // SizedBox(height: 20,),
                //
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
                //         padding: EdgeInsets.all(20), // Adjust padding for the entire content
                //         decoration: BoxDecoration(
                //           color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                //           borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                //         ),
                //         child: Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //
                //                 Flexible(
                //                   // padding: const EdgeInsets.only(left: 0.0, top: 0),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '06 : 30 AM',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         padding: EdgeInsets.only(left: 0),
                //                         child: Text(
                //                           'wake up from sleep',
                //                           style: TextStyle(
                //                             fontSize: 14,
                //
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                       Container(
                //                         padding: EdgeInsets.only(left: 10, right:10, top: 15),
                //                         height: 50,
                //                         child: ListView(
                //                           scrollDirection: Axis.horizontal,
                //                           children: [
                //                             _buildProductCard(context ,'Mo'),
                //                             _buildProductCard(context ,'Tu' ),
                //                             _buildProductCard(context ,'We' ),
                //                             _buildProductCard(context ,'Th'),
                //                             _buildProductCard(context ,'Fr' ),
                //                             _buildProductCard(context ,'Sa' ),
                //                             _buildProductCard(context ,'Su'),
                //
                //                           ],
                //                         ),
                //                       ),
                //
                //                     ],
                //                   ),
                //
                //                 ),
                //
                //
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0.0,bottom: 30),
                //                   child: Switch(
                //                     value: true, // Set your initial switch state here
                //                     onChanged: (bool value) {
                //                       // Update the state variable when the switch is toggled
                //                       // setState(() {
                //                       //   isSwitched = value;
                //                       // });
                //
                //                       // You can perform additional actions based on the switch value here
                //                       if (isSwitched) {
                //                         // Switch is ON
                //                         print('Switch is ON');
                //                         // Perform actions when the switch is ON
                //                       } else {
                //                         // Switch is OFF
                //                         print('Switch is OFF');
                //                         // Perform actions when the switch is OFF
                //                       }
                //                     },
                //                     activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
                //                     inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                //                     inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                //                   ),
                //                 ),
                //
                //
                //
                //
                //
                //
                //
                //
                //                 // Add other text widgets or content if needed
                //               ],
                //             ),
                //
                //           ],
                //         ),
                //
                //
                //
                //
                //
                //
                //
                //
                //       ),
                //
                //     ),
                //
                //   ],
                // ),
                //
                // SizedBox(height: 20,),
                //
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
                //         padding: EdgeInsets.all(20), // Adjust padding for the entire content
                //         decoration: BoxDecoration(
                //           color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                //           borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                //         ),
                //         child: Column(
                //           children: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //
                //                 Flexible(
                //                   // padding: const EdgeInsets.only(left: 0.0, top: 0),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '08 : 30 AM',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         padding: EdgeInsets.only(left: 0),
                //                         child: Text(
                //                           'Breakfast with family',
                //                           style: TextStyle(
                //                             fontSize: 14,
                //
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                       Container(
                //                         padding: EdgeInsets.only(left: 10, right:10, top: 15),
                //                         height: 50,
                //                         child: ListView(
                //                           scrollDirection: Axis.horizontal,
                //                           children: [
                //                             _buildProductCard(context ,'Mo'),
                //                             _buildProductCard(context ,'Tu' ),
                //                             _buildProductCard(context ,'We' ),
                //                             _buildProductCard(context ,'Th'),
                //                             _buildProductCard(context ,'Fr' ),
                //                             _buildProductCard(context ,'Sa' ),
                //                             _buildProductCard(context ,'Su'),
                //
                //                           ],
                //                         ),
                //                       ),
                //
                //                     ],
                //                   ),
                //
                //                 ),
                //
                //
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0.0,bottom: 30),
                //                   child: Switch(
                //                     value: true, // Set your initial switch state here
                //                     onChanged: (bool value) {
                //                       // Update the state variable when the switch is toggled
                //                       // setState(() {
                //                       //   isSwitched = value;
                //                       // });
                //
                //                       // You can perform additional actions based on the switch value here
                //                       if (isSwitched) {
                //                         // Switch is ON
                //                         print('Switch is ON');
                //                         // Perform actions when the switch is ON
                //                       } else {
                //                         // Switch is OFF
                //                         print('Switch is OFF');
                //                         // Perform actions when the switch is OFF
                //                       }
                //                     },
                //                     activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
                //                     inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                //                     inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                //                   ),
                //                 ),
                //
                //
                //
                //
                //
                //
                //
                //
                //                 // Add other text widgets or content if needed
                //               ],
                //             ),
                //
                //           ],
                //         ),
                //
                //
                //
                //
                //
                //
                //
                //
                //       ),
                //
                //     ),
                //
                //   ],
                // ),




                // SizedBox(height: 40,),


                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(

                      horizontal: 30
                  ),
                  child: CustomPrimaryButton(
                    buttonText: 'Set', onButtonPressed: () {
                    Get.put(BedTimeScreenController()).onanalysisTap();
                    // controller.scheduleAlarm();
                  }, buttonColor: Color(0xff8650F6), textColor: Colors.white,),
                ),

                SizedBox(height: 20,),


              ],
            ),
          ),
        ),
      );

  }





  // Widget  myRowWidget(UserModel? userModel , BuildContext context) {
  //   List<RxBool> alarmSwitchStates = List.generate(userModel!.alarms.length, (index) => false.obs);
  //
  //
  //
  //   List<RxList<RxBool>> alarmDaySelectionStates = List.generate(
  //     userModel!.alarms.length,
  //         (index) => List.generate(7, (dayIndex) => false.obs).obs,
  //   );
  //
  //   bool isSwitched = false;
  //   return userModel != null
  //   ?
  //
  //
  //   Row(
  //     children: [
  //
  //       Expanded(
  //         child: Container(
  //           // margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
  //           // padding: EdgeInsets.all(20), // Adjust padding for the entire content
  //           // decoration: BoxDecoration(
  //           //   color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
  //           //   borderRadius: BorderRadius.circular(20), // Optional: Add border radius
  //           // ),
  //
  //           child: Column(
  //
  //             children: [
  //               // for (var alarm in userModel.alarms)
  //               for (int index = 0; index < userModel.alarms.length; index++)
  //
  //               Container(
  //                 margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20), // Adjust margin for the paddings
  //                 padding: EdgeInsets.all(20), // Adjust padding for the entire content
  //                 decoration: BoxDecoration(
  //                   color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
  //                   borderRadius: BorderRadius.circular(20), // Optional: Add border radius
  //                 ),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: <Widget>[
  //
  //                     Flexible(
  //                       // padding: const EdgeInsets.only(left: 0.0, top: 0),
  //                       child: Column(
  //                         children: [
  //                           Text(
  //                             // formatTime(alarm.timer),
  //                             formatTime(userModel.alarms[index].timer),
  //                             style: TextStyle(
  //                               fontSize: 20,
  //                               fontWeight: FontWeight.bold,
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //
  //                           Container(
  //                             padding: EdgeInsets.only(left: 0),
  //                             child: Text(
  //                               'wake up from sleep',
  //                               style: TextStyle(
  //                                 fontSize: 14,
  //
  //                                 color: Colors.white,
  //                               ),
  //                             ),
  //                           ),
  //
  //
  //                         ],
  //                       ),
  //
  //                     ),
  //
  //
  //                     Padding(
  //                       padding: const EdgeInsets.only(right: 20.0,bottom: 0),
  //                       child: Obx(() => Switch(
  //                         value: alarmSwitchStates[index].value,
  //                         // value: Get.put(BedTimeScreenController()).isAlarmSwitched.value, // Use .value to access the boolean value of RxBool
  //                         onChanged: (bool value) {
  //                           // Update the value of isSwitched
  //                           // Get.put(BedTimeScreenController()).isAlarmSwitched.value = value;
  //                           alarmSwitchStates[index].value = value;
  //
  //                           // You can perform additional actions based on the switch value here
  //                           if (alarmSwitchStates[index].value) {
  //                             // Switch is ON
  //                             print('Switch is ON');
  //                             // Perform actions when the switch is ON
  //                           } else {
  //                             // Switch is OFF
  //                             print('Switch is OFF');
  //                             // Perform actions when the switch is OFF
  //                           }
  //                         },
  //                         activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
  //                         inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
  //                         inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
  //                       )),
  //                     ),
  //
  //                     // Padding(
  //                     //   padding: const EdgeInsets.only(left: 0.0,bottom: 30),
  //                     //   child: Switch(
  //                     //     value: true, // Set your initial switch state here
  //                     //     onChanged: (bool value) {
  //                     //       // Update the state variable when the switch is toggled
  //                     //       // setState(() {
  //                     //       //   isSwitched = value;
  //                     //       // });
  //                     //
  //                     //       // You can perform additional actions based on the switch value here
  //                     //       if (isSwitched) {
  //                     //         // Switch is ON
  //                     //         print('Switch is ON');
  //                     //         // Perform actions when the switch is ON
  //                     //       } else {
  //                     //         // Switch is OFF
  //                     //         print('Switch is OFF');
  //                     //         // Perform actions when the switch is OFF
  //                     //       }
  //                     //     },
  //                     //     activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
  //                     //     inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
  //                     //     inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
  //                     //   ),
  //                     // ),
  //
  //
  //
  //
  //
  //
  //
  //
  //                     // Add other text widgets or content if needed
  //                   ],
  //                 ),
  //               ),
  //
  //             ],
  //           ),
  //
  //
  //
  //
  //
  //
  //
  //
  //         ),
  //
  //       ),
  //
  //     ],
  //   )
  //       : SizedBox();
  // }



  Widget myRowWidget(UserModel? userModel, BuildContext context) {
    const int daysCount = 7;

    // Define a list of RxList<RxBool> to keep track of the selection state of each day for each alarm
    List<RxList<RxBool>> alarmDaySelectionStates = List.generate(
      userModel!.alarms.length,
          (index) => List.generate(daysCount, (dayIndex) => false.obs).obs,
    );

    // Load saved state from shared preferences
    for (int alarmIndex = 0; alarmIndex < userModel.alarms.length; alarmIndex++) {
      loadSelectedDays(alarmIndex, daysCount).then((selectedDays) {
        for (int dayIndex = 0; dayIndex < daysCount; dayIndex++) {
          alarmDaySelectionStates[alarmIndex][dayIndex].value = selectedDays[dayIndex];
        }
      });
    }

    return userModel != null
        ? Row(
      children: [
        Expanded(
          child: Container(
            child: Column(
              children: [
                for (int index = 0; index < userModel.alarms.length; index++)
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, right: 10, left: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffD8D8D8).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                formatTime(userModel.alarms[index].timer),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  'wake up from sleep',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 15),
                                height: 50,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    for (int dayIndex = 0;
                                    dayIndex < daysCount;
                                    dayIndex++)
                                      _buildProductCard(
                                          context,
                                          _getDayTitle(dayIndex),
                                          alarmDaySelectionStates[index]
                                          [dayIndex], () {
                                        // Toggle the selection state
                                        bool newValue = !alarmDaySelectionStates[index]
                                        [dayIndex]
                                            .value;
                                        alarmDaySelectionStates[index][dayIndex].value = newValue;

                                        // Save the new state
                                        List<bool> currentSelection = alarmDaySelectionStates[index]
                                            .map((rxBool) => rxBool.value)
                                            .toList();
                                        saveSelectedDays(index, currentSelection);
                                      }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    )
        : SizedBox();
  }

  String formatTime(String timeString) {
    final parsedTime = DateTime.parse('2022-01-01 $timeString');
    return DateFormat('h:mm a').format(parsedTime);
  }
  // Widget _buildProductCard(BuildContext context , String title) {
  //   return GestureDetector(
  //     onTap: () {
  //       // controller.onanalysisTap();
  //       // controller.onInfluncerTap(title: title , description: description, imageUrl: imageUrl );
  //
  //     },
  //     child: Container(
  //       width: 35,
  //
  //       margin: EdgeInsets.only(left: 8, right: 8),
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             height: 35,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //
  //               color: Color(0xff8650F6).withOpacity(0.9),
  //             ),
  //             child: Center(
  //               child: Text(
  //                 title,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ),
  //
  //
  //         ],
  //       ),
  //     ),
  //   );
  // }



  Widget _buildProductCard(BuildContext context, String title, RxBool isSelected,
      VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(() => Container(
        width: 35,
        margin: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isSelected.value
                    ? Color(0xff8650F6).withOpacity(0.9)
                    : Colors.grey,
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  // Widget _buildProductCard(BuildContext context, String title, RxBool isSelected,
  //     VoidCallback onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Obx(() => Container(
  //       width: 35,
  //       margin: EdgeInsets.only(left: 8, right: 8),
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             height: 35,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               color: isSelected.value
  //                   ? Color(0xff8650F6).withOpacity(0.9)
  //                   : Colors.grey,
  //             ),
  //             child: Center(
  //               child: Text(
  //                 title,
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     )),
  //   );
  // }

  String _getDayTitle(int index) {
    const dayTitles = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];
    return dayTitles[index];
  }


}