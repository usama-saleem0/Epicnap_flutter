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
import '../../model/user_model.dart';
import '../custom_widgets/custom_textfield.dart';
import '../custom_widgets/prograssdialog.dart';

class BedTimeScreen extends GetView<BedTimeScreenController>{

  const BedTimeScreen({Key? key}) : super(key: key);



  void _addAnotherNotifyModal(BuildContext context) {
    ProgressDialog progressDialog = ProgressDialog();
    print('sssssss');
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {

        return SingleChildScrollView(
          child: Container(
            // height: 800,

            // height: MediaQuery.of(context).size.height * 2.95,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.black,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add Notification Routine',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),




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

                    },
                    buttonColor: Color(0xff8650F6),
                  ),
                ),

                SizedBox(height: 20,),

                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Skip>',

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff8650F6),
                    ),
                  ),
                ),

                SizedBox(height: 20,),
              ],

              // Add your modal content here
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {


    // UserModel? userModel = Get.arguments as UserModel?;

    UserModel? userModel = Get.arguments as UserModel?;
    print('data ${userModel?.toString()}');


    // RxBool isSwitched = false.obs;
    // RxBool isSwitched2 = false.obs;
    // RxBool isSwitched3 = false.obs;


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
                                    'assets/previous.png', // Replace with the path to your back icon image
                                    width: 15, // Adjust the width according to your design

                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Set bedtime',
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


           Container(
             padding: EdgeInsets.only(left: 30, right: 30),
             // child: Image.asset(
             //   'assets/timer.png'
             // ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 // Widget to display selected alarm time
                 // Obx(() {
                 //   return controller.selectedTime.value != null
                 //       ? Text(
                 //     'Selected Alarm Time: ${DateFormat.Hm().format(controller.selectedTime.value!)}',
                 //     style: TextStyle(fontSize: 16, color: Colors.white),
                 //   )
                 //       : SizedBox();
                 // }),

                 Row(
                   children: [
                     Expanded(
                       child: Container(margin: EdgeInsets.only(top: 0, bottom: 0), // Adjust margin for the paddings
                         padding: EdgeInsets.all(20), // Adjust padding for the entire content
                         decoration: BoxDecoration(
                           color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                           borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                         ),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[

                                 Flexible(
                                   // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                   child: Column(
                                     children: [
                                       Text(
                                         'Set Bedtime Alarm',
                                         style: TextStyle(
                                           fontSize: 20,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white,
                                         ),
                                       ),


                                     ],
                                   ),
                                 ),


                                 Padding(
                                   padding: const EdgeInsets.only(left: 0.0,bottom: 0),

                                   child: GestureDetector(
                                     onTap: () {
                                       controller.selectTime(context);
                                     },
                                     child: Image.asset(
                                       'assets/plus.png', // Replace with the path to your back icon image
                                        width: 50,

                                     ),
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


                 // Button to select alarm time
                 // Container(
                 //   padding: EdgeInsets.only(left: 20, right:20, top: 15),
                 //
                 //   child: ElevatedButton(
                 //     onPressed: () => controller.selectTime(context),
                 //     child: Text('Select Alarm Time'),
                 //   ),
                 // ),

                 // Button to set the alarm
                 // ElevatedButton(
                 //   onPressed: () => controller.scheduleAlarm(),
                 //   child: Text('Set Alarm'),
                 // ),
               ],
             ),
           ),
                SizedBox(
                  height: 20,
                ),


                Container(
                  padding: EdgeInsets.only(left: 20, right:20, top: 15),
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildProductCard(context ,'Mo'),
                      _buildProductCard(context ,'Tu' ),
                      _buildProductCard(context ,'We' ),
                      _buildProductCard(context ,'Th'),
                      _buildProductCard(context ,'Fr' ),
                      _buildProductCard(context ,'Sa' ),
                      _buildProductCard(context ,'Su'),

                    ],
                  ),
                ),

                SizedBox(height: 10,),

                myRowWidget(userModel ,context),

                SizedBox(height: 20,),

                Row(
                  children: [

                    Expanded(
                      child: Container(

                        child: Column(

                          children: [


                              GestureDetector(
                                onTap:(){
                                  // _addAnotherNotifyModal(context);

                                  controller.onAddTap();
                                  },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20), // Adjust margin for the paddings
                                  padding: EdgeInsets.all(20), // Adjust padding for the entire content
                                  decoration: BoxDecoration(
                                    color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                    borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[

                                      Flexible(
                                        // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // formatTime(alarm.timer),
                                            'Add another',
                                              // formatTime(userModel.alarms[index].timer),
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),

                                            Container(
                                              padding: EdgeInsets.only(left: 0, right: 10,top: 5),
                                              child: Image.asset(
                                                'assets/plus_new.png', // Replace with the path to your back icon image
                                                width: 20, // Adjust the width according to your design

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
                        ),








                      ),

                    ),

                  ],
                ),
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
                //                         'Notify me to brush teeth',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         padding: EdgeInsets.only(right: 20),
                //                         child: Text(
                //                           '25 minutes before bedtime',
                //                           style: TextStyle(
                //                             fontSize: 12,
                //
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0.0,bottom: 0),
                //                   child: Obx(() => Switch(
                //                     value: controller.isSwitched.value, // Use .value to access the boolean value of RxBool
                //                     onChanged: (bool value) {
                //                       // Update the value of isSwitched
                //                       controller.isSwitched.value = value;
                //
                //                       // You can perform additional actions based on the switch value here
                //                       if (controller.isSwitched.value) {
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
                //                   )),
                //                 ),
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
                // SizedBox(height: 10,),
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
                //                         'Notify me to drink water',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         padding: EdgeInsets.only(right: 20),
                //                         child: Text(
                //                           '15 minutes before bedtime',
                //                           style: TextStyle(
                //                             fontSize: 12,
                //
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //
                //
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0.0,bottom: 0),
                //                   child: Obx(() => Switch(
                //                     value: controller.isSwitched2.value, // Use .value to access the boolean value of RxBool
                //                     onChanged: (bool value) {
                //                       // Update the value of isSwitched
                //                       controller.isSwitched2.value = value;
                //
                //                       // You can perform additional actions based on the switch value here
                //                       if (controller.isSwitched2.value) {
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
                //                   )),
                //                 ),
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
                //       ),
                //
                //     ),
                //
                //   ],
                // ),
                //
                //
                // SizedBox(height: 10,),
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
                //                         'Notify me to take meditation',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         padding: EdgeInsets.only(right: 20),
                //                         child: Text(
                //                           '10 minutes before bedtime',
                //                           style: TextStyle(
                //                             fontSize: 12,
                //
                //                             color: Colors.white,
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0.0,bottom: 0),
                //                   child: Obx(() => Switch(
                //                     value: controller.isSwitched3.value, // Use .value to access the boolean value of RxBool
                //                     onChanged: (bool value) {
                //                       // Update the value of isSwitched
                //                       controller.isSwitched3.value = value;
                //
                //                       // You can perform additional actions based on the switch value here
                //                       if (controller.isSwitched3.value) {
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
                //                   )),
                //                 ),
                //
                //                 //
                //                 // Padding(
                //                 //   padding: const EdgeInsets.only(left: 0.0,bottom: 0),
                //                 //   child: Switch(
                //                 //     value: true, // Set your initial switch state here
                //                 //     onChanged: (bool value) {
                //                 //       // Update the state variable when the switch is toggled
                //                 //       // setState(() {
                //                 //       //   isSwitched = value;
                //                 //       // });
                //                 //
                //                 //       // You can perform additional actions based on the switch value here
                //                 //       if (isSwitched) {
                //                 //         // Switch is ON
                //                 //         print('Switch is ON');
                //                 //         // Perform actions when the switch is ON
                //                 //       } else {
                //                 //         // Switch is OFF
                //                 //         print('Switch is OFF');
                //                 //         // Perform actions when the switch is OFF
                //                 //       }
                //                 //     },
                //                 //     activeColor: Color(0xff8650F6).withOpacity(0.5),// Customize the active color
                //                 //     inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                //                 //     inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                //                 //   ),
                //                 // ),
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

                SizedBox(height: 20,),

                Padding(
                  padding: const EdgeInsets.symmetric(

                      horizontal: 20
                  ),
                  child: CustomPrimaryButton(buttonText: 'Set', onButtonPressed: (){
                    // controller.onanalysisTap();
                    Get.find<BedTimeScreenController>().scheduleAlarms();
                    // controller.scheduleAlarm();
                  },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
                ),

                SizedBox(height: 20,),





        ],
          ),
        ),
      ),
    );
  }


  Widget _buildProductCard(BuildContext context , String title) {
    return GestureDetector(
      onTap: () {
        controller.onanalysisTap();
        // controller.onInfluncerTap(title: title , description: description, imageUrl: imageUrl );

      },
      child: Container(
        width: 55,

        margin: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.5),
                //     blurRadius: 5,
                //     spreadRadius: 0,
                //     offset: Offset(0, 3),
                //   ),
                // ],
                // You can set a background color for the container if needed
                color: Color(0xff8650F6).withOpacity(0.9),
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget  myRowWidget(UserModel? userModel , BuildContext context) {
    List<RxBool> notifySwitchStates = List.generate(userModel!.notify.length, (index) => false.obs);





    bool isSwitched = false;
    return userModel != null
        ?


    Row(
      children: [

        Expanded(
          child: Container(

            child: Column(

              children: [
                // for (var alarm in userModel.alarms)
                for (int index = 0; index < userModel.notify.length; index++)

                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 20), // Adjust margin for the paddings
                    padding: EdgeInsets.all(20), // Adjust padding for the entire content
                    decoration: BoxDecoration(
                      color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                      borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        Flexible(
                          // padding: const EdgeInsets.only(left: 0.0, top: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // formatTime(alarm.timer),
                          userModel.notify[index].title,
                                // formatTime(userModel.alarms[index].timer),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  '${userModel.notify[index].time.toString()} mintues before bedtime ',
                                  // 'wake up from sleep',
                                  style: TextStyle(
                                    fontSize: 14,

                                    color: Colors.white,
                                  ),
                                ),
                              ),


                            ],
                          ),

                        ),


                        Padding(
                          padding: const EdgeInsets.only(right: 20.0,bottom: 0),
                          child: Obx(() => Switch(
                            value: notifySwitchStates[index].value,
                            // value: Get.put(BedTimeScreenController()).isAlarmSwitched.value, // Use .value to access the boolean value of RxBool
                            onChanged: (bool value) {
                              Get.put(BedTimeScreenController()).indexValue.value = index;
                              // Update the value of isSwitched
                              // Get.put(BedTimeScreenController()).isAlarmSwitched.value = value;
                              notifySwitchStates[index].value = value;

                              controller.isSwitched.value = value;

                              // You can perform additional actions based on the switch value here
                              if (notifySwitchStates[index].value) {
                                // Switch is ON
                                print('Switch is ON');
                                // Perform actions when the switch is ON
                              } else {
                                // Switch is OFF
                                print('Switch is OFF');
                                // Perform actions when the switch is OFF
                              }
                            },
                            activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
                            inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                            inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                          )),
                        ),

                        // Padding(
                        //   padding: const EdgeInsets.only(left: 0.0,bottom: 30),
                        //   child: Switch(
                        //     value: true, // Set your initial switch state here
                        //     onChanged: (bool value) {
                        //       // Get.put(BedTimeScreenController()).indexValue.value = index;
                        //
                        //       controller.isSwitched.value = value;
                        //       // Update the state variable when the switch is toggled
                        //       // setState(() {
                        //       //   isSwitched = value;
                        //       // });
                        //
                        //       // You can perform additional actions based on the switch value here
                        //       if (isSwitched) {
                        //         // Switch is ON
                        //         print('Switch is ON');
                        //         // Perform actions when the switch is ON
                        //       } else {
                        //         // Switch is OFF
                        //         print('Switch is OFF');
                        //         // Perform actions when the switch is OFF
                        //       }
                        //     },
                        //     activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
                        //     inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                        //     inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                        //   ),
                        // ),








                        // Add other text widgets or content if needed
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

  Widget Notify(UserModel? userModel , BuildContext context) {
    bool isSwitched = false;
    print('new model ${userModel?.notify?.length}');
    return userModel != null
        ?



    Row(
      children: [

        Expanded(
          child: Container(

            child: Column(

              children: [
                for (var notification in userModel.notify)




                  Container(
                    margin: EdgeInsets.only(top: 0, bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color(0xffD8D8D8).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                    Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[

                                    Flexible(
                                      // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                      child: Column(
                                        children: [
                                          Text(
                                      notification.title,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),

                                          Container(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Text(
                                              notification.time.toString(),
                                              // '25 minutes before bedtime',
                                              style: TextStyle(
                                                fontSize: 12,

                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0,bottom: 0),
                                      child: Obx(() => Switch(
                                        value: controller.isSwitched.value, // Use .value to access the boolean value of RxBool
                                        onChanged: (bool value) {
                                          // Update the value of isSwitched
                                          controller.isSwitched.value = value;

                                          // You can perform additional actions based on the switch value here
                                          if (controller.isSwitched.value) {
                                            // Switch is ON
                                            print('Switch is ON');
                                            // Perform actions when the switch is ON
                                          } else {
                                            // Switch is OFF
                                            print('Switch is OFF');
                                            // Perform actions when the switch is OFF
                                          }
                                        },
                                        activeColor: Color(0xff8650F6).withOpacity(0.5), // Customize the active color
                                        inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                                        inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                                      )),
                                    ),


                                    // Add other text widgets or content if needed
                                  ],
                                ),

                        SizedBox(height: 10),
                      ],
                    ),
                  )

              ],
            ),








          ),

        ),

      ],
    )
        : SizedBox();
  }


}