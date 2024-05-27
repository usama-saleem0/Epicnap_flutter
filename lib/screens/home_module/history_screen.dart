import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
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
import 'package:intl/intl.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../../model/user_model.dart';
import '../custom_widgets/custom_textfield.dart';
import '../custom_widgets/prograssdialog.dart';
import 'antisleep.dart';
import 'maindashboard_screen.dart';
import 'profile_screen.dart';

class HistoryScreen extends GetView<HistoryScreenController>{

  const HistoryScreen({Key? key}) : super(key: key);


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


    String wakeupValue = controller.notificationScreenController.wakeup.value;
    double wakeupDouble = double.tryParse(wakeupValue) ?? 0.0;


    bool wakeTimeBool = controller.notificationScreenController.wakeTime.value.toLowerCase() == 'true';
    double wakeTimeDouble = double.tryParse(controller.notificationScreenController.wakeTime.value) ?? 0.0;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _showSleepTrackingModal(context);
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
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Hello ${controller.dashboardScreenController.name.value}',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),

                                    Text(
                                      'Have a good day',
                                      style: TextStyle(
                                        fontSize: 16,
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


                GestureDetector(
                  onTap: (){
                      controller.onbedtimeTap();
                  },
                  child: Container(
                    height: 200,


                    // padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 40 ),
                    padding: EdgeInsets.only(bottom: 30, left: 20, right:20),

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/newbanner.png'),
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
                                  'Your sleep/mood graph',
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
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 0, right: 20, left: 20),
                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
                  decoration: BoxDecoration(
                    color: Color(0xffD8D8D8).withOpacity(0.1),
                    // borderRadius: BorderRadius.circular(20),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, ),
                        child: Container(

                          padding: EdgeInsets.only(left: 10, right: 10,bottom: 5, top: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff5A0BFE),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Text(
                            // controller.notificationScreenController.wakeTime.value == ''
                            //     ? '${controller.dashboardScreenController.totallastsleep.toString()} Hour'
                            //     : '${controller.notificationScreenController.wakeTime} Hour',
                            'Sleep amount',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),


                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10,),
                        child: Container(

                          padding: EdgeInsets.only(left: 10, right: 10,bottom: 5, top: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff250567),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Text(
                            'Mood',
                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),


                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10,),
                        child: Container(

                          padding: EdgeInsets.only(left: 10, right: 10,bottom: 5, top: 5),
                          decoration: BoxDecoration(
                            color: Color(0xff826AB5),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Text(
                            // 'Sleep quality',
                            wakeTimeBool.toString(),

                            style: TextStyle(
                              fontSize: 14,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),


                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 0, bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Color(0xffD8D8D8).withOpacity(0.1),
                    // borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFD8D8D8).withOpacity(0.1),
                        Color(0xFF5A0BFE).withOpacity(0.3),
                        Color(0xFF5A0BFE).withOpacity(0.3),
                        Color(0xFF5A0BFE).withOpacity(0.2),
                      ],
                      stops: [0.0, 0.9, 1.75, 1.0],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  height: 200,



                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(
                        show: false, // Hide the border
                      ),
                      gridData: FlGridData(
                        show: true,
                        checkToShowVerticalLine: (value) => value % 6 == 0,

                         // Show vertical lines at integer intervals
                      ),
                      titlesData: FlTitlesData(
                        show: false, // Hide titles (numbers)
                      ),
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 10,
                      lineBarsData: [
                        LineChartBarData(



                          spots: [
                            FlSpot(0, 0),
                            FlSpot(1, 0),
                            FlSpot(2, 0),
                            FlSpot(3, wakeupDouble != 0.0 ? wakeupDouble :
                            controller.dashboardScreenController.sleepquality.value.toDouble()),
                            FlSpot(4, 0),
                            FlSpot(5, 0),
                            FlSpot(6, 0), // Add more spots here for the other days
                          ],
                          // spots: [
                          //   FlSpot(0, 4),
                          //   FlSpot(1, 2),
                          //   FlSpot(2, 2),
                          //   FlSpot(3, 5),
                          //   FlSpot(4, 2),
                          //   FlSpot(5, 2),
                          //   FlSpot(6, 8), // Add more spots here for the other days
                          // ],
                          isCurved: true,
                          color: Color(0xff826AB5),
                          barWidth: 5,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),

                        LineChartBarData(
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(1, 0),
                            FlSpot(2, 0),
                            FlSpot(3, controller.notificationScreenController.wakeTime.value == ''
                            ?controller.dashboardScreenController.totallastsleep.toDouble()
                            :wakeTimeDouble

                                ),
                            // wakeTimeDouble
                            // controller.notificationScreenController.wakeTime.value == ''
                            //     ? '${controller.dashboardScreenController.totallastsleep.toString()} Hour'
                            //     : '${controller.notificationScreenController.wakeTime} Hour',
                            FlSpot(4, 0),
                            FlSpot(5, 0),
                            FlSpot(6, 0),

                          ],
                          isCurved: true,
                          color: Color(0Xff5A0BFE),

                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),

                        LineChartBarData(
                          spots: [
                            FlSpot(0, 0),
                            FlSpot(1, 0),
                            FlSpot(2, 0),
                            FlSpot(3, controller.dashboardScreenController.sleepmood.value.toDouble()),
                            FlSpot(4, 0),
                            FlSpot(5, 0),
                            FlSpot(6, 0),
                          ],
                          isCurved: true,
                          color: Color(0Xff250567),

                          barWidth: 2,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                        // Repeat LineChartBarData for each line you want to draw
                      ],
                    ),
                  ),


                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

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
                  margin: EdgeInsets.only(top: 0, bottom: 0,right: 20,left: 20), // Adjust margin for the paddings
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
                                GestureDetector(
                                  onTap:(){
                                    _showSleepTrackingModal(context);
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
                                            'assets/pencil.png',
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
                                                // controller.dashboardScreenController.sleepquality.value.toString() ?? '2',



                                                'Check in',
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
                                                'take notes about your day',
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




                SizedBox(
                  height: 20,
                ),




                myRowWidget(controller.userModel , context),


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
                                              padding: const EdgeInsets.only(right: 30.0, bottom: 10),
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



}