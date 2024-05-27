
import 'package:first_project/controller/home_module_controller/single_course_screen_controller.dart';
import 'package:first_project/support.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_module_controller/single_influencer_screen_controller.dart';



class SingleCourseScreen extends GetView<SingleCourseScreenController>{
  const SingleCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XffF5F5FF),

      body: SafeArea(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
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
                          width: 45, // Adjust the width according to your design
                          height: 45, // Adjust the height according to your design
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/abiola.png', // Replace with the path to your back icon image
                          width: 30, // Adjust the width according to your design
          
                        ),
                        // child: Column(
                        //   // crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Hey John',
                        //       style: TextStyle(
                        //         fontSize: 32,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.black87,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/user.png'),
                      ),
                    ],
                  ),
                ),
          
          
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: buildCountry(),
                ),
          
                SizedBox(
                  height: 20,
                ),
          
          
          
          
          
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Obx(()=>
                           Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 250,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(controller.imageUrl.value), // Use the imageUrl passed from SingleCourse
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
          
          
                      Positioned(
                        top: 180,
                        right: 10,
                        child: ElevatedButton(
                          onPressed: () {
          
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Enroll Now'),
                                  content: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,// Popup title
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Username',
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
                                            labelText: 'Email',
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
                                            labelText: 'Password',
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust the content padding
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                                            ),
                                          ),
                                          obscureText: true,
                                        ),
                                        SizedBox(height: 8),
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Confirm Password',
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust the content padding
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                                            ),
                                          ),
                                          obscureText: true,
                                        ),
                                        SizedBox(height: 8), // Add some vertical spacing between text fields
                                        TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Country',
                                            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Adjust the content padding
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(8.0),
                                              borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
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
                                          Navigator.of(context).pop(); // Close the popup
                                        },
                                        child: Text(
                                          'Enroll Now',
                                          style: TextStyle(fontSize: 14, color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black87,
                                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50), // Adjust button padding
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Adjust button border radius
                                        ),
          
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
          
          
          
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) {
                            //     return AlertDialog(
                            //       title: Text('Enroll Now'), // Popup title
                            //       content: Text('Your popup content goes here.'), // Popup content
                            //       actions: <Widget>[
                            //         TextButton(
                            //           child: Text('Close'),
                            //           onPressed: () {
                            //             Navigator.of(context).pop(); // Close the popup
                            //           },
                            //         ),
                            //       ],
                            //     );
                            //   },
                            // );
                          },
                          style: ElevatedButton.styleFrom(

                            primary: Color(0xffFFBA59),
                            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          child: Text(
                            'Enroll Now',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      // Positioned(
                      //   top: 180, // Adjust the position from the top as needed
                      //   right: 10, // Adjust the position from the right as needed
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       // Handle button tap
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       primary: Color(0xffE17922), // Change button color here
                      //       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20), // Adjust button padding
                      //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Adjust button border radius
                      //     ),
                      //     child: Text('Enroll Now',style: TextStyle(fontSize: 18 ,color: Colors.white), ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
          
          
          
          
          
          
          
          
          
                // Center(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(20),
                //     child: Container(
                //       width: MediaQuery.of(context).size.width * 0.9,
                //       height: 250,
                //       padding: EdgeInsets.symmetric(horizontal: 40),
                //       decoration: BoxDecoration(
                //         image: DecorationImage(
                //           image: NetworkImage(imageUrl), // Use the imageUrl passed from SingleCourse
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
          
                SizedBox(height: 20), // Add spacing between the image and the card row
          
                // Two cards in one line
                Padding(
                  padding: const EdgeInsets.only(left: 12.0 , right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCourseCard('1,876', 'Student Enrolled' ),
                      _buildCourseCard('46 ', 'Total Classes'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
          
                Padding(
                  padding: EdgeInsets.only(left: 20 , right: 20), // Adjust the value according to your preference
                  child: Text(
          
                    controller.title.value,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          
          
                ),
          
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 20.0 , right: 20.0), // Adjust the value according to your preference
                  child: Text(
                    controller.description.value,
                    style: TextStyle(
                      color: Color(0xff8391A1),
                      fontSize: 16,

                    ),
                  ),
          
          
                ),
          
                // Center(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(20), // Set the border radius for rounded corners
                //     child: Container(
                //       width: MediaQuery.of(context).size.width * 0.9,
                //       height: 250,
                //       padding: EdgeInsets.symmetric(horizontal: 40), // Add horizontal padding for space on both ends
                //       decoration: BoxDecoration(
                //         image: DecorationImage(
                //           image: NetworkImage(
                //             'https://graphicsfamily.com/wp-content/uploads/edd/2022/01/Online-Education-Landing-Page-Design-Orage-Version-870x490.jpg', // Replace with your image URL
                //           ),
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
          
          
                // Container(
                //   padding: EdgeInsets.all(16),
                //
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'Course',
                //               style: TextStyle(
                //                 fontSize: 32,
                //                 fontWeight: FontWeight.bold,
                //                 color: Color(0xff403D3A),
                //               ),
                //             ),
                //
                //           ],
                //         ),
                //       ),
                //
                //
                //
                //     ],
                //   ),
                //
                //
                // ),
          
          
                Container(
                  padding: EdgeInsets.only(left: 10.0 , right: 10.0 , top: 10),

                  height: 500,
                  child: ListView(
                    children: [
                      _buildProductCards(context, 'Class 1', '5pm to 7pm',
                          'assets/course1.jpg'),
                      SizedBox(height: 8), // Add spacing between rows
                      _buildProductCards(context, 'Class 2', '5pm to 7pm',
                          'assets/course2.jpg'),
                      SizedBox(height: 8), // Add spacing between rows
                      _buildProductCards(context, 'Class 3', '5pm to 7pm',
                          'assets/course3.jpg'),
                      SizedBox(height: 8), // Add spacing between rows
                      _buildProductCards(context, 'Class 4', '5pm to 7pm',
                          'assets/course4.jpg'),
          
                      _buildProductCards(context, 'Class 1', '5pm to 7pm',
                          'assets/course1.jpg'),
                      SizedBox(height: 8), // Add spacing between rows
                      _buildProductCards(context, 'Class 2', '5pm to 7pm',
                          'assets/course2.jpg'),
                      SizedBox(height: 8), // Add spacing between rows
                      _buildProductCards(context, 'Class 3', '5pm to 7pm',
                          'assets/course3.jpg'),
                      SizedBox(height: 8), // Add spacing between rows
                      _buildProductCards(context, 'Class 4', '5pm to 7pm',
                          'assets/course4.jpg'),
                      // Add more product cards as needed
                    ],
                  ),
                ),
          
          
                // Container(
                //   height: 530, // Set the height of the container to control the overall height
                //   child: ListView(
                //     children: [
                //       Row(
                //         children: [
                //           Expanded(
                //               child: _buildProductCards( context ,'@Course', 'Description 1', 'https://cdn.create.vista.com/api/media/small/241370306/stock-photo-attractive-businesswoman-holding-paper-cup-looking-away-workplace' ,'4'),
                //           ),
                //           SizedBox(width: 8), // Add spacing between the two images
                //           Expanded(
                //             child: _buildProductCards(  context,'@Course 2', 'Description 2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3nCr93hrP585bQnTiqEJkr9QKunYjuU9D3o-KUNcPewUTZGYXwroTb6qInQ5tu-w2M9U&usqp=CAU', '4.5'),
                //           ),
                //         ],
                //       ),
                //       SizedBox(height: 8), // Add spacing between rows
                //       Row(
                //         children: [
                //
                //           // Add spacing between the two images
                //           Expanded(
                //             child: _buildProductCards( context ,'@Course 3', 'Description 2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2GgM2-MdVG_8nZRpUkCgR3XVdVvx0DheuY1wn51Yu7dcUHNc2vj3qBEyzxG_FGcePVnA&usqp=CAU' , '3.5'),
                //           ),
                //           SizedBox(width: 8),
                //           Expanded(
                //             child: _buildProductCards( context ,'@Course 3', 'Description 3', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWnURuKiYWZKyfgcdsCeKBHU3DzuTUR-TQnS5PAhuTSsSezSfuIcBo48uxjKcTBeMIzHw&usqp=CAU' , '5'),
                //           ),
                //           // Add more product cards as needed
                //         ],
                //       ),
                //
                //       SizedBox(height: 8), // Add spacing between rows
                //       Row(
                //         children: [
                //
                //           // Add spacing between the two images
                //           Expanded(
                //             child: _buildProductCards( context,'@Course 5', 'Description 2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2GgM2-MdVG_8nZRpUkCgR3XVdVvx0DheuY1wn51Yu7dcUHNc2vj3qBEyzxG_FGcePVnA&usqp=CAU' , '4'),
                //           ),
                //           SizedBox(width: 8),
                //           Expanded(
                //             child: _buildProductCards( context ,'@Course 6', 'Description 3', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWnURuKiYWZKyfgcdsCeKBHU3DzuTUR-TQnS5PAhuTSsSezSfuIcBo48uxjKcTBeMIzHw&usqp=CAU' , '3'),
                //           ),
                //           // Add more product cards as needed
                //         ],
                //       ),
                //
                //       SizedBox(height: 8), // Add spacing between rows
                //       Row(
                //         children: [
                //
                //           // Add spacing between the two images
                //           Expanded(
                //             child: _buildProductCards( context ,'@Course 5', 'Description 2', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2GgM2-MdVG_8nZRpUkCgR3XVdVvx0DheuY1wn51Yu7dcUHNc2vj3qBEyzxG_FGcePVnA&usqp=CAU' , '5'),
                //           ),
                //           SizedBox(width: 8),
                //           Expanded(
                //             child: _buildProductCards( context ,'@Course 6', 'Description 3', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWnURuKiYWZKyfgcdsCeKBHU3DzuTUR-TQnS5PAhuTSsSezSfuIcBo48uxjKcTBeMIzHw&usqp=CAU' , '4.5'),
                //           ),
                //           // Add more product cards as needed
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
          
          
                Padding(
                  padding: const EdgeInsets.only(bottom: 20 , top:20),
          
                ),
              ],
          
            ),
          
          ),
        ),
      ),

      // bottomNavigationBar: Obx(
      //     ()=> BottomNavigationBar(
      //       backgroundColor: Colors.white, // Set the background color to black
      //       selectedItemColor: Color(0xffDA8938), // Set the selected item color to white
      //       unselectedItemColor:
      //       Colors.grey[700],
      //       currentIndex: controller.currentIndex.value,// Set the unselected item color to grey
      //       items: const <BottomNavigationBarItem>[
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.home,
      //             size: 34, ),
      //           label: '',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.library_books_rounded , size: 34),
      //           label: '',
      //         ),
      //
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.message,  size: 34,),
      //           label: '',
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.person,  size: 34,),
      //           label: '',
      //         ),
      //       ],
      //
      //       onTap: (int index) {
      //         controller.currentIndex.value = index;
      //
      //         if (index == 0) {
      //
      //           Get.toNamed(AppConstant.kHomeScreen);
      //           // Navigate to the WelcomePage when Home is selected
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(
      //           //     builder: (context) => HomeScreen(),
      //           //   ),
      //           // );
      //         }
      //         if (index == 1) {
      //           Get.to(Courses());
      //           // Navigate to the WelcomePage when Home is selected
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(
      //           //     builder: (context) => Courses(),
      //           //   ),
      //           // );
      //         }
      //
      //         if (index == 2) {
      //
      //           Get.to(Support());
      //           // Navigate to the WelcomePage when Home is selected
      //           // Navigator.of(context).push(
      //           //   MaterialPageRoute(
      //           //     builder: (context) => Support(),
      //           //   ),
      //           // );
      //         }
      //       }
      //   ),
      // ),
    );
  }

  Widget _buildProductCards(BuildContext context , String title, String description, String imageUrl) {


    // return GestureDetector(
    //   onTap: () {
    //     // Add your onTap functionality here
    //   },
    //   child: Container(
    //
    //
    //
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //     width: MediaQuery.of(context).size.width, // Set the width of the container to the screen width
    //     margin: EdgeInsets.all(8),
    //     child: Row(
    //       children: <Widget>[
    //         Container(
    //           width: 150, // Set the width of the image container
    //           height: 100, // Set the height of the image container
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(8),
    //             image: DecorationImage(
    //               image: NetworkImage(imageUrl),
    //               fit: BoxFit.cover,
    //             ),
    //           ),
    //         ),
    //         SizedBox(width: 8), // Add some space between the image and text
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Text(
    //                 title,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 16,
    //                 ),
    //               ),
    //               Text(
    //                 description,
    //                 style: TextStyle(fontSize: 14, color: Colors.grey),
    //               ),
    //               _buildRatingStars(double.parse(rating)),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );


    return GestureDetector(
      onTap: () {
        // Add your onTap functionality here
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 16, // Set the width of the container to the screen width minus horizontal padding
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8), // Add vertical padding and horizontal padding
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8), // Add padding to the top, bottom, and left of the container
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
          color: Color(0xffF5F5FF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: 150, // Set the width of the image container
              height: 100, // Set the height of the image container
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8), // Add some space between the image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 4), // Add some space between title and description
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time_filled, // Use your desired clock icon here
                        color: Color(0xffFFBA59),
                        size: 16,
                      ),
                      SizedBox(width: 4), // Add space between icon and text
                      Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0 , top: 15),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Enroll Now",
                            style: TextStyle(fontSize: 16, color: Color(0xff000000)),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xff000000),
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: Text(
                  //     "Enroll Now ->",
                  //     style: TextStyle(fontSize: 16, color: Color(0xffE17922)),
                  //   ),
                  // ),

                ],
              ),
            ),
          ],
        ),
      ),
    );





  }

  Widget buildCountry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Container(

          decoration: BoxDecoration(
            color: Colors.white, // Set the background color of the box to brown
            borderRadius: BorderRadius.circular(10), // Optional: You can set border radius for rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60,
          width: 420,
          padding: EdgeInsets.only(left:10 ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items horizontally
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.black87),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search Now',
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffFFBA59), // Set the background color of the button to brown
                    borderRadius: BorderRadius.circular(10), // Optional: You can set border radius for rounded corners
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Handle search button press here
                    },
                  ),
                ),
              ),
            ],
          ),
        )




        // Container(
        //   alignment: Alignment.centerLeft,
        //   decoration: BoxDecoration(
        //       color: Colors.grey[200],
        //       borderRadius: BorderRadius.circular(20),
        //       border: Border.symmetric(),
        //       boxShadow: [
        //         BoxShadow(
        //             color: Colors.white12, blurRadius: 6, offset: Offset(0, 2))
        //       ]),
        //   height: 60,
        //   width: 400,
        //   child: TextField(
        //
        //     style: TextStyle(
        //       color: Colors.black87,
        //     ),
        //     decoration: InputDecoration(
        //         border: InputBorder.none,
        //         contentPadding: EdgeInsets.only(top: 14),
        //
        //         hintText: 'Search',
        //         hintStyle: TextStyle(
        //           color: Colors.black54,
        //         )),
        //   ),
        // ),



      ],
    );
  }

  Widget _buildCourseCard(String title, String description) {
    return Container(
      width: 150, // Set the width of the card
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],

        color: Color(0xffF5F5FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
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
          ),


        ],
      ),
    );
  }

  Widget _buildRatingStars(double rating) {
    int numberOfStars = rating.round();
    List<Widget> stars = [];
    for (int i = 0; i < numberOfStars; i++) {
      stars.add(Icon(Icons.star, color: Color(0xffDA8938), size: 16));
    }
    return Row(children: stars);
  }






}