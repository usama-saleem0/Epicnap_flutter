

import 'package:first_project/controller/home_module_controller/category_setting_controller.dart';
import 'package:first_project/controller/home_module_controller/payment_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/payment_setting_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';






class CategorySettingScreen extends GetView<CategorySettingController>{
  const CategorySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffF5F5FF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),



            // Padding(
            //   padding: EdgeInsets.only(left: 130.0), // Adjust the value according to your preference
            //   child: Text(
            //     'Category ',
            //     style: TextStyle(
            //       color: Colors.black87,
            //       fontSize: 36,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),

            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back(); // Navigate back to the previous screen
                    },
                    child: Image.asset(
                      'assets/back.png', // Replace with the path to your back icon image
                      width: 40, // Adjust the width according to your design
                      height: 40, // Adjust the height according to your design
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 40),
                      child: Center(

                        child: Text(
                          'Category',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ),

                ],
              ),
            ),

            // SizedBox(
            //   height: 50,
            // ),

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Set the border radius for rounded corners
                child: Container(
                  width: 500,
                  height: 250,
                  padding: EdgeInsets.symmetric(horizontal: 40), // Add horizontal padding for space on both ends
                  decoration: BoxDecoration(
                    image: DecorationImage(

                      image: AssetImage('assets/category.png'),
                      // image: NetworkImage(
                      //   'https://graphicsfamily.com/wp-content/uploads/edd/2022/01/Online-Education-Landing-Page-Design-Orage-Version-870x490.jpg', // Replace with your image URL
                      // ),

                    ),
                  ),
                ),
              ),
            ),


            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),

              // Add spacing between the image and the card row
              child:Container(
                color: Color(0xffF5F5FF), // Set background color to white
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                    Padding(
                      padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
                      child: Text(
                        'Add Category ',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),



                    SizedBox(height: 50), // Add spacing between the image and the card row

                    TextField(

                      decoration: InputDecoration(
                        labelText: 'First Category',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                        ),
                      ),
                      controller:controller.firstController,
                      // controller: PaymentSettingController().firstController,
                    ),
                    SizedBox(height: 20),
                    TextField(

                      decoration: InputDecoration(
                        labelText: 'Second Category',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                        ),
                      ),
                      controller: controller.secondController,
                      // controller: PaymentSettingController().secondController,
                    ),
                    SizedBox(height: 20),
                    TextField(

                      decoration: InputDecoration(
                        labelText: 'Third Category',

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                        ),
                      ),
                      controller: controller.thirdController,
                      // controller: PaymentSettingController().thirdController,
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed:() {
                        controller.onCategory();
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 16), // Increase the padding
                        child: Text(
                          'Save',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20, // Increase the font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black87,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation:
                        5, // Add the elevation property to set the shadow
                        shadowColor: Colors.black38,
                      ),
                    ),


                  ],
                ),
              ),
            ),
            // Two cards in one line

          ],

        ),

      ),


    );
  }

}






