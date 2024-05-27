
import 'package:first_project/controller/home_module_controller/account_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../message.dart';


class AccountSettingScreen extends GetView<AccountSettingController>{
  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffF5F5FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            GestureDetector(
              onTap: () {
                Get.back(); // Navigate back to the previous screen
              },
              child: Image.asset(
                'assets/back.png', // Replace with the path to your back icon image
                width: 45, // Adjust the width according to your design
                height: 45, // Adjust the height according to your design
              ),
            ),
            // const Text(
            //   'Account Setting',
            //   style: TextStyle(
            //     color: Colors.black87,
            //     fontSize: 24,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),

            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Account Setting',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // const Icon(
            //   Icons.notifications,
            //   color: Colors.black87,
            //   size: 36,
            // ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                width: 60, // Set the width to create a square container
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.black38,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/userprofile.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child:
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5FF),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3), // You can set your desired shadow color here
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes the position of the shadow
                        ),
                      ],
                    ),
        
        
        
                    child: Container(
        
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          padding: const EdgeInsets.all(50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
        
                              const SizedBox(height: 20),
        
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center, // Align the text to the left and the edit icon to the right
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
                                  ),
        
                                  Row(
                                    children: [
                                      Text(
                                        'Account Setting',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
        
        
                                    ],
                                  ),
        
        
                                ],
                              ),
        
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'sandhyamer@gmail.com',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
        
        
                                ],
                              ),
        
        
        
        
        
                              const SizedBox(height: 40),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.onPayment();
                                    // Add your button click functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),

                                    ),
                                    elevation: 5,
                                    shadowColor: Colors.black87,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children at the start and end of the row
                                      children: [
                                        Row(
                                          children: [
                                            // Add a small spacing between the icon and text
                                            Text(
                                              'Add Package',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.arrow_forward, // Add your desired arrow icon
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  )


                              ),
        
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.onCategory();
                                    // Add your button click functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 5,
                                    shadowColor: Colors.black87,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children at the start of the row
                                      children: [
        
                                        Row(
                                          children: [
                                            // SizedBox(width: 8),
                                            Text(
                                              'Add Category ',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), // Add a small spacing between the icon and text

                                        // SizedBox(width: 85),
                                        Icon(
                                          Icons.arrow_forward, // Add your desired arrow icon
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  )
        
                              ),
        
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.onAdd();
                                    // Add your button click functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 5,
                                    shadowColor: Colors.black87,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children at the start of the row
                                      children: [
        
                                        Row(
                                          children: [
                                            // SizedBox(width: 8),
                                            Text(
                                              'Payment Setting',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), // Add a small spacing between the icon and text

                                        // SizedBox(width: 65),
                                        Icon(
                                          Icons.arrow_forward, // Add your desired arrow icon
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  )
        
                              ),
        
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    // Add your button click functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 5,
                                    shadowColor: Colors.black87,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children at the start of the row
                                      children: [
        
                                        Row(
                                          children: [
                                            // SizedBox(width: 8),
                                            Text(
                                              'Close Account',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), // Add a small spacing between the icon and text

                                        // SizedBox(width: 80),
                                        Icon(
                                          Icons.arrow_forward, // Add your desired arrow icon
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  )
        
                              ),
        
                              const SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(ChatApp());
                                    // Add your button click functionality here
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black87,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    elevation: 5,
                                    shadowColor: Colors.black87,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children at the start of the row
                                      children: [
        
                                        Row(
                                          children: [
                                            // SizedBox(width: 8),
                                            Text(
                                              'Support',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ), // Add a small spacing between the icon and text

                                        // SizedBox(width: 130),
                                        Icon(
                                          Icons.arrow_forward, // Add your desired arrow icon
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                  )
        
                              ),
        
        
        
                            ],
                          ),
                        ),
        
        
                  ),
        
        
        
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: 100, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                    color: Colors.white, // Set the background color for the rounded image
                    child: Image.asset(
                      'assets/userprofile.png', // Your image path
                      fit: BoxFit.cover,
                    ),
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






