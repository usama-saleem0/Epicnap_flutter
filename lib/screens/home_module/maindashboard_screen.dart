

import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/screens/home_module/antisleep.dart';
import 'package:first_project/screens/home_module/history_screen.dart';
import 'package:first_project/screens/home_module/profile_screen.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../custom_widgets/custom_textfield.dart';
import '../custom_widgets/prograssdialog.dart';

class MainDashboradScreen extends GetView<MainDashboardScreenController>{

  const MainDashboradScreen({Key? key}) : super(key: key);
  void _showSleepTrackingModal(BuildContext context) {
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
                    Container(
                      width: 300,
                      child: Text(
                        'Would you like to track your mood and sleep quality?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'How was your feeling?',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(controller.imagePaths.length, (index) {
                return GestureDetector(
                  onTap: () {
                    controller.selectImage(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: controller.selectedIndex.value == index ? Colors.blue : Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Image.asset(
                      controller.imagePaths[index],
                      width: 50,
                    ),
                  ),
                );
              }),
            )),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //    Image.asset(
                //      'assets/emo.png',
                //          width:50,
                //    ),
                //
                //     Image.asset(
                //       'assets/emo.png',
                //       width:50,
                //     ),
                //
                //     Image.asset(
                //       'assets/emo.png',
                //       width:50,
                //     ),
                //
                //     Image.asset(
                //       'assets/emo.png',
                //       width:50,
                //     ),
                //
                //     Image.asset(
                //       'assets/emo.png',
                //       width:50,
                //     )
                //   ],
                // ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'How you’ll rate your sleep?',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Image.asset(
                //       'assets/stars.png',
                //       width:200,
                //     )
                //   ],
                // ),

            Obx(()=>
               Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () {
                      controller.setRating(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                    },
                    child: Icon(
                      index < controller.selectedStars.value ? Icons.star : Icons.star_border,
                      color: index < controller.selectedStars.value ? Colors.white : Colors.grey,
                      size: 40,
                    ),
                  );
                }),
              ),
            ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Are you satisfied with your bedtime last night?',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),



                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(controller.likeimage.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectImage2(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: controller.selectedIndex2.value == index ? Colors.blue : Colors.transparent,
                            width: 2.0,
                          ),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          controller.likeimage[index],
                          width: 50,
                        ),
                      ),
                    );
                  }),
                )),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Keep a note about your sleep',

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
                    controller: controller.noteController,
                    hintText: "This was a nice sleeping session",
                  ),
                ),

                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.only(right: 40, left: 40, top: 0),
                  child: CustomPrimaryButton(
                    buttonText: "Submit",
                    onButtonPressed: () {
                      controller.getUserMode();
                      // progressDialog.showDialog();
                      // Navigator.pop(context);
                      // progressDialog.dismissDialog();
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
    String currentDate = DateFormat('d').format(DateTime.now());

    DateTime now = DateTime.now();

    // Format the date using DateFormat
    String formattedDate = DateFormat('dd-MMM-yyyy').format(now);

    final DateTime _lastShownTime = DateTime.now();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   if (DateTime.now().difference(_lastShownTime) >= Duration(minutes: 1)) {
    //     _showSleepTrackingModal(context);
    //   }
    // });



    Future<DateTime?> _getStoredTime() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Replace 'storedTimeKey' with the key you used to store the time
      String? storedTimeString = prefs.getString('currentTime');
      print('time $storedTimeString');
      if (storedTimeString != null) {
        return DateTime.parse(storedTimeString);
      }
      return null;
    }

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      DateTime? storedTime = await _getStoredTime();
      if (storedTime != null &&
          DateTime.now().difference(storedTime) >= Duration(minutes: 10)) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String currentTime = DateTime.now().toString();
        await prefs.setString('currentTime', currentTime);
        _showSleepTrackingModal(context);


      }
    });
    // WidgetsBinding.instance!.addPostFrameCallback((_) async {
    //   DateTime? storedTime = await _getStoredTime();
    //   if (storedTime != null && storedTime.isBefore(DateTime.now())) {
    //
    //     _showSleepTrackingModal(context);
    //   }
    // });


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
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  children: [
                                    Obx(()=>
                                Text(
                                        // 'Hello Jessey!',

                                  'Hello ${controller.dashboardScreenController.name.value}',
                                       style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),

                                    Text(
                                      'Good morning',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0,left: 5),
                                child: Image.asset(
                                  'assets/sun.png',
                                  width: 30,


                                ),
                              ),
                            ],
                          ),
                          // Add other text widgets if needed
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: GestureDetector(
                        onTap:(){
                          controller.onNotificationTap();
                          // controller.onProfileTap();



                        },
                        child: Image.asset(
                          'assets/bell.png',
                          width: 50,

                        ),
                      ),
                    ),
                  ],
                ),


                // GestureDetector(
                //   onTap:(){
                //     controller.ontrackingTap();
                //   },
                //   child: Container(
                //     height: 200,
                //
                //
                //     // padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 40 ),
                //     padding: EdgeInsets.only(bottom: 30, left: 30, right:30),
                //
                //     decoration: BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage('assets/blank.png'),
                //         fit: BoxFit.cover,
                //
                //
                //       ),
                //     ),
                //
                //     child: Container(
                //       padding: EdgeInsets.only(top: 30),
                //
                //       // Adjust the left value as needed
                //       // child: buildCountry(),
                //     ),
                //   ),
                // ),


                GestureDetector(
                  onTap: () {
                    controller.ontrackingTap();
                  },

                  child: Container(
                    height: 200,
                    padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/blank.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(
                                  'You have slept  ${controller.dashboardScreenController.totallastsleep.toString()} hours',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Text(
                                'last Night',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // child: Container(
                  //   height: 200,
                  //   padding: EdgeInsets.only(bottom: 30, left: 30, right: 30),
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/blank.png'),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  //   child: Stack(
                  //     children: [
                  //       Positioned(
                  //         top: 60, // Adjust the top position of the text
                  //         // Adjust the left position of the text
                  //         child: Padding(
                  //           padding: const EdgeInsets.only(left:20.0, right: 20),
                  //           child: Text(
                  //             'You have slept  ${controller.dashboardScreenController.totallastsleep.toString()} hours',
                  //
                  //             style: TextStyle(
                  //               fontSize: 24,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //         ),
                  //
                  //
                  //       ),
                  //
                  //       Positioned(
                  //         top: 100, // Adjust the top position of the text
                  //          // Adjust the left position of the text
                  //         child: Text(
                  //           'last Night',
                  //
                  //           style: TextStyle(
                  //             fontSize: 24,
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.white,
                  //           ),
                  //         ),
                  //
                  //
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),

                Container(
              margin: EdgeInsets.only(top: 0, bottom: 0,right: 20,left: 20), // Adjust margin for the paddings
              padding: EdgeInsets.all(20), // Adjust padding for the entire content
              decoration: BoxDecoration(
                color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                borderRadius: BorderRadius.circular(20), // Optional: Add border radius
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
                            GestureDetector(
                              onTap:(){
                                controller.onalarmTap();
            },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
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
                                                    'assets/clock.png',
                                                    width: 70,


                                                  ),
                                                ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      children: [
                                        Obx( ()=>
                                           Text(



                                            controller.bedTimeScreenController.alarmTime.value == '00:00'
                                                ?formatTime(controller.dashboardScreenController.timer.value)
                                                : formatTimes(controller.bedTimeScreenController.alarmTime.value),
                                            // controller.dashboardScreenController.timer.value,

                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),

                                        Text(
                                          'Next Alarm',
                                          style: TextStyle(
                                            fontSize: 18,

                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            // Add other text widgets if needed
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(right: 20.0),
                      //
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0,bottom: 0),
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
                      // Switch(
                      //   value: false, // Set your initial switch state here
                      //   onChanged: (bool value) {
                      //     controller.onalarmTap();
                      //     // Update the state variable when the switch is toggled
                      //     // setState(() {
                      //     //   isSwitched = value;
                      //     // });
                      //
                      //     // You can perform additional actions based on the switch value here
                      //     if (isSwitched) {
                      //       // Switch is ON
                      //       print('Switch is ON');
                      //       // Perform actions when the switch is ON
                      //     } else {
                      //       controller.onalarmTap();
                      //
                      //       // Switch is OFF
                      //       print('Switch is OFF');
                      //       // Perform actions when the switch is OFF
                      //     }
                      //   },
                      //   activeColor: Colors.grey, // Customize the active color
                      //   inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                      //   inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                      // ),
                    ],
                  ),

                  Divider(height: 50,),

                  Row(
                    children: [
                      Expanded(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              // SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Container(

                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.1), // shadow color
                                        spreadRadius: 0, // spread radius
                                        blurRadius: 8, // blur radius
                                        offset: Offset(0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/bed.png',
                                    width: 50,


                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Obx(
                                    ()=> Text(
                                        // '10 : PM',
                                        controller.bedTimeScreenController.bedTime.value == '00:00'
                                            ?formatTime(controller.dashboardScreenController.bedtime.value)
                                            : formatTimes(controller.bedTimeScreenController.bedTime.value),

                                        // controller.dashboardScreenController.bedtime.value != ''
                                        //     ? formatTime(controller.dashboardScreenController.bedtime.value)
                                        //     : '00:00',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
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
                            ],
                          ),
                          SizedBox(width: 20,),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Container(

                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.1), // shadow color
                                        spreadRadius: 0, // spread radius
                                        blurRadius: 8, // blur radius
                                        offset: Offset(0, 4), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    'assets/time.png',
                                    width: 50,


                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // '06 : 30 AM',
                                      controller.notificationScreenController.wakeup.value == ''
                                          ? '${controller.dashboardScreenController.wakeup.value} am'
                                          : '${controller.notificationScreenController.wakeup.value} am',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),

                                    Text(
                                      'woke up          ',
                                      style: TextStyle(
                                        fontSize: 12,

                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),


                        ],
                      ),
                      ),


                    ],
                  ),

                  SizedBox(height: 10,),

                ],
              ),
            ),
                SizedBox(
                  height: 20,
                ),
                Row(

                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(

                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Daily activity',
                                      style: TextStyle(
                                        fontSize: 24,
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


                  ],
                ),

                Container(
                  padding: EdgeInsets.only(left: 20, right:20, top: 15),
                  height: 80,
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  //     _buildProductCard(context ,'1'),
                  //     _buildProductCard(context ,'2' ),
                  //     _buildProductCard(context ,'3' ),
                  //     _buildProductCard(context ,'4'),
                  //     _buildProductCard(context ,'5' ),
                  //     _buildProductCard(context ,'6' ),
                  //     _buildProductCard(context ,'7'),
                  //     _buildProductCard(context ,'8' ),
                  //     _buildProductCard(context ,'9' ),
                  //     _buildProductCard(context ,'10'),
                  //     _buildProductCard(context ,'11' ),
                  //     _buildProductCard(context ,'12' ),
                  //     _buildProductCard(context ,'13'),
                  //     _buildProductCard(context ,'14' ),
                  //     _buildProductCard(context ,'15' ),
                  //     _buildProductCard(context ,'16'),
                  //     _buildProductCard(context ,'17' ),
                  //     _buildProductCard(context ,'18' ),
                  //     _buildProductCard(context ,'19'),
                  //     _buildProductCard(context ,'20' ),
                  //     _buildProductCard(context ,'21' ),
                  //     _buildProductCard(context ,'22'),
                  //     _buildProductCard(context ,'23' ),
                  //     _buildProductCard(context ,'24' ),
                  //     _buildProductCard(context ,'25' ),
                  //     _buildProductCard(context ,'26' ),
                  //     _buildProductCard(context ,'27'),
                  //     _buildProductCard(context ,'28' ),
                  //     _buildProductCard(context ,'29' ),
                  //     _buildProductCard(context ,'30' ),
                  //
                  //
                  //     // Add more product cards as needed
                  //   ],
                  // ),


                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(30, (index) {
                      return _buildProductCard(context, (index + 1).toString(), currentDate);
                    }),
                ),
                ),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
                        padding: EdgeInsets.all(20), // Adjust padding for the entire content
                        decoration: BoxDecoration(
                          color: Color(0xff8650F6).withOpacity(0.7), // Set your desired box color
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
                                      'assets/sleep.png',
                                      width: 50,
                                    ),
                                  ),
                                ),



                                // Padding(
                                //   padding: const EdgeInsets.only(left: 10.0,bottom: 30),
                                //   child: Switch(
                                //     value: true, // Set your initial switch state here
                                //     onChanged: (bool value) {
                                //       controller.onanalysisTap();
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
                                //       controller.onanalysisTap();
                                //         // Switch is OFF
                                //         print('Switch is OFF');
                                //         // Perform actions when the switch is OFF
                                //       }
                                //     },
                                //     activeColor: Colors.white, // Customize the active color
                                //     inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                                //     inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                                //   ),
                                // ),


                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,bottom: 20),
                                  child: Obx(() => Switch(
                                    value: controller.isSwitched2.value, // Use .value to access the boolean value of RxBool
                                    onChanged: (bool value) {
                                      // Update the value of isSwitched
                                      controller.isSwitched2.value = value;

                                      // You can perform additional actions based on the switch value here
                                      if (controller.isSwitched2.value) {
                                        // Switch is ON
                                        print('Switch is ON');
                                        // Perform actions when the switch is ON
                                      } else {
                                        // Switch is OFF
                                        print('Switch is OFF');
                                        // Perform actions when the switch is OFF
                                      }
                                    },
                                    activeColor: Colors.white, // Customize the active color
                                    inactiveThumbColor: Colors.grey, // Customize the inactive thumb color
                                    inactiveTrackColor: Colors.grey.withOpacity(0.5), // Customize the inactive track color
                                  )),
                                ),





                                // Add other text widgets or content if needed
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                  child: GestureDetector(
                                    onTap:(){
                                          controller.onanalysisTap();
        },
                                    child: Column(
                                      children: [
                                        Obx( ()=>
                                          Text(
                                            controller.notificationScreenController.bedtime.value == ''
                                          ? formatTime(controller.dashboardScreenController.bedtime.value)
                                          : '${controller.notificationScreenController.bedtime.value} pm',

                                            // controller.dashboardScreenController.bedtime.value != ''
                                            //     ? formatTime(controller.dashboardScreenController.bedtime.value)
                                            //     : '00:00',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        // Text(
                                        //   '8 : 30 Hour',
                                        //   style: TextStyle(
                                        //     fontSize: 20,
                                        //     fontWeight: FontWeight.bold,
                                        //     color: Colors.white,
                                        //   ),
                                        // ),

                                        Text(
                                          '1:30 hours over the limit',
                                          style: TextStyle(
                                            fontSize: 12,

                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height:15),
                                      ],
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
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 0), // Adjust margin for the paddings
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
                                      'assets/moon.png',
                                      width: 50,
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
                                  child: GestureDetector(
                                    onTap:(){
                                      controller.onalarmTap();
                                    },
                                    child: Column(
                                      children: [
                                        Text(

                                          controller.notificationScreenController.wakeTime.value == ''
                                              ? '${controller.dashboardScreenController.totallastsleep.toString()} Hour'
                                              : '${controller.notificationScreenController.wakeTime} Hour',
                                          // '${controller.dashboardScreenController.totallastsleep.toString()} Hour',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),

                                        Text(
                                          'Need Atlease 6 hours of nights sleep',
                                          style: TextStyle(
                                            fontSize: 12,

                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
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




                SizedBox(height: 40,),





        ],
          ),
        ),
      ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff161D34),
                // spreadRadius: 1,
                // blurRadius: 1,
                // offset: Offset(0, 1),
              ),
            ],
          ),
          child: CircleNavBar(
            activeIcons: [
              Image.asset(
                'assets/logos.png',
                width: 30,
                height: 30,
              ),
              Image.asset(
                'assets/logos.png',
                width: 34,
                height: 34,
              ),
              Image.asset(
                'assets/logos.png',
                width: 34,
                height: 34,
              ),
              Image.asset(
                'assets/logos.png',
                width: 30,
                height: 30,
              ),
              Image.asset(
                'assets/logos.png',
                width: 30,
                height: 30,
              ),
            ],
            inactiveIcons: [
              Image.asset(
                'assets/item1.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                'assets/item2.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                'assets/item3.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                'assets/item3.png',
                width: 50,
                height: 50,
              ),
              Image.asset(
                'assets/item4.png',
                width: 50,
                height: 50,
              ),





            ],
            color: Colors.grey,
            circleColor: Color(0xffFFFFFF).withOpacity(0.1),
            height: 70,
            circleWidth: 70,
            padding: const EdgeInsets.only(left: 6, right: 6, bottom: 0),
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            shadowColor: Colors.black38.withOpacity(0.2),
            circleShadowColor: Color(0xffFFFFFF).withOpacity(0.2),
            elevation: 10,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xffFFFFFF).withOpacity(0.2), Color(0xffFFFFFF).withOpacity(0.2)],
            ),
            circleGradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xffFFFFFF).withOpacity(0.2), Color(0xffFFFFFF).withOpacity(0.2)],
            ),
            activeIndex: 2,
            // onTap: onTap,


            onTap: (index) {
              // Handle navigation to different pages based on the tapped index

              // _currentIndex = index;
              // Perform navigation or any other actions here based on the index
              if (index == 0) {
                // Navigate to "My" page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainDashboradScreen()),
                );
              }
              else if (index == 1) {
                // Navigate to "Like" page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryScreen()),
                );
              }
              else if (index == 2) {
                // Navigate to "Like" page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AntisleepScreen()),
                );
              }

              else if (index == 3) {
                // Navigate to "Like" page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AntisleepScreen()),
                );
              }

              else if (index == 4) {
                // Navigate to "Like" page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              }

            },
          ),
        ),
    );
  }

  // String formatTime(String timeString) {
  //   print('data $timeString');
  //   final parsedTime = DateTime.parse('2022-01-01 $timeString');
  //   return DateFormat('h:mm a').format(parsedTime);
  // }

  String formatTime(String timeString) {
    if (timeString == null || timeString.isEmpty) {
      return '00:00'; // Return a default value for null or empty time strings
    } else {
      try {
        final parsedTime = DateTime.parse('2022-01-01 $timeString');
        return DateFormat('h:mm a').format(parsedTime);
      } catch (e) {
        print('Error parsing time: $e');
        return 'Invalid Time'; // Return a message indicating an invalid time format
      }
    }
  }

  String formatTimes(String timeString) {
    final parsedTime = DateTime.parse(timeString);
    return DateFormat('h:mm a').format(parsedTime);
  }

  String formatAlarmTime(String timeString) {
    // Check if the timeString contains only time without date
    if (timeString.contains(':')) {
      // If it contains only time, parse it with today's date
      final parsedTime = DateTime.parse('2024-05-16 $timeString');
      return DateFormat('h:mm a').format(parsedTime);
    } else {
      // If it contains a complete date-time string, parse it directly
      final parsedTime = DateTime.parse(timeString);
      return DateFormat('h:mm a').format(parsedTime);
    }
  }



  // Widget _buildProductCard(BuildContext context , String title , String currentDate) {
  //   return GestureDetector(
  //     onTap: () {
  //       controller.onHistoryTap();
  //       // controller.onInfluncerTap(title: title , description: description, imageUrl: imageUrl );
  //
  //     },
  //     child: Container(
  //       width: 55,
  //
  //       margin: EdgeInsets.only(left: 8, right: 8),
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             height: 55,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               // boxShadow: [
  //               //   BoxShadow(
  //               //     color: Colors.black.withOpacity(0.5),
  //               //     blurRadius: 5,
  //               //     spreadRadius: 0,
  //               //     offset: Offset(0, 3),
  //               //   ),
  //               // ],
  //               // You can set a background color for the container if needed
  //               color: Color(0xffD8D8D8).withOpacity(0.2),
  //             ),
  //             child: Center(
  //               child: Text(
  //                 title,
  //                 style: TextStyle(
  //                   fontSize: 18,
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



  Widget _buildProductCard(BuildContext context, String title, String currentDate) {
    return GestureDetector(
      onTap: () {

        controller.main(title);



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
                color: title == currentDate
                    ? Color(0xff8650F6).withOpacity(0.7) // Change to your desired highlight color
                    : Color(0xffD8D8D8).withOpacity(0.2),
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


}