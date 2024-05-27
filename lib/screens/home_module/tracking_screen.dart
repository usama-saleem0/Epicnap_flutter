import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/bedtime_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/tracking_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../custom_widgets/custom_textfield.dart';

class TrackingScreen extends GetView<TrackingScreenController>{

  const TrackingScreen({Key? key}) : super(key: key);



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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 18.0,),
                                  child: Image.asset(
                                    'assets/previous.png', // Replace with the path to your back icon image
                                    width: 15, // Adjust the width according to your design

                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  'Tracking',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),

                              )

                            ],
                          ),
                          // Add other text widgets if needed
                        ],
                      ),
                    ),
                  ],
                ),
            SizedBox(height: 20,),

                Stack(
                  children: [
                    Container(
                      height: 400,
                      width: 400,
                      padding: EdgeInsets.only(bottom: 30, left: 30, right:30),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/timechartnew.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 180,

                      left: 30,
                      right: 30,
                      child: Obx(
                            () => Text(
                          controller.elapsedTime,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),


                    ),

                    Positioned(
                      bottom: 180,

                      left: 30,
                      right: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(left:100.0, right: 100),
                        child: ElevatedButton(
                          onPressed: controller.startTimer,
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent, // Set the background color
                            onPrimary: Colors.white, // Set the text color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Set the border radius
                            ),
                            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                          ),
                          child: Text(''),
                        ),
                      ),


                    ),
                  ],
                ),


                // Container(
                //   height: 400,
                //   width: 400,
                //
                //
                //
                //   // padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 40 ),
                //   padding: EdgeInsets.only(bottom: 30, left: 30, right:30),
                //
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage('assets/timechartnew.png'),
                //
                //       // fit: BoxFit.cover,
                //
                //
                //     ),
                //   ),
                //
                //
                //
                //
                //
                //
                // ),
                //
                //
                //               Obx(
                //                                   () => Text(
                //                                 controller.elapsedTime,
                //                                 style: TextStyle(fontSize: 40, color: Colors.white),
                //                               ),
                //                             ),
                  SizedBox(height: 20,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Image.asset(
                          'assets/alarm.png', // Replace with the path to your back icon image
                          width: 25, // Adjust the width according to your design

                        ),
                      ),

                      Text(
                       'Alarm ',
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),


                      ),
                      Text(
                        controller.dashboardScreenController.timer.value != ''
                            ? formatTime(controller.dashboardScreenController.timer.value)
                            : '00:00',
                        style: TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),


                      ),


                    ],
                  ),

                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Column(
                        children: [
                          Text(
                            'Bed time',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),


                          ),

                          Text(
                            controller.dashboardScreenController.bedtime.value != ''
                                ? formatTime(controller.dashboardScreenController.bedtime.value)
                                : '00:00',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),


                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: Image.asset(
                          'assets/Rectangle.png', // Replace with the path to your back icon image
                          width: 5,
                          height: 50,// Adjust the width according to your design

                        ),
                      ),

                      Column(
                        children: [
                          Text(
                            'Quality',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),


                          ),

                          Text(
                            '70%',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),


                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: Image.asset(
                          'assets/Rectangle.png', // Replace with the path to your back icon image
                          width: 5,
                          height: 50,// Adjust the width according to your design

                        ),
                      ),

                      Column(
                        children: [
                          Text(
                            'Interruption',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),


                          ),
                          Text(
                            'Not yet',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),


                          ),
                        ],
                      ),


                    ],
                  ),
                ),
                //
                // Obx(() => Text(
                //   'Elapsed Time: ${controller.seconds.value} seconds',
                //   style: TextStyle(fontSize: 20),
                // )),

                SizedBox(height: 30,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 0, bottom: 0, right: 70, left: 70), // Adjust margin for the paddings
                        padding: EdgeInsets.all(10), // Adjust padding for the entire content
                        decoration: BoxDecoration(
                          color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                          borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Flexible(
                                  // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                  child: GestureDetector(
                                    onTap: (){
                                      controller.onMusicTap();

                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right:10.0),
                                          child: Image.asset(
                                            'assets/music.png', // Replace with the path to your back icon image
                                            width: 25, // Adjust the width according to your design

                                          ),
                                        ),

                                        // Obx(
                                        //       () => Text(
                                        //     controller.elapsedTime,
                                        //     style: TextStyle(fontSize: 40),
                                        //   ),
                                        // ),

                                        // Obx(
                                        //       () => Text(
                                        //     controller._elapsedTime.value,
                                        //     style: TextStyle(fontSize: 40),
                                        //   ),
                                        // ),

                                        // Obx(() => Text(
                                        //   'Elapsed Time: ${_formatDuration(controller.seconds.value)}',
                                        //   style: TextStyle(fontSize: 20),
                                        // )),

                                                    // Obx(
                                                    //       () => Text(
                                                    //     controller.formattedTime,
                                                    //     style: TextStyle(fontSize: 48.0),
                                                    //   ),
                                                    // ),

                                        Text(
                                          'sleeping music playing',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff939393),
                                          ),
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
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0 , right: 30),
                  child: ElevatedButton(
                    onPressed: controller.stopTimer,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff8650F6), // Set the background color
                      onPrimary: Colors.white, // Set the text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // Set the border radius
                      ),
                      padding: EdgeInsets.symmetric(vertical: 20),

                    ),
                    child: Text('Stop Tracking'),
                  ),
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //
                //       horizontal: 30
                //   ),
                //   child: CustomPrimaryButton(buttonText: 'Stop Tracking', onButtonPressed: (){
                //     controller.stopTimer;
                //   },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
                // ),


                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       controller.toggleTracking();
                //     },
                //     child: Obx(() => Text(
                //       controller.isTracking.value ? 'Stop Tracking' : 'Start Tracking',
                //     )),
                //   ),
                // ),







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
        // controller.onanalysisTap();
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


  String formatTime(String timeString) {
    final parsedTime = DateTime.parse('2022-01-01 $timeString');
    return DateFormat('h:mm a').format(parsedTime);
  }

  String _formatDuration(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }


}