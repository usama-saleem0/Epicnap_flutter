

import 'package:first_project/controller/home_module_controller/influencer_home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';





class InfluencerHomeScreen extends GetView<InfluencerHomeController>{
  const InfluencerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Center(
              //   child: Stack(
              //     children: [
              //       ClipRRect(
              //         borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(20),
              //           bottomRight: Radius.circular(20),
              //         ),
              //         child: Obx(()=> Container(
              //           height: 300,
              //           padding: EdgeInsets.symmetric(horizontal: 40),
              //           decoration: BoxDecoration(
              //             image: DecorationImage(
              //               image: NetworkImage(
              //                   // controller.imageUrl.value
              //                 controller.editProfileScreenController.message.value =='edit' ? controller.editProfileScreenController.imageUrl.value: controller.influencerDashboardScreenController.imageUrl.value ,
              //               ),
              //               fit: BoxFit.cover,
              //             ),
              //           ),
              //         ),
              //         ),
              //       ),
              //       Container(
              //         padding: EdgeInsets.only(right: 16.0 , top:8.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.end, // Align elements to the right
              //           children: [
              //             Icon(
              //               Icons.notifications, // Bell icon
              //               color: Colors.black,
              //             ),
              //
              //             SizedBox(width: 8), // Add spacing between the icons and the image
              //             Container(
              //               width: 60, // Set the width to create a square container
              //               height: 60,
              //               // Set the height to create a square container
              //               decoration: BoxDecoration(
              //                 shape: BoxShape.rectangle,
              //                 borderRadius: BorderRadius.circular(10),
              //                 border: Border.all(
              //                   color: Colors.black38, // Black border color
              //                   width: 2, // Border width
              //                 ),
              //               ),
              //               child: CircleAvatar(
              //                 radius: 23, // Set the radius of the circle avatar
              //                 backgroundImage: NetworkImage(
              //                   controller.editProfileScreenController.message.value =='edit' ? controller.editProfileScreenController.imageUrl.value: controller.influencerDashboardScreenController.imageUrl.value ,
              //                 ),
              //               ),
              //             ),
              //
              //             // SizedBox(width: 2),
              //             IconButton(
              //               icon: Icon(
              //                 Icons.settings,
              //                 color: Colors.black,
              //               ),
              //               onPressed: () {
              //                 controller.onAccountTap();
              //                 // Handle edit action
              //               },
              //             ),// Add spacing between the icon and image
              //             // Icon(
              //             //   Icons.settings, // Settings icon
              //             //   color: Colors.black,
              //             // ),
              //           ],
              //         ),
              //       )
              //
              //
              //     ],
              //   ),
              // ),
              //
              //
              // ClipRRect(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(20),
              //     topRight: Radius.circular(20),
              //   ),
              //
              //   // Add spacing between the image and the card row
              //   child:Container(
              //     color: Color(0XffF5F5FF), // Set background color to white
              //     padding: EdgeInsets.all(20),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //
              //         SizedBox(height: 20),
              //
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align the text to the left and the edit icon to the right
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
              //               child: Obx(() => Text(
              //
              //                     // if (controller.editProfileScreenController.name.value ) {
              //                     //  controller.editProfileScreenController.name.value;
              //                     // } else {
              //                     // controller.influencerDashboardScreenController.name.value;
              //                     // }
              //                                               // String displayName = controller.editProfileScreenController.name.value ?? controller.influencerDashboardScreenController.name.value;
              //
              //               // controller.influencerDashboardScreenController.name.value,
              //                 controller.editProfileScreenController.message.value =='edit' ? controller.editProfileScreenController.name.value: controller.influencerDashboardScreenController.name.value ,
              //                 style: TextStyle(
              //                   color: Colors.black87,
              //                   fontSize: 24,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               )),
              //             ),
              //
              //             Row(
              //               children: [
              //                 Text(
              //                   'Edit', // Your text here
              //                   style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.bold
              //                   ),
              //                 ),
              //                 IconButton(
              //                   icon: Icon(
              //                     Icons.edit,
              //                     color: Colors.black,
              //                   ),
              //                   onPressed: () {
              //                     controller.onEditTap();
              //                     // Handle edit action
              //                   },
              //                 ),
              //
              //               ],
              //             )
              //             // IconButton(
              //             //
              //             //   icon: Icon(
              //             //     Icons.edit, // Edit icon
              //             //     color: Colors.black,
              //             //   ),
              //             //   onPressed: () {
              //             //     // Handle edit action
              //             //   },
              //             // ),
              //           ],
              //         ),
              //
              //
              //         // SizedBox(height: 10),
              //         Padding(
              //           padding: EdgeInsets.only(left: 18.0, right: 18.0), // Adjust the value according to your preference
              //           child: Obx(()=>
              //               Text(
              //                 controller.editProfileScreenController.message.value =='edit' ? controller.editProfileScreenController.description.value: controller.influencerDashboardScreenController.description.value ,
              //                 // controller.influencerDashboardScreenController.description.value,
              //                 style: TextStyle(
              //                   color: Colors.black87,
              //                   fontSize: 16,
              //
              //                 ),
              //               ),
              //           ),
              //         ),
              //         SizedBox(height: 20), // Add spacing between the image and the card row
              //
              //         Padding(
              //           padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.email, // Use the email icon or any other icon you prefer
              //                 color: Colors.black87,
              //                 size: 20, // Adjust the size of the icon as needed
              //               ),
              //               SizedBox(width: 8), // Add spacing between the icon and text
              //               Text(
              //                 controller.editProfileScreenController.message.value =='edit' ? controller.editProfileScreenController.email.value: controller.influencerDashboardScreenController.email.value ,
              //                 // controller.influencerDashboardScreenController.email.value,
              //                 // 'influencer@gmail.com',
              //                 style: TextStyle(
              //                   color: Colors.black87,
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //
              //
              //
              //         SizedBox(height: 20),
              //
              //         Padding(
              //           padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
              //           child: Text(
              //             'Introduction',
              //             style: TextStyle(
              //               color: Colors.black87,
              //               fontSize: 24,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //
              //         SizedBox(height: 10),
              //         Padding(
              //           padding: EdgeInsets.only(left: 18.0, right: 18.0), // Adjust the value according to your preference
              //           child: Text(
              //             controller.editProfileScreenController.message.value =='edit' ? controller.editProfileScreenController.about.value: controller.influencerDashboardScreenController.about.value ,
              //             // controller.influencerDashboardScreenController.about.value,
              //             // 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Obcaecati voluptatem deleniti laboriosam nobis reprehenderit fugiat necessitatibus sequi, nostrum rerum enim expedita laborum. Necessitatibus vitae commodi unde explicabo blanditiis, praesentium repellendus?',
              //             style: TextStyle(
              //               color: Colors.black45,
              //               fontSize: 16,
              //
              //             ),
              //           ),
              //         ),
              //
              //         Padding(
              //           padding: const EdgeInsets.only(bottom: 20, top: 20),
              //         ),
              //
              //         Padding(
              //           padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
              //           child: Text(
              //             'Education',
              //             style: TextStyle(
              //               color: Colors.black87,
              //               fontSize: 24,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //         ),
              //
              //         SizedBox(height: 10),
              //         Padding(
              //           padding: EdgeInsets.only(left: 18.0, right: 18.0), // Adjust the value according to your preference
              //           child: Text(
              //             controller.editProfileScreenController.message.value =='edit' ? controller.editProfileScreenController.education.value: controller.influencerDashboardScreenController.education.value ,
              //             // controller.influencerDashboardScreenController.education.value,
              //             // 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Obcaecati voluptatem deleniti laboriosam nobis reprehenderit fugiat necessitatibus sequi, nostrum rerum enim expedita laborum. Necessitatibus vitae commodi unde explicabo blanditiis, praesentium repellendus?',
              //             style: TextStyle(
              //               color: Colors.black45,
              //               fontSize: 16,
              //             ),
              //           ),
              //         ),
              //         SizedBox(height: 20),
              //
              //       ],
              //     ),
              //   ),
              // ),

            ],

          ),
        ),

      ),


    );
  }





}