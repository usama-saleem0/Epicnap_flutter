import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/antisleep_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/history_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
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
import 'history_screen.dart';
import 'maindashboard_screen.dart';
import 'profile_screen.dart';

class AntisleepScreen extends GetView<AntisleepScreenController>{

  const AntisleepScreen({Key? key}) : super(key: key);

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
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Text(
                                  'Anti sleep procrastination',
                                  style: TextStyle(
                                    fontSize: 22,
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
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 30.0),
                    //   child: Image.asset(
                    //     'assets/top.png',
                    //     width: 40,
                    //
                    //   ),
                    // ),
                  ],
                ),


                GestureDetector(
                  onTap:(){
                    controller.onBreathTap();
                  },
                  child: Container(
                    height: 200,


                    // padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 40 ),
                    padding: EdgeInsets.only(bottom: 30, left: 20, right:20),

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/breathe.png'),
                        fit: BoxFit.cover,



                      ),
                    ),

                    child: Container(
                      padding: EdgeInsets.only(top: 30),

                      // Adjust the left value as needed
                      // child: buildCountry(),
                    ),
                  ),
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
                                              blurRadius: 15, // blur radius
                                              offset: Offset(0, 4), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(
                                          'assets/bell.png',
                                          width: 50,


                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Text(
                                              'Need a break',
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),

                                          Container(
                                            padding: const EdgeInsets.only(top: 15.0, left: 10),
                                            width: 220,

                                            // width: MediaQuery.of(context).size.width - 150,  // Adjust the width based on your layout
                                            child: Text(
                                              'Wind down with a mindfulness technique',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                                              maxLines: 2,  // Adjust the number of lines to show
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


                      SizedBox(height: 10,),

                    ],
                  ),
                ),





                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 20), // Adjust margin for the paddings
                //         padding: EdgeInsets.all(20), // Adjust padding for the entire content
                //         decoration: BoxDecoration(
                //           color: Color(0xff8650F6).withOpacity(0.7), // Set your desired box color
                //           borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                //         ),
                //         child: Column(
                //           children: [
                //             Row(
                //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0, bottom: 10),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                       boxShadow: [
                //                         BoxShadow(
                //                           color: Colors.white.withOpacity(0.1), // shadow color
                //                           spreadRadius: 0, // spread radius
                //                           blurRadius: 15, // blur radius
                //                           offset: Offset(0, 4), // changes position of shadow
                //                         ),
                //                       ],
                //                     ),
                //                     child: Image.asset(
                //                       'assets/tick.png',
                //                       width: 40,
                //                     ),
                //                   ),
                //                 ),
                //
                //
                //                 // Add other text widgets or content if needed
                //               ],
                //             ),
                //
                //             Row(
                //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //                 Flexible(
                //                   // padding: const EdgeInsets.only(left: 0.0, top: 0),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '40% Quality',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         width: 130,
                //                         child: Text(
                //                           'Improve sleep quality by following next steps',
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
                //
                //
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
                //     Expanded(
                //       child: Container(
                //         margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 0), // Adjust margin for the paddings
                //         padding: EdgeInsets.all(20), // Adjust padding for the entire content
                //         decoration: BoxDecoration(
                //           color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                //           borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                //         ),
                //         child: Column(
                //           children: [
                //             Row(
                //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //                 Padding(
                //                   padding: const EdgeInsets.only(left: 0, bottom: 10),
                //                   child: Container(
                //                     decoration: BoxDecoration(
                //                       boxShadow: [
                //                         BoxShadow(
                //                           color: Colors.white.withOpacity(0.2), // shadow color
                //                           spreadRadius: 0, // spread radius
                //                           blurRadius: 7, // blur radius
                //                           offset: Offset(0, 4), // changes position of shadow
                //                         ),
                //                       ],
                //                     ),
                //                     child: Image.asset(
                //                       'assets/volume.png',
                //                       width: 40,
                //                     ),
                //                   ),
                //                 ),
                //
                //
                //                 // Add other text widgets or content if needed
                //               ],
                //             ),
                //
                //             Row(
                //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //                 Flexible(
                //                   // padding: const EdgeInsets.only(left: 0.0, top: 10),
                //                   child: Column(
                //                     children: [
                //                       Text(
                //                         '60% Noise',
                //                         style: TextStyle(
                //                           fontSize: 20,
                //                           fontWeight: FontWeight.bold,
                //                           color: Colors.white,
                //                         ),
                //                       ),
                //
                //                       Container(
                //                         width: 130,
                //                         child: Text(
                //                           'Reduce noise by taking necessary steps',
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
                //
                //
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
                //   ],
                // ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: Column(
                              children: [
                                Text(
                                  'Also try',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                              ],
                            ),
                          ),
                          // Add other text widgets if needed
                        ],
                      ),
                    ),


                  ],
                ),

                SizedBox(
                  height: 20,
                ),

          Container(
            margin: EdgeInsets.only(top: 0, bottom: 20, right: 20, left: 20),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xff8650F6).withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
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
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 130.0, bottom: 0),
                                      child: Text(
                                        'Fall asleep',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 220,
                                      // width: MediaQuery.of(context).size.width - 170,  // Adjust the width based on your layout
                                      child: Text(
                                        'Meditate for a moment',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                                        maxLines: 2,  // Adjust the number of lines to show
                                      ),
                                    ),

                                    GestureDetector(
                                      onTap:(){
                                        controller.onMeditateTap();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 10, right: 90),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 20, right: 20,bottom: 5, top: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(10),
                                          ),

                                          child: Column(
                                            children: [
                                              Text(
                                                'Go to Library',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Color(0xff8650F6),
                                                ),
                                              ),


                                            ],
                                          ),


                                        ),
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
                // SizedBox(height: 10),
              ],
            ),
          ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:Color(0xffD8D8D8).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
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
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 130.0, bottom: 0),
                                            child: Text(
                                              'Fall asleep',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 220,
                                            // width: MediaQuery.of(context).size.width - 170,  // Adjust the width based on your layout
                                            child: Text(
                                              'Listen to soothing music',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                                              maxLines: 2,  // Adjust the number of lines to show
                                            ),
                                          ),

                                          GestureDetector(
                                            onTap:(){
                                              controller.onMusicTap();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, right: 90),
                                              child: Container(
                                                padding: EdgeInsets.only(left: 20, right: 20,bottom: 5, top: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),

                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Go to library',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Color(0xff8650F6),
                                                      ),
                                                    ),


                                                  ],
                                                ),


                                              ),
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
                      // SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:Color(0xffD8D8D8).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
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
                                      padding: const EdgeInsets.only(left: 10.0),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 150.0, bottom: 0),
                                            child: Text(
                                              'Stay relaxed',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 250,
                                            // width: MediaQuery.of(context).size.width - 170,  // Adjust the width based on your layout
                                            child: Text(
                                              'Listen to sleep sounds',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                                              maxLines: 2,  // Adjust the number of lines to show
                                            ),
                                          ),

                                          GestureDetector(

                                            onTap:(){
                                              controller.onSoundTap();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10, right: 110),
                                              child: Container(
                                                padding: EdgeInsets.only(left: 20, right: 20,bottom: 5, top: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(10),
                                                ),

                                                child: Column(
                                                  children: [
                                                    Text(
                                                      'Go to library',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        // fontWeight: FontWeight.bold,
                                                        color: Color(0xff8650F6),
                                                      ),
                                                    ),


                                                  ],
                                                ),


                                              ),
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
                      // SizedBox(height: 10),
                    ],
                  ),
                ),

               
          // Container(
          //   // height: 700,
          //   child: ListView.builder(
          //
          //     physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
          //     shrinkWrap: true,
          //
          //     itemCount: 3, // Set the number of containers you want to display
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //         margin: EdgeInsets.only(top: 0, bottom: 20, right: 20, left: 20),
          //         padding: EdgeInsets.all(15),
          //         decoration: BoxDecoration(
          //           color: Color(0xffD8D8D8).withOpacity(0.2),
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Row(
          //               children: [
          //                 Expanded(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       Row(
          //                         children: [
          //
          //                           Padding(
          //                             padding: const EdgeInsets.only(left: 10.0),
          //                             child: Column(
          //                               children: [
          //                                 Padding(
          //                                   padding: const EdgeInsets.only(right: 130.0, bottom: 0),
          //                                   child: Text(
          //                                     'Fall asleep',
          //                                     style: TextStyle(
          //                                       fontSize: 18,
          //                                       fontWeight: FontWeight.bold,
          //                                       color: Colors.white,
          //                                     ),
          //                                   ),
          //                                 ),
          //                                 Container(
          //                                   width:220,
          //                                   // width: MediaQuery.of(context).size.width - 170,  // Adjust the width based on your layout
          //                                   child: Text(
          //                                     'Listen soothing music',
          //                                     style: TextStyle(
          //                                       fontSize: 20,
          //                                       color: Colors.white,
          //                                       fontWeight: FontWeight.bold,
          //                                     ),
          //                                     overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
          //                                     maxLines: 4,  // Adjust the number of lines to show
          //                                   ),
          //                                 ),
          //
          //                                 GestureDetector(
          //                                   onTap:(){
          //                                     controller.onMusicTap();
          //                                   },
          //                                   child: Padding(
          //                                     padding: const EdgeInsets.only(top: 10, right: 90),
          //                                     child: Container(
          //                                       padding: EdgeInsets.only(left: 20, right: 20,bottom: 5, top: 5),
          //                                       decoration: BoxDecoration(
          //                                         color: Colors.white,
          //                                         borderRadius: BorderRadius.circular(10),
          //                                       ),
          //
          //                                       child: Column(
          //                                         children: [
          //                                           Text(
          //                                             'Go to library',
          //                                             style: TextStyle(
          //                                               fontSize: 18,
          //                                               // fontWeight: FontWeight.bold,
          //                                               color: Color(0xff8650F6),
          //                                             ),
          //                                           ),
          //
          //
          //                                         ],
          //                                       ),
          //
          //
          //                                     ),
          //                                   ),
          //                                 ),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //
          //
          //               ],
          //             ),
          //             SizedBox(height: 10),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),






          SizedBox(height: 20,),





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


  Widget _buildProductCard(BuildContext context , String title) {
    return GestureDetector(
      onTap: () {
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
                color: Color(0xffD8D8D8).withOpacity(0.2),
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