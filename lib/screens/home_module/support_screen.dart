

import 'package:first_project/controller/home_module_controller/payment_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/support_screen_controller.dart';
import 'package:first_project/supportmessage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';






class SupportScreen extends GetView<SupportScreenController>{
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XffF5F5FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),





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
                            'Support',
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
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.symmetric(horizontal: 40), // Add horizontal padding for space on both ends
                    decoration: BoxDecoration(
                      image: DecorationImage(
        
                        image: AssetImage('assets/Group.png'),
                        // image: NetworkImage(
                        //   'https://graphicsfamily.com/wp-content/uploads/edd/2022/01/Online-Education-Landing-Page-Design-Orage-Version-870x490.jpg', // Replace with your image URL
                        // ),
                        // fit: BoxFit.cover,
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
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Center(
                          // Adjust the value according to your preference
                          child: Text(
                            'Hello, How can We help? You',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),




                      SizedBox(height: 50),

                      ElevatedButton(
                        onPressed: () {
                          Get.to(SupportChat());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => SupportChat(
                          //
                          //       // title: title,
                          //       // description: description,
                          //
                          //       // rating: double.parse(rating),
                          //     ),
                          //   ),
                          // );

                          // Add your button click functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          primary: Colors.grey[100],
                          onPrimary: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xff1C1B20)),

                          ),
                          elevation: 5,
                          shadowColor: Colors.black87,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align children at the start of the row
                            children: [
                              Icon(
                                Icons.headphones, // Add your desired icon
                                color: Colors.black87,
                              ),
                              SizedBox(width: 8), // Add a small spacing between the icon and text
                              Text(
                                'Contact live chat',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Add your button click functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          primary: Colors.grey[100],
                          onPrimary: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xff1C1B20)),
                          ),
                          elevation: 5,
                          shadowColor: Colors.black87,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align children at the start of the row
                            children: [
                              Icon(
                                Icons.email, // Add your desired icon
                                color: Colors.black87,
                              ),
                              SizedBox(width: 8), // Add a small spacing between the icon and text
                              Text(
                                'Send us an Email',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Add your button click functionality here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          primary: Colors.grey[100],
                          onPrimary: Colors.black87,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xff1C1B20)),
                          ),
                          elevation: 5,
                          shadowColor: Colors.black87,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Align children at the start of the row
                            children: [
                              Icon(
                                Icons.info, // Add your desired icon
                                color: Colors.black87,
                              ),
                              SizedBox(width: 8), // Add a small spacing between the icon and text
                              Text(
                                'FAQ',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height: 40),



                    ],
                  ),
                ),
              ),
        
            ],
        
          ),
        
        ),
      ),
    );
  }

}






