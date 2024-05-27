import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/antisleep_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/history_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/notification_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/privacy_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../../model/user_model.dart';
import '../custom_widgets/custom_textfield.dart';
import '../custom_widgets/prograssdialog.dart';

class NotificationScreen extends GetView<NotificationScreenController>{

  const NotificationScreen({Key? key}) : super(key: key);

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
                        'Daily sleep and bedtime evaluation',
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
                      'How do you feel today?',

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



                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'How would you rate your sleep quality?',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),



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
                      'Bed Time',

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
                    controller: controller.bedController,
                    hintText: "Enter your last bed time",
                    keyBoardType: TextInputType.number,

                  ),
                ),



                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Wake Up',

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
                    controller: controller.wakeController,
                    hintText: "Enter your Wake up",
                    keyBoardType: TextInputType.number,
                   

                  ),
                ),

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

  void _showSleepTrackingMoodModal(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'How are you feeling?',

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


                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Keep a note about the day',

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
                    controller: controller.aboutController,
                    hintText: "here i am good to meet my family after a long day ",
                  ),
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Where you were?',

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
                    controller: controller.wereController,
                    hintText: "I have visited queen street and we were there whole day",
                  ),
                ),

                SizedBox(height: 20,),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'What you was doing?',

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
                    controller: controller.doingController,
                    hintText: "I was exploring foods and walking together",
                  ),
                ),

                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Who was with you?',

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
                    controller: controller.withController,
                    hintText: "My family members was with me",
                  ),
                ),

                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsets.only(right: 40, left: 40, top: 0),
                  child: CustomPrimaryButton(
                    buttonText: "Submit",
                    onButtonPressed: () {
                      controller.getUserModess();
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
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left:20.0),
                        child: Image.asset(
                          'assets/previous.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 300,
                        padding: const EdgeInsets.only(right: 35.0),
                        child: Center(
                          child: Text(
                            'Notification Center',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),




                Container(
                  padding: const EdgeInsets.only(left:30, right:30, top: 15.0),


                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Notifications',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),
                  SizedBox(height: 10,),
                  RichText(
                  text: TextSpan(
                  text: ' Welcome to Epicnap. here you can see all your notification i.e your last alarm, went to bed time and your weekly mood',
                  style: TextStyle(

                  fontSize: 14,
                  color: Colors.white,
                  ),
                  )
                  ),

                      SizedBox(height: 30,),

                      GestureDetector(
                        onTap: (){
                          _showSleepTrackingModal(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 0, bottom: 0,right: 0,left: 0), // Adjust margin for the paddings
                          padding: EdgeInsets.all(20), // Adjust padding for the entire content
                          decoration: BoxDecoration(
                            color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                            borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 10.0),
                                                    child: Container(
                                                      constraints: BoxConstraints(maxWidth: 200.0), // Adjust the maxWidth as needed
                                                      child: Text(
                                                        'Daily sleep and bedtime evaluation',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                        softWrap: true,
                                                        overflow: TextOverflow.visible,
                                                      ),
                                                    ),
                                                  ),

                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(left: 10.0),
                                                  //   child: Text(
                                                  //     'Daily sleep and bedtime evaluation',
                                                  //     style: TextStyle(
                                                  //       fontSize: 16,
                                                  //       fontWeight: FontWeight.bold,
                                                  //       color: Colors.white,
                                                  //     ),
                                                  //   ),
                                                  // ),

                                                  Container(
                                                    padding: const EdgeInsets.only(top: 5.0, left: 10),
                                                    width: 200,

                                                    // width: MediaQuery.of(context).size.width - 150,  // Adjust the width based on your layout
                                                    child: Text(

                                                    'Please fill in daily gain insights in your sleep habits',
                                                      style: TextStyle(
                                                        fontSize: 14,
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
                      ),





                      SizedBox(height: 20,),

                      GestureDetector(
                        onTap: (){
                          _showSleepTrackingWeeklyModal(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 0, bottom: 0,right: 0,left: 0), // Adjust margin for the paddings
                          padding: EdgeInsets.all(20), // Adjust padding for the entire content
                          decoration: BoxDecoration(
                            color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                            borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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


                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(left: 10.0),
                                                  //   child: Text(
                                                  //     'Weekly Questions',
                                                  //     style: TextStyle(
                                                  //       fontSize: 20,
                                                  //       fontWeight: FontWeight.bold,
                                                  //       color: Colors.white,
                                                  //     ),
                                                  //   ),
                                                  // ),


                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 0.0),
                                                    child: Container(
                                                      constraints: BoxConstraints(maxWidth: 200.0), // Adjust the maxWidth as needed
                                                      child: Text(
                                                        'Well-being evaluation',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                        softWrap: true,
                                                        overflow: TextOverflow.visible,
                                                      ),
                                                    ),
                                                  ),

                                                  Container(
                                                    padding: const EdgeInsets.only(top: 5.0, left: 0),
                                                    width: 200,

                                                    // width: MediaQuery.of(context).size.width - 150,  // Adjust the width based on your layout
                                                    child: Text(

                                                      'Please fill in once a week to evaluate your well-being',
                                                      style: TextStyle(
                                                        fontSize: 14,
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
                      ),


                      SizedBox(height: 20,),

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
                                        'Bedtime and Alarm',
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
                      SizedBox(height: 20,),



                      Container(
                        margin: EdgeInsets.only(top: 0, bottom: 0,right: 0,left: 0), // Adjust margin for the paddings
                        padding: EdgeInsets.all(20), // Adjust padding for the entire content
                        decoration: BoxDecoration(
                          color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                          borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    color: Colors.white.withOpacity(0.1), // shadow color
                                                    spreadRadius: 0, // spread radius
                                                    blurRadius: 15, // blur radius
                                                    offset: Offset(0, 4), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                'assets/clock.png',
                                                width: 50,


                                              ),
                                            ),
                                          ),
                                          Padding(


                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Text(
                                                    'Last Alarm',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                                                  width: 240,

                                                  // width: MediaQuery.of(context).size.width - 150,  // Adjust the width based on your layout
                                                  child: Text(

                                                    controller.dashboardScreenController.timer.value != ''
                                                        ? formatTime(controller.dashboardScreenController.timer.value)
                                                        : '00:00',
                                                    style: TextStyle(
                                                      fontSize: 16,
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
                      SizedBox(height: 20,),

                      Container(
                        margin: EdgeInsets.only(top: 0, bottom: 0,right: 0,left: 0), // Adjust margin for the paddings
                        padding: EdgeInsets.all(20), // Adjust padding for the entire content
                        decoration: BoxDecoration(
                          color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                          borderRadius: BorderRadius.circular(20), // Optional: Add border radius
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                    color: Colors.white.withOpacity(0.1), // shadow color
                                                    spreadRadius: 0, // spread radius
                                                    blurRadius: 15, // blur radius
                                                    offset: Offset(0, 4), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Image.asset(
                                                'assets/clock.png',
                                                width: 50,


                                              ),
                                            ),
                                          ),
                                          Padding(


                                            padding: const EdgeInsets.only(left: 10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Text(
                                                    'Went To Bed',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),

                                                Container(
                                                  padding: const EdgeInsets.only(top: 15.0, left: 10),
                                                  width: 240,

                                                  // width: MediaQuery.of(context).size.width - 150,  // Adjust the width based on your layout
                                                  child: Text(

                                                    controller.dashboardScreenController.bedtime.value != ''
                                                        ? formatTime(controller.dashboardScreenController.bedtime.value)
                                                        : '00:00',
                                                    style: TextStyle(
                                                      fontSize: 16,
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
                      // Text(
                      SizedBox(height: 20,),

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
                                        'Check your last moods',
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

                      SizedBox(height: 10,),
                      myRowWidget(controller.userModel , context),


                    ],
                  ),
                ),

                SizedBox(height: 10,),







        ],
          ),
        ),
      ),
    );
  }


  Widget myRowWidget(UserModel? userModel , BuildContext context) {
    bool isSwitched = false;
    return userModel != null
        ?


    Row(
      children: [

        Expanded(
          child: Container(

            child: Column(

              children: [
                for (var survey in userModel.surveys)


                  Container(
                    margin: EdgeInsets.only(top: 0, bottom: 20, right: 0, left: 0),
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
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 0),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10, right: 10,bottom: 10, top: 10),
                                          decoration: BoxDecoration(
                                            color: Color(0xffD8D8D8).withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                DateFormat.d().format(
                                                  DateTime.parse(survey.createdAt),
                                                ),
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              // Text(
                                              //   '14',
                                              //   style: TextStyle(
                                              //     fontSize: 22,
                                              //     // fontWeight: FontWeight.bold,
                                              //     color: Colors.white,
                                              //   ),
                                              // ),

                                              Text(
                                                DateFormat.MMM().format(
                                                  DateTime.parse(survey.createdAt),
                                                ),
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(height: 10,),

                                            ],
                                          ),


                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(right: 0.0, bottom: 10),
                                              child: Text(
                                                survey.emotions,
                                                // 'I was happy',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width - 250,  // Adjust the width based on your layout
                                              child: Text(
                                                survey.about
                                                ,

                                                // 'Strong relationship with family and friends can bring happiness.',
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
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Image.asset(
                              survey.feelings == 1
                                  ? 'assets/emoji5.png'
                                  : survey.feelings == 2
                                  ? 'assets/emoji3.png'
                                  : survey.feelings == 3 ?
                              'assets/emoji.png':
                              survey.feelings == 4
                                  ?'assets/emoji4.png':'assets/emoji5.png',
                              width: 60,
                            ),

                            // Image.asset(
                            //   'assets/emoji.png',
                            //   width: 60,
                            //
                            //
                            // ),
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

  String formatTime(String timeString) {
    final parsedTime = DateTime.parse('2022-01-01 $timeString');
    return DateFormat('h:mm a').format(parsedTime);
  }

}