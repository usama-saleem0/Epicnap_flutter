import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:first_project/controller/auth_module_controller/analysis_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/profile_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../custom_widgets/custom_textfield.dart';
import '../custom_widgets/prograssdialog.dart';
import 'antisleep.dart';
import 'history_screen.dart';
import 'maindashboard_screen.dart';

class ProfileScreen extends GetView<ProfileScreenController>{
  const ProfileScreen({super.key});
  // void _showSleepTrackingModal(BuildContext context) {
  //   ProgressDialog progressDialog = ProgressDialog();
  //   print('sssssss');
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //
  //       return SingleChildScrollView(
  //         child: Container(
  //           // height: 800,
  //
  //           // height: MediaQuery.of(context).size.height * 2.95,
  //           width: 400,
  //           decoration: BoxDecoration(
  //             color: Colors.black,
  //
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(20.0),
  //               topRight: Radius.circular(20.0),
  //             ),
  //           ),
  //           padding: EdgeInsets.all(20),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Container(
  //                     width: 300,
  //                     child: Text(
  //                       'Short Warwick-Edinburgh Mental Well-being Scale',
  //                       textAlign: TextAlign.center,
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         fontWeight: FontWeight.bold,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 20,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'How you’ll rate your week?',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               SizedBox(height: 20,),
  //
  //
  //               Obx(()=>
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: List.generate(5, (index) {
  //                       return GestureDetector(
  //                         onTap: () {
  //                           controller.setRating(index + 1); // Index starts from 0, so add 1 to get the actual rating value
  //                         },
  //                         child: Icon(
  //                           index < controller.selectedStars.value ? Icons.star : Icons.star_border,
  //                           color: index < controller.selectedStars.value ? Colors.white : Colors.grey,
  //                           size: 40,
  //                         ),
  //                       );
  //                     }),
  //                   ),
  //               ),
  //
  //               SizedBox(height: 20,),
  //
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Feeling optimistic about the future',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 0),
  //                 child: CustomTextField(
  //                   controller: controller.optimisticsController,
  //                   hintText: "I've been feeling optimistic about the future",
  //                 ),
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Feeling useful',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 0),
  //                 child: CustomTextField(
  //                   controller: controller.usefulController,
  //                   hintText: "I've been feeling useful",
  //                 ),
  //               ),
  //
  //
  //               SizedBox(height: 20,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Feeling relaxed',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 0),
  //                 child: CustomTextField(
  //                   controller: controller.relaxedController,
  //                   hintText: "I've been feeling relaxed",
  //                 ),
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Dealing with problems well',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 0),
  //                 child: CustomTextField(
  //                   controller: controller.problemsController,
  //                   hintText: "I've been dealing with problems well",
  //                 ),
  //               ),
  //
  //
  //               SizedBox(height: 20,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Thinking clearly',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 0),
  //                 child: CustomTextField(
  //                   controller: controller.thinkingsController,
  //                   hintText: "I've been thinking clearly",
  //                 ),
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Intraction',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 0),
  //                 child: CustomTextField(
  //                   controller: controller.feelingController,
  //                   hintText: "I've been feeling close to other people",
  //                 ),
  //               ),
  //
  //
  //               SizedBox(height: 20,),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     'Own mind about things',
  //
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                       color: Colors.white,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //
  //               SizedBox(height: 20,),
  //               Padding(
  //                 padding: const EdgeInsets.only(top: 0),
  //                 child: CustomTextField(
  //                   controller: controller.mindsController,
  //                   hintText: "I've been able to make up my own mind about things",
  //                 ),
  //               ),
  //
  //
  //               SizedBox(height: 20,),
  //
  //
  //
  //
  //
  //               SizedBox(height: 20,),
  //
  //               Padding(
  //                 padding: EdgeInsets.only(right: 40, left: 40, top: 0),
  //                 child: CustomPrimaryButton(
  //                   buttonText: "Submit",
  //                   onButtonPressed: () {
  //                     // controller.getUserMode();
  //
  //                   },
  //                   buttonColor: Color(0xff8650F6),
  //                 ),
  //               ),
  //
  //               SizedBox(height: 20,),
  //
  //               GestureDetector(
  //                 onTap: (){
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text(
  //                   'Skip>',
  //
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
  //                     color: Color(0xff8650F6),
  //                   ),
  //                 ),
  //               ),
  //
  //               SizedBox(height: 20,),
  //             ],
  //
  //             // Add your modal content here
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }


  void _showSleepTrackingWeeklyModal(BuildContext context) {
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
                        'Well-being evaluation',
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


                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      child: Text(
                        'Please fill in this questionnaire each week to evaluate your mental well-being.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       'How you’ll rate your week?',
                //
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 20,),
                //
                //
                // Obx(()=>
                //     // Row(
                //     //   mainAxisAlignment: MainAxisAlignment.start,
                //     //   children: List.generate(5, (index) {
                //     //     return GestureDetector(
                //     //       onTap: () {
                //     //         controller.setRating(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                //     //       },
                //     //       child: Icon(
                //     //         index < controller.selectedStars.value ? Icons.star : Icons.star_border,
                //     //         color: index < controller.selectedStars.value ? Colors.white : Colors.grey,
                //     //         size: 40,
                //     //       ),
                //     //     );
                //     //   }),
                //     // ),
                //
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: List.generate(5, (index) {
                //     return GestureDetector(
                //       onTap: () {
                //         controller.setNumber(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                //       },
                //       child: Container(
                //         margin: EdgeInsets.all(8.0),
                //         padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                //         decoration: BoxDecoration(
                //           color: controller.selectedNumber.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                //           borderRadius: BorderRadius.circular(5.0),
                //         ),
                //         child: Text(
                //           (index + 1).toString(),
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 16,
                //           ),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                // ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Feeling optimistic about the future',

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
                    controller: controller.optimisticsController,
                    hintText: "I've been feeling optimistic about the future",
                  ),
                ),

                SizedBox(height: 10,),

                Obx(()=>


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setNumber(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: controller.selectedNumber.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
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
                      'Feeling useful',

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
                    controller: controller.usefulController,
                    hintText: "I've been feeling useful",
                  ),
                ),

                SizedBox(height: 10,),

                Obx(()=>


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setNumber2(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: controller.selectedNumber2.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
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
                      'Feeling relaxed',

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
                    controller: controller.relaxedController,
                    hintText: "I've been feeling relaxed",
                  ),
                ),

                SizedBox(height: 10,),

                Obx(()=>


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setNumber3(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: controller.selectedNumber3.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
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
                      'Dealing with problems well',

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
                    controller: controller.problemsController,
                    hintText: "I've been dealing with problems well",
                  ),
                ),
                SizedBox(height: 10,),

                Obx(()=>


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setNumber4(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: controller.selectedNumber4.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
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
                      'Thinking clearly',

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
                    controller: controller.thinkingsController,
                    hintText: "I've been thinking clearly",
                  ),
                ),
                SizedBox(height: 10,),

                Obx(()=>


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setNumber5(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: controller.selectedNumber5.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
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
                      'Intraction',

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
                    controller: controller.feelingController,
                    hintText: "I've been feeling close to other people",
                  ),
                ),

                SizedBox(height: 10,),

                Obx(()=>


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setNumber6(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: controller.selectedNumber6.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
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
                      'Own mind about things',

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
                    controller: controller.mindsController,
                    hintText: "I've been able to make up my own mind about things",
                  ),
                ),
                SizedBox(height: 10,),

                Obx(()=>


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            controller.setNumber7(index + 1); // Index starts from 0, so add 1 to get the actual rating value
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.only(left:8, right:8 , top: 3, bottom: 3),
                            decoration: BoxDecoration(
                              color: controller.selectedNumber7.value == index + 1 ? Color(0xFF281f57) : Colors.grey,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                ),

                SizedBox(height: 20,),





                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.only(right: 40, left: 40, top: 0),
                  child: CustomPrimaryButton(
                    buttonText: "Submit",
                    onButtonPressed: () {
                      controller.getUserModes();

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


    DateTime now = DateTime.now();
    if (now.weekday == DateTime.friday) {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   _showSleepTrackingModal(context);
      // });

      WidgetsBinding.instance!.addPostFrameCallback((_) async {
        DateTime? storedTime = await _getStoredTime();
        if (storedTime != null &&
            DateTime.now().difference(storedTime) >= Duration(minutes: 10)) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String currentTime = DateTime.now().toString();
          await prefs.setString('currentTime', currentTime);
          // _showSleepTrackingModal(context);
          _showSleepTrackingWeeklyModal(context);


        }
      });
    }
    bool isSwitched = false;
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.only(left: 20, right: 20,),
        color: Color(0xff161D34),
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color(0xFF281f57),
        //       Color(0xFF161D34),
        //       Color(0xFF161D34),
        //       Color(0xFF281f57),
        //     ],
        //     stops: [0.0, 0.1, 0.85, 1.0],
        //   ),
        // ),

        child: SafeArea(
          child: Center(

            child: Column(
              children: <Widget>[
                Expanded(

                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF8650F6),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),



                    // color: Color(0xFF8650F6),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          Row(
                            children: [
                              Expanded(


                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0.0, top: 10),
                                        child: Text(
                                          'My Profile',
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
                              ),
                      
                            ],
                          ),
                          SizedBox(height: 20,),
                          Image.asset(
                            'assets/jessy.png',
                            width: 100,
                      
                          ),
                          SizedBox(height: 10,),

                          Obx(()=>
                             Text(
                              // 'Jessey V.',
                              controller.dashboardScreenController.name.value,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Obx(()=>
                             Text(
                              // 'jesseyv@email.com',
                               controller.dashboardScreenController.email.value,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      
                          SizedBox(height: 30,),
                      
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      '${controller.dashboardScreenController.totalweek.toString()} Hour',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                      
                                    Container(
                                      padding: EdgeInsets.only(left: 20, right: 0),
                                      width: 150,
                                      child: Text(
                                        'Total sleep this week',
                                        style: TextStyle(
                                          fontSize: 16,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                      
                                Column(
                                  children: [
                                    Text(
                                      '${controller.dashboardScreenController.totalmonth.toString()} Hour',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                      
                                    Container(
                                      padding: EdgeInsets.only(left: 20,),
                                      width: 150,
                                      child: Text(
                                        'Quality sleep this month',
                                        style: TextStyle(
                                          fontSize: 16,
                                          // fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),


                Expanded(
                  flex: 1,
                  child: ClipRRect(

                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child: Container(


                      color: Color(0xffD8D8D8).withOpacity(0.1),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20,),

                              Text(
                                'Profile settings',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Divider(height: 10,),

                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        controller.onSettingsTap();
                                        },
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
                                                  padding: const EdgeInsets.only(left: 5, bottom: 20),
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
                                                      'assets/setting.png',
                                                      width: 30,
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
                                                        'Settings',
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
                                          ],
                                        ),








                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:(){
                                        controller.onPrivacyTap();
                                      },
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
                                                      'assets/list.png',
                                                      width: 30,
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
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Terms of Use',
                                                        style: TextStyle(
                                                          fontSize: 18,
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

                                  ),
                                ],
                              ),

                              SizedBox(height: 10,),



                              Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: (){
                                        controller.onResearchTap();

                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20), // Adjust margin for the paddings
                                        padding: EdgeInsets.all(10), // Adjust padding for the entire content
                                        decoration: BoxDecoration(
                                          color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                          borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                                        ),
                                        child: Column(
                                          children: [


                                            Padding(
                                              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: <Widget>[
                                                  Flexible(
                                                    // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'Help with research',
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
                                          ],
                                        ),








                                      ),
                                    ),

                                  ),

                                ],
                              ),

                              // SizedBox(height: 10,),
                              //
                              // Row(
                              //   children: [
                              //     Expanded(
                              //       child: Container(
                              //         margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20), // Adjust margin for the paddings
                              //         padding: EdgeInsets.all(10), // Adjust padding for the entire content
                              //         decoration: BoxDecoration(
                              //           color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                              //           borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                              //         ),
                              //         child: Column(
                              //           children: [
                              //
                              //
                              //             Padding(
                              //               padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                              //               child: GestureDetector(
                              //                 onTap: () {
                              //                   controller.onFaqTap();
                              //                 },
                              //                 child: Row(
                              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                   children: <Widget>[
                              //                     Flexible(
                              //                       // padding: const EdgeInsets.only(left: 0.0, top: 0),
                              //                       child: Column(
                              //                         children: [
                              //                           Text(
                              //                             'Frequently Ask Questions',
                              //                             style: TextStyle(
                              //                               fontSize: 18,
                              //                               // fontWeight: FontWeight.bold,
                              //                               color: Colors.white,
                              //                             ),
                              //                           ),
                              //
                              //
                              //                         ],
                              //                       ),
                              //                     ),
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
                              //                     // Add other text widgets or content if needed
                              //                   ],
                              //                 ),
                              //               ),
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
                              //
                              //   ],
                              // ),



                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20), // Adjust margin for the paddings
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
                                                controller.onLogoutTap();
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
                                                          'Log out',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            // fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),

                                                        Image.asset(
                                                          'assets/logout.png',
                                                          width: 30,
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

                              SizedBox(height: 10,),

                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20), // Adjust margin for the paddings
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
                                                controller.deleteUser();
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
                                                          'Delete User',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold,
                                                            color: Color(0XffD80D1F),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                          size: 30,
                                                        )

                                                        // Image.asset(
                                                        //   'assets/logout.png',
                                                        //   width: 30,
                                                        // ),
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










                              const SizedBox(height: 20),

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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}