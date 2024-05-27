

import 'package:first_project/message.dart';
import 'package:first_project/payment.dart';
import 'package:first_project/screens/home_module/payment_screen.dart';
import 'package:first_project/screens/home_module/paypal.dart';
import 'package:first_project/screens/home_module/paypalpayments.dart';
import 'package:first_project/screens/home_module/paypalscreen.dart';
import 'package:first_project/support.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_module_controller/single_influencer_screen_controller.dart';



class SingleInfluencerScreen extends GetView<SingleInfluencerScreenController>{
  const SingleInfluencerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
        
        
        
        
              Center(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      child: Obx(()=> Container(
                          height: 250,
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(controller.imageUrl.value),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 25, // Set the radius of the circle avatar
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 18.0, top: 12),
                      child: GestureDetector(
                        onTap: () {
                          Get.back(); // Navigate back to the previous screen
                        },
                        child: Image.asset(
                          'assets/back.png', // Replace with the path to your back icon image
                          width: 45, // Adjust the width according to your design
                          height: 45, // Adjust the height according to your design
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        
        
        
        
        
        
        
        
        
        
        
        
        
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
        
                // Add spacing between the image and the card row
                child:Container(
                  color: Color(0xFFF5F5FF), // Set background color to white
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
        
                      SizedBox(height: 20),
        
                      Padding(
                        padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
                        child: Obx(()=> Text(
                            controller.title.value,
                            style: TextStyle(
                              color: Color(0xff1C1B20),
                              
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
        
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18.0), // Adjust the value according to your preference
                        child: Obx(()=>
                         Text(
                            controller.description.value,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
        
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20), // Add spacing between the image and the card row
        
        
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildCourseCard('80K', 'Instagram Likes'),
                          _buildCourseCard('40K', 'Facebook likes'),
                          _buildCourseCard('30K', 'Youtube Subscriber'),
                        ],
                      ),
                      SizedBox(height: 20),
        
                      Padding(
                        padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
                        child: Text(
                          'Introduction',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
        
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18.0), // Adjust the value according to your preference
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Obcaecati voluptatem deleniti laboriosam nobis reprehenderit fugiat necessitatibus sequi, nostrum rerum enim expedita laborum. Necessitatibus vitae commodi unde explicabo blanditiis, praesentium repellendus?',
                          style: TextStyle(
                            color: Color(0Xff8391A1),
                            fontSize: 16,
        
                          ),
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                      ),
        
                      Padding(
                        padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
                        child: Text(
                          'Education',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
        
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18.0), // Adjust the value according to your preference
                        child: Text(
                          'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Obcaecati voluptatem deleniti laboriosam nobis reprehenderit fugiat necessitatibus sequi, nostrum rerum enim expedita laborum. Necessitatibus vitae commodi unde explicabo blanditiis, praesentium repellendus?',
                          style: TextStyle(
                            color: Color(0Xff8391A1),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Center(
                                        child: Text(
                                          'Hiring Influencer',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      // Popup title
                                      content: Container(
                                        width: MediaQuery.of(context).size.width * 0.9,

                                        child: Column(

                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Select Category',
                                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust the content padding
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8), // Add some vertical spacing between text fields
                                            TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Select Requirment',
                                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust the content padding
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8), // Add some vertical spacing between text fields
                                            TextField(
                                              decoration: InputDecoration(
                                                labelText: 'Select Package',
                                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust the content padding
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                                                ),
                                              ),
                                              obscureText: true,
                                            ),
                                            SizedBox(height: 20),

                                            Padding(
                                              padding: EdgeInsets.only(), // Adjust the value according to your preference
                                              child: Center(

                                                child: Text(
                                                  'Total Payments    500',
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),


                                      actions: <Widget>[
                                        // IconButton(
                                        //   icon: Icon(Icons.close), // Close icon
                                        //   onPressed: () {
                                        //     Navigator.of(context).pop(); // Close the popup
                                        //   },
                                        // ),
                                        SizedBox(height: 20),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {

                                              // controller.onPayment();
                                              Get.to(PayPalPaymentScreens());
                                              // Get.to(MyApp());

                                            },
                                            child: Text(
                                              'Payment',
                                              style: TextStyle(fontSize: 15, color: Colors.white),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.black87,

                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Adjust button border radius
                                            ),

                                          ),
                                        ),

                                        SizedBox(height: 30),
                                      ],
                                    );
                                  },
                                );
                                // Handle the first button press
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffFFBA59), // Change button color here
                                minimumSize: Size(150, 50), // Set button size here
                              ),
                              child: Text('Hire Me' ,
                                style: TextStyle(fontSize: 16   , color: Colors.white),),
                            ),
                            ElevatedButton(
                              onPressed: () {

                                Get.to(ChatApp());


                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black87, // Change button color here
                                minimumSize: Size(150, 50), // Set button size here
                              ),
                              child: Text('Message Now',
                                style: TextStyle(fontSize: 16, color: Colors.white),),

                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            
            ],
        
          ),
        
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.white, // Set the background color to black
      //     selectedItemColor: Color(0xffDA8938), // Set the selected item color to white
      //     unselectedItemColor:
      //     Colors.grey[700], // Set the unselected item color to grey
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home,
      //           size: 34, ),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.library_books_rounded , size: 34),
      //         label: '',
      //       ),
      //
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.message,  size: 34,),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person,  size: 34,),
      //         label: '',
      //       ),
      //     ],
      //
      //     onTap: (int index) {
      //       if (index == 0) {
      //         Get.toNamed(AppConstant.kHomeScreen);
      //         // Navigate to the WelcomePage when Home is selected
      //         // Navigator.of(context).push(
      //         //   MaterialPageRoute(
      //         //     builder: (context) => HomeScreen(),
      //         //   ),
      //         // );
      //       }
      //
      //       if (index == 1) {
      //         Get.to(Courses());
      //         // Navigate to the WelcomePage when Home is selected
      //         // Navigator.of(context).push(
      //         //   MaterialPageRoute(
      //         //     builder: (context) => Courses(),
      //         //   ),
      //         // );
      //       }
      //
      //       if (index == 2) {
      //
      //         Get.to(Support());
      //         // Navigate to the WelcomePage when Home is selected
      //         // Navigator.of(context).push(
      //         //   MaterialPageRoute(
      //         //     builder: (context) => Support(),
      //         //   ),
      //         // );
      //       }
      //     }
      // ),
    );
  }

  Widget _buildCourseCard(String title, String description) {

    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffF5F5FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xffFFBA59), width: 1),
      ),
      child: Center( // Center the content both horizontally and vertically
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );

    // return Container(
    //   width: 100,
    //   height: 100,// Set the width of the card
    //   padding: EdgeInsets.all(8),
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.circular(8),
    //     border: Border.all(color: Colors.black, width: 1),
    //   ),
    //   child: Column(
    //     children: [
    //       Text(
    //         title,
    //         style: TextStyle(
    //           fontWeight: FontWeight.bold,
    //           fontSize: 20,
    //         ),
    //       ),
    //       SizedBox(height: 4),
    //       Text(
    //         description,
    //         style: TextStyle(fontSize: 14, color: Colors.grey),
    //       ),
    //
    //
    //     ],
    //   ),
    // );
  }




}