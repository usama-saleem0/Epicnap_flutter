


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_module_controller/home_screen.dart';

class HomeScreen extends GetView<HomeScreenController>{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      backgroundColor: Color(0XffF5F5FF ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 30,
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
              //               'Hey John',
              //               style: TextStyle(
              //                 fontSize: 32,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black87,
              //               ),
              //             ),
              //             Text(
              //               'Lets learn together',
              //               style: TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //                 color: Colors.black54,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(width: 8), // Add some space between text and image
              //       CircleAvatar(
              //         radius: 25, // Set the radius of the circle avatar
              //         backgroundImage: AssetImage('assets/user.png'), // Replace 'assets/small_image.png' with your image path
              //       ),
              //     ],
              //   ),
              //
              //
              //
              // ),
        
              // SizedBox(
              //   height: 20,
              // ),
        
        
        
              // SizedBox(
              //   height: 30,
              // ),


              Container(
                height: 370,


                // padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 40 ),
                padding: EdgeInsets.only(top: 240,bottom: 30, left: 20, right:20),

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bannerss.png'),
                    fit: BoxFit.cover,
                    // image: NetworkImage(
                    //   'https://graphicsfamily.com/wp-content/uploads/edd/2022/01/Online-Education-Landing-Page-Design-Orage-Version-870x490.jpg', // Replace with your image URL
                    // ),

                  ),
                ),

               child: Container(
                 padding: EdgeInsets.only(top: 30),
                 // Adjust the left value as needed
                  child: buildCountry(),
                ),
              ),

              // buildCountry(),
        
        
        
              Container(
                // padding: EdgeInsets.all(16),
                padding: EdgeInsets.only(left: 20, right:20 , top:20),
        
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Influencers',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff1E232C),
                            ),
                          ),
        
                        ],
                      ),
                    ),
                    SizedBox(width: 8, height: 50,),
                    GestureDetector(
                      onTap: () {
                        controller.onInfluencersTap();
                        // Get.to(Influencer());
                        // Navigator.push(
                        //   context,
                        //
                        //   MaterialPageRoute(
                        //
                        //
                        //     builder: (context) => Influencer(), // Replace NewPage() with the widget of the new page you want to navigate to
                        //   ),
                        // );
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFBA59),
                        ),
                      ),
                    )
        
        
                    // Add some space between text and image
                    // Text(
                    //
                    //   'view all',
                    //   style: TextStyle(
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.bold,
                    //     color: Color(0xffE17922),
                    //   ),
                    // ),
        
        
                  ],
                ),
        
        
              ),
        
              Container(
                padding: EdgeInsets.only(left: 15, right:15),
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildProductCard(context ,'Arik Johnson', '@Arik Johnson', 'assets/influencer1.jpg'),
                    _buildProductCard(context ,'Sandhya Mer', '@Sandhya Mer', 'assets/influencer2.jpg'),
                    _buildProductCard(context ,'Arik Johnson', '@Arik Johnson', 'assets/influencer5.jpg'),
        
                    // Add more product cards as needed
                  ],
                ),
              ),
        
              Container(
                padding: EdgeInsets.only(left: 20, right:20 , bottom:0),
        
                child: Row(
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
                    // Add some space between text and image
                    GestureDetector(
                      onTap: () {
                          controller.dashboardScreenController.currentIndex.value=1;
        
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffFFBA59),
                        ),
                      ),
                    )
        
        
                  ],
                ),
        
        
              ),
        
        
              Container(
                  padding: EdgeInsets.only(left: 12, right:12, top: 10),
                height: 300,
        
                 child: GridView.count(
        
        
                    crossAxisCount: 2,
                    children: [
                      _buildProductCards(context ,'Natural Language Process', 'Description 1', 'assets/course1.jpg' ,'4'),
                      _buildProductCards(context ,'Computer Version Courses', 'Description 2', 'assets/course2.jpg', '4'),
                      _buildProductCards(context ,'Natural Language Process', 'Description 2', 'assets/course3.jpg' , '5'),
                      _buildProductCards(context ,'Computer Version Courses', 'Description 3', 'assets/course4.jpg' , '3'),
        
                      _buildProductCards(context ,'Natural Language Process', 'Description 2', 'assets/course5.jpg' , '5'),
                      _buildProductCards(context ,'Computer Version Courses', 'Description 3', 'assets/course2.jpg' , '3'),
                      // Add more product cards as needed
                    ],
        
                  )
        
                // Set the height of the container to control the overall height
                // child: ListView(
                //   children: [
                //     Row(
                //       children: [
                //         Expanded(
                //           child: _buildProductCards(context ,'@Courses', 'Description 1', 'assets/course1.jpg' ,'4'),
                //         ),
                //         SizedBox(width: 8), // Add spacing between the two images
                //         Expanded(
                //           child: _buildProductCards(context ,'@Courses 2', 'Description 2', 'assets/course2.jpg', '4'),
                //         ),
                //       ],
                //     ),
                //     SizedBox(height: 8), // Add spacing between rows
                //     Row(
                //       children: [
                //
                //         // Add spacing between the two images
                //         Expanded(
                //           child: _buildProductCards(context ,'@Courses 3', 'Description 2', 'assets/course3.jpg' , '5'),
                //         ),
                //         SizedBox(width: 8),
                //         Expanded(
                //           child: _buildProductCards(context ,'@Courses 3', 'Description 3', 'assets/course4.jpg' , '3'),
                //         ),
                //         // Add more product cards as needed
                //       ],
                //     ),
                //
                //     SizedBox(height: 8), // Add spacing between rows
                //     Row(
                //       children: [
                //
                //         // Add spacing between the two images
                //         Expanded(
                //           child: _buildProductCards(context ,'@Courses 3', 'Description 2', 'assets/course2.jpg' , '5'),
                //         ),
                //         SizedBox(width: 8),
                //         Expanded(
                //           child: _buildProductCards(context ,'@Courses 3', 'Description 3', 'assets/course1.jpg' , '3'),
                //         ),
                //         // Add more product cards as needed
                //       ],
                //     ),
                //
                //   ],
                // ),
              ),
        
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10 , top:50),
              //
              // ),
        
        
        
        
        
        
        
        
        
              // Container(
              //   height: 200,
              //   color: Colors.black, // Adjust the card height
              //   child: Card(
              //     elevation: 4,
              //     color: Colors.black,
              //     child: Column(
              //       children: [
              //         Image.network(
              //           'https://st4.depositphotos.com/16413118/20484/i/450/depositphotos_204848702-stock-photo-strong-men-black-background.jpg',
              //           height: 120,
              //           width: double.infinity,
              //           fit: BoxFit.cover,
              //         ),
              //         SizedBox(height: 4),
              //         Text(
              //           'Mens Shirt',
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
        
        
        
        
              // Container(
              //   height: 60,
              //   color: Colors.grey[900], // Adjust color as needed
              //   padding: EdgeInsets.symmetric(horizontal: 16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       IconButton(
              //         icon: Icon(Icons.home, color: Colors.white),
              //         onPressed: () {
              //           // Navigate to the home screen
              //         },
              //       ),
              //       IconButton(
              //         icon: Icon(Icons.shopping_cart, color: Colors.white),
              //         onPressed: () {
              //           // Navigate to the cart screen
              //         },
              //       ),
              //       IconButton(
              //         icon: Icon(Icons.person, color: Colors.white),
              //         onPressed: () {
              //           // Navigate to the user profile screen
              //         },
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
    );
  }

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
          // color: Colors.white70,
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

  Widget _buildProductCard(BuildContext context , String title, String description, String imageUrl) {
    return GestureDetector(
      onTap: () {
        controller.onInfluncerTap(title: title , description: description, imageUrl: imageUrl );
        // Get.to(Influencer(),arguments: )
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => SingleInfluencer(
        //
        //       title: title,
        //       description: description,
        //       imageUrl: imageUrl,
        //       // rating: double.parse(rating),
        //     ),
        //   ),
        // );
      },
      child: Container(
        width: 175,

        margin: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                _buildSmallCard(' 10k', Icons.facebook),
                SizedBox(width: 8),
                _buildSmallCard(' 5k', Icons.youtube_searched_for_sharp),
              ],
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),

          ],
        ),
      ),
    );
  }


  Widget _buildSmallCard(String text , IconData iconData) {
    return Padding(
      padding: EdgeInsets.only(left: 10), // Add left padding to the entire small card
      child: Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
          // color: Color(0XffF5F5FF), // Set your desired color
          color: Colors.white30, // Set your desired color
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black54),

        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0), // Adjust the left margin as needed
              child: Icon(
                iconData,
                size: 20,
                color: Colors.black87,
              ),
            ),
            SizedBox(width: 2.0), // Add some spacing between the icon and text
            Text(
              text,

              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),

        // child: Center(
        //
        //   child: Text(
        //     text,
        //     style: TextStyle(
        //       fontSize: 12, // Set your desired font size
        //       color: Colors.black, // Set your desired text color
        //     ),
        //   ),
        // ),
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
              BoxShadow(color: Colors.white12, blurRadius: 6, offset: Offset(0, 2)),
            ],
          ),
          height: 60,
          width: 420,

          padding: EdgeInsets.only(left:10 ), // Add horizontal padding
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
                    color: Color(0xffDBA4A1), // Set the background color of the button to brown
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

  Widget _buildRatingStars(double rating) {
    int numberOfStars = rating.round();
    List<Widget> stars = [];
    for (int i = 0; i < numberOfStars; i++) {
      stars.add(Icon(Icons.star, color: Color(0xffFFBA59), size: 14));
    }
    return Row(children: stars);
  }
}