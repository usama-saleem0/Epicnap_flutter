import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/antisleep_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/history_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/notification_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/prehistory_screen_controller.dart';
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

class PrehistoryScreen extends GetView<PrehistoryScreenController>{

  const PrehistoryScreen({Key? key}) : super(key: key);



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
                            'Previous History',
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
                            'History',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),

                          ),
                        ],
                      ),









                      SizedBox(height: 20,),




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
                                                'assets/bed.png',
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
                                                    'Last Bed Time',
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
                                                    '${controller.mainDashboardScreenController.historyBedtime.value?? "0"} am',

                                                    // controller.dashboardScreenController.timer.value != ''
                                                    //     ? formatTime(controller.dashboardScreenController.timer.value)
                                                    //     : '00:00',
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
                                                    'Last Wake Up',
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

                                                    '${controller.mainDashboardScreenController.historyWakeup.value?? '0'} Hours',
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
                                        'Check your Previous Moods',
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
                                                  fontSize: 22,
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
                                                  fontSize: 22,
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
                                                  fontSize: 20,
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