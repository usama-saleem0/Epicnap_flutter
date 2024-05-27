
import 'package:first_project/controller/home_module_controller/course_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/influencer_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/custom_bottom_navigator.dart';




class InfluencerScreen extends GetView<InfluencerScreenController>{
  const InfluencerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XffF5F5FF),
      // backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
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
              //
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
                      width: 25, // Adjust the width according to your design
          
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
          
              Container(
                  padding: EdgeInsets.only(left: 20 , right: 20),
                  child: buildCountry()),
          
          
          
              Container(
                padding: EdgeInsets.only(left:20, top: 10, bottom: 0),
          
                child: Text(
                  'Influencers',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1E232C),
                  ),
                ),
          
          
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 10),

              ),



            Padding(
                padding: const EdgeInsets.only(left: 12, right: 12,),
                child: GridView.count(
          
                  physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    _buildProductCard(context, 'Sandhya Mer', '@SandyaMer21', 'assets/influencer1.jpg' ),
                    _buildProductCard(context ,'Arik Johnson', '@Arikjohnson21', 'assets/influencer2.jpg'),
                    _buildProductCard(context ,'Sandhya Mer', '@SandyaMer21', 'assets/influencer3.jpg' ),
                    _buildProductCard(context ,'Arik Johnson', '@Arikjohnson21', 'assets/influencer4.jpg' ),
          
                    _buildProductCard(context ,'Sandhya Mer', '@SandyaMer21', 'assets/influencer5.jpg' ),
                    _buildProductCard(context ,'Arik Johnson', '@Arikjohnson21', 'assets/influencer6.jpg' ),
                    _buildProductCard(context ,'Sandhya Mer', '@SandyaMer21', 'assets/influencer7.jpg' ),
                    _buildProductCard(context ,'Arik Johnson', '@Arikjohnson21', 'assets/influencer8.jpg' ),
          
                  ],
          
                ),
              ),
          
          
              Padding(
                padding: const EdgeInsets.only(bottom: 20 ),
          
              ),
            ],
          
          ),
          
                ),
        ),
    // bottomNavigationBar: Obx(()=> BottomNavigator(onTap: (index){
    //   controller.dashboardScreenController.currentIndex.value=index;
    //   if(controller.dashboardScreenController.currentIndex.value==0){
    //     Get.back();
    //   }else{
    //     Get.back();
    //     controller.dashboardScreenController.currentIndex.value=index;
    //    // Get.back();
    //   }
    //
    //
    // }, currentIndex:  controller.dashboardScreenController.currentIndex.value),
    // )

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
              // BoxShadow(color: Colors.grey, blurRadius: 6, offset: Offset(0, 2)),

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
          padding: EdgeInsets.only(left:10),

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




  // Widget _buildProductCard(BuildContext context , String title, String description, String imageUrl) {
  //   return GestureDetector(
  //     onTap: () {
  //       controller.onInfluncerTap(title: title , description: description, imageUrl: imageUrl );
  //       // Get.to(Influencer(),arguments: )
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => SingleInfluencer(
  //       //
  //       //       title: title,
  //       //       description: description,
  //       //       imageUrl: imageUrl,
  //       //       // rating: double.parse(rating),
  //       //     ),
  //       //   ),
  //       // );
  //     },
  //     child: Container(
  //       width: 175,
  //       height: 250,
  //       // height: 20,
  //       margin: EdgeInsets.only(left: 8, right: 8),
  //       child: Column(
  //         children: <Widget>[
  //           Container(
  //             height: 150,
  //
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(8),
  //               image: DecorationImage(
  //                 image: AssetImage(imageUrl),
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //           ),
  //           // SizedBox(height: 8),
  //           Text(
  //             title,
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 16,
  //             ),
  //           ),
  //           // SizedBox(height: 8),
  //           Row(
  //             children: <Widget>[
  //               _buildSmallCard(' 10k', Icons.facebook),
  //               SizedBox(width: 8),
  //               _buildSmallCard(' 5k', Icons.youtube_searched_for_sharp),
  //             ],
  //           ),
  //           SizedBox(height: 8),
  //           Text(
  //             description,
  //             style: TextStyle(fontSize: 14, color: Colors.black),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildProductCard(BuildContext context, String title, String description, String imageUrl) {
    return GestureDetector(
      onTap: () {
        controller.onInfluncerTap(title: title, description: description, imageUrl: imageUrl);
      },
      child: Container(
        width: 175,
        height: 300,
        margin: EdgeInsets.only(left: 6, right: 6),
        child: Column(
          children: <Widget>[
            Expanded( // Wrap the Container with Expanded
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: <Widget>[
                _buildSmallCard(' 10k', Icons.facebook),
                SizedBox(width: 6),
                _buildSmallCard(' 5k', Icons.youtube_searched_for_sharp),
              ],
            ),
            SizedBox(height: 6),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.black,
                fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }



  Widget _buildSmallCard(String text , IconData iconData) {
    return Padding(
      padding: EdgeInsets.only(left: 10), // Add left padding to the entire small card
      child: Container(
        height: 22,
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
}






