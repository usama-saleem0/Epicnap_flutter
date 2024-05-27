import 'package:first_project/controller/auth_module_controller/introduction_screen_controller.dart';
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

class IntroductionScreen extends GetView<IntroductionScreenController>{

  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    final RxBool isChecked = false.obs;


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
                        padding: const EdgeInsets.only(right: 25.0, top: 10),
                        child: Center(

                          child: Image.asset(
                            'assets/White version 1.png',
                            width: 170,
                            // height: 25,
                          ),
                          // child: Text(
                          //   'Legal and Privacy',
                          //   style: TextStyle(
                          //     fontSize: 22,
                          //     fontWeight: FontWeight.bold,
                          //     color: Colors.white,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 50,),


                Row(
                  children: [


                    Container(

                      padding: EdgeInsets.only(left: 30),

                      child: Text(
                        'Introduction',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),

                      ),
                    ),
                  ],
                ),


                Container(
                  padding: const EdgeInsets.only(left:30, right:30, top: 15.0),

                  width: MediaQuery.of(context).size.width - 180,
                  child: Column(
                    children: [
                      // Text(
                      //   'You are invited to participate in a research study exploring the impact of the Epicnap app on sleep quality, sleep procrastination behaviors, and mental well-being. This study is a vital component of a Masters thesis at Utrecht University, aimed at assessing the effectiveness of the Epicnap app as a comprehensive sleep intervention tool.',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.white,
                      //   ),
                      //   overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                      //   maxLines: 8,  // Adjust the number of lines to show
                      // ),
                      //
                      //
                      // Text(
                      //   'You are invited to participate in a research study exploring the impact of the Epicnap app on sleep quality, sleep procrastination behaviors, and mental well-being. This study is a vital component of a Masters thesis at Utrecht University, aimed at assessing the effectiveness of the Epicnap app as a comprehensive sleep intervention tool.',
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     color: Colors.white,
                      //   ),
                      //   overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                      //   maxLines: 8,  // Adjust the number of lines to show
                      // ),


                      Obx(
                            () => Text(
                          'You are invited to participate in a research study exploring the impact of the Epicnap app on sleep quality, sleep procrastination behaviors, and mental well-being. This study is a vital component of a Masters thesis at Utrecht University, aimed at assessing the effectiveness of the Epicnap app as a comprehensive sleep intervention tool.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: controller.showSecondText.value ? 20 : 8,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.toggleShowSecondText();
                        },
                        child: Obx(
                              () =>
                              Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: controller.showSecondText.value ? 'Read Less' : 'Read More',
                              style: TextStyle(
                                color: Color(0xff8650F6),
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                              ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Obx(
                            () {
                          if (controller.showSecondText.value) {
                            return Container(
                              padding: EdgeInsets.only(top: 10),


                              child: Column(
                                children: [

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Research Question',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                                                      fontWeight: FontWeight.bold,
                                        ),


                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    'The central question of this research is: "How does the use of the Epicnap app as a comprehensive sleep intervention impact users sleep quality, sleep procrastination behaviors, and mental well-being?"',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),

                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 8,
                                  ),

                                  SizedBox(height: 20,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:300,
                                        child: Text(
                                          'Expectations and Benefits',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,


                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    'The Epicnap app is designed to offer positive changes in your sleep habits and overall well-being. While aiming for beneficial outcomes, we acknowledge that the app and its interventions are not a substitute for professional medical advice for severe sleep issues or related health problems. Participation involves engaging with the app and its features, including weekly mental well-being questionnaires, for a minimum of two weeks. Your participation, while highly valued, is voluntary, and you may withdraw at any time without consequence.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),

                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 12,
                                  ),

                                  SizedBox(height: 20,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:300,
                                        child: Text(
                                          'Data Use and Privacy',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,


                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    'The Epicnap app is designed to offer positive changes in your sleep habits and overall well-being. While aiming for beneficial outcomes, we acknowledge that the app and its interventions are not a substitute for professional medical advice for severe sleep issues or related health problems. Participation involves engaging with the app and its features, including weekly mental well-being questionnaires, for a minimum of two weeks. Your participation, while highly valued, is voluntary, and you may withdraw at any time without consequence.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),

                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 16,
                                  ),

                                  SizedBox(height: 20,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:300,
                                        child: Text(
                                          'Recommendations for Participants',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,


                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    'The app aims to foster better sleep practices and mental wellness. However, it is not a cure-all solution. Should you experience sleep difficulties or suspect underlying health issues, we strongly recommend consulting a healthcare professional, such as a General Practitioner or Psychologist.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),

                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 12,
                                  ),

                                  SizedBox(height: 20,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:300,
                                        child: Text(
                                          'Incentive for Participation',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),

                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,


                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Text(
                                    'As a token of our appreciation, participants will receive 6 months of premium app features for free. This gesture is our way of thanking you for your valuable contribution to our research and the development of the Epicnap project.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),

                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 12,
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return SizedBox.shrink();
                          }
                        },
                      ),



                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Consent',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                        ],
                      ),



                      SizedBox(height: 20,),

                      Text(
                        'By ticking the box below, you acknowledge that you have read and understood this consent form, agree to participate in the research, and are aware of your rights and the voluntary nature of your participation.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,  // Show ellipsis (...) if the text overflows
                        maxLines: 8,  // Adjust the number of lines to show
                      ),

                      SizedBox(height: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 30,
                            child: Obx(
                                  () => Checkbox(
                                value: isChecked.value,
                                onChanged: (value) {
                                  isChecked.value = value!;
                                },
                              ),
                            ),
                          ),
                          // Obx(
                          //       () => Text('Checkbox is ${isChecked.value ? 'checked' : 'unchecked'}'),
                          // ),

                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 300,
                            child: Text(
                              'I agree to participate in the Epicnap app research study.',
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

                      SizedBox(height: 20,),

                      Padding(
                        padding: EdgeInsets.only(right: 20,left: 20, ),
                        child: CustomPrimaryButton(buttonText: "Submit", onButtonPressed: (){
                          controller.onLoginTap();
                        },
                          buttonColor: Color(0xff8650F6),
                        ),
                      ),


                    ],
                  ),
                ),

                SizedBox(height: 50,),
        ],
          ),
        ),
      ),
    );
  }



}