
import 'package:first_project/controller/home_module_controller/course_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CourseScreen extends GetView<CourseScreenController>{
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: Color(0XffF5F5FF),
        body: SafeArea(
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
          
                const SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.only(left: 20 , right: 20),
                    child: buildCountry()),
          
          
          
          
                Container(
                  padding: const EdgeInsets.only(top:16 , left:24, ),

                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Courses',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1E232C),
                              ),
                            ),

                          ],
                        ),
                      ),



                    ],
                  ),


                ),



                const Padding(
                  padding: EdgeInsets.only(bottom: 10),

                ),
          
          
                Padding(
          
                    padding: const EdgeInsets.only(left: 12, right: 12),// Set the height of the container to control the overall height
                    child: GridView.count(
          
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        _buildProductCards(context ,'Natural Language Process..', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course1.jpg' ,'4'),
                        _buildProductCards(context ,'Computer Version Courses...', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course2.jpg', '4'),
                        _buildProductCards(context ,'Foundations of Google UX/UI Design', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course3.jpg' , '5'),
                        _buildProductCards(context ,'Foundations of Google UX/UI Design', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course4.jpg' , '3'),
          
                        _buildProductCards(context ,'Natural Language Process..', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course1.jpg' ,'4'),
                        _buildProductCards(context ,'Computer Version Courses...', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course2.jpg', '4'),
                        _buildProductCards(context ,'Foundations of Google UX/UI Design', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course3.jpg' , '5'),
                        _buildProductCards(context ,'Foundations of Google UX/UI Design', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 'assets/course4.jpg' , '3'),
          
          
                        // Add more product cards as needed
                      ],
          
                    )
          
                ),
          
          
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
          
                ),
              ],
          
            ),
          
          ),
        ),
      );
    }

  // Widget _buildProductCards(BuildContext context , String title, String description, String imageUrl, String rating ) {
  //   return GestureDetector(
  //     onTap: () {
  //       controller.onCourseTap(title: title, description: description, imageUrl: imageUrl);
  //     },
  //     // onTap: () {
  //     //   Navigator.push(
  //     //     context,
  //     //     MaterialPageRoute(
  //     //       builder: (context) => SingleCourse(), // Replace NewPage() with the widget of the new page you want to navigate to
  //     //     ),
  //     //   );
  //     // },
  //     child: Container(
  //       width: 190,
  //       margin: const EdgeInsets.all(8),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             height: 90,
  //             decoration: BoxDecoration(
  //               borderRadius: const BorderRadius.only(
  //                 topLeft: Radius.circular(8),
  //                 topRight: Radius.circular(8),
  //               ),
  //               image: DecorationImage(
  //                 image: AssetImage(imageUrl),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(4.0),
  //             child: Text(
  //               title,
  //               style: const TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(2.0),
  //             child: Text(
  //               description,
  //               style: const TextStyle(fontSize: 14, color: Colors.grey),
  //             ),
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.all(2.0),
  //             child: _buildRatingStars(double.parse(rating)),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildProductCards(BuildContext context , String title, String description, String imageUrl, String rating ) {
    return GestureDetector(
      onTap: () {
        controller.onCourseTap(title: title, description: description, imageUrl: imageUrl);
      },

      child: Container(
        width: 175,
        height: 300,



        margin: EdgeInsets.only(left: 10, right: 8, bottom: 10),
        decoration: BoxDecoration(
          color: Color(0XffF5F5FF),
          // color: Colors.white54,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Text(
            //   title,
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 15,
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.only(left: 8.0), // Adjust the value as needed
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),


            // Text(
            //   description,
            //   style: TextStyle(fontSize: 12, color: Colors.black),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   child: Text(
            //     description,
            //     style: TextStyle(fontSize: 14, color: Colors.grey),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0 , left: 5.0, bottom: 3.0),
              child: _buildRatingStars(double.parse(rating)),
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
            color: Colors.grey[100], // Set the background color of the box to brown
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
          height: 55,
          width: 420,
          padding: EdgeInsets.only(left:10), // Add horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items horizontally
            children: [
              const Expanded(
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
                    color: const Color(0xffDBA4A1), // Set the background color of the button to brown
                    borderRadius: BorderRadius.circular(10), // Optional: You can set border radius for rounded corners
                  ),
                  child: IconButton(
                    icon: const Icon(
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

  Widget _buildRatingStars(double rating) {
    int numberOfStars = rating.round();
    List<Widget> stars = [];
    for (int i = 0; i < numberOfStars; i++) {
      stars.add(Icon(Icons.star, color: Color(0xffFFBA59), size: 14));
    }
    return Row(children: stars);
  }
  }






