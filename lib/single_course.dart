import 'package:flutter/material.dart';
import 'welcome.dart';
import 'support.dart';
import 'courses.dart';

void main() {
  runApp(SingleCourse(imageUrl: 'https://example.com/image.jpg' , title:'' , description:''));
}

class SingleCourse extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  SingleCourse({required this.imageUrl , required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'abiola.co',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: EcommerceHomePage(imageUrl: 'https://example.com/image.jpg'),
      home: EcommerceHomePage(imageUrl: imageUrl , title: title , description:description),
    );
  }
}

class EcommerceHomePage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  //
  EcommerceHomePage({required this.imageUrl ,  required this.title , required this.description});

  // final String imageUrl;
  //
  // EcommerceHomePage({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),

            Container(
              padding: EdgeInsets.all(16),

              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 110.0), // Add left padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'abiola.co',
                            style: TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                              color:  Color(0xffDA8938),
                            ),
                          ),
                          // Other widgets in the column if needed
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8), // Add some space between text and image
                  CircleAvatar(
                    radius: 25, // Set the radius of the circle avatar
                    backgroundImage: AssetImage('assets/user.png'), // Replace 'assets/small_image.png' with your image path
                  ),
                ],
              ),



            ),


          SizedBox(
            height: 20,
          ),
          buildCountry(),

            SizedBox(
              height: 20,
            ),





            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 250,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageUrl), // Use the imageUrl passed from SingleCourse
                          fit: BoxFit.cover,
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
                                      style: TextStyle(fontSize: 18, color: Colors.white),
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
                        primary: Color(0xffDA8938),
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text(
                        'Enroll Now',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCourseCard('1876', 'Student Enrolled' ),
                _buildCourseCard('46 ', 'Total'),
              ],
            ),
            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
              child: Text(

                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),


            ),

            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 18.0 , right: 18.0), // Adjust the value according to your preference
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
              height: 530,
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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Set the background color to black
        selectedItemColor: Color(0xffDA8938), // Set the selected item color to white
        unselectedItemColor:
        Colors.grey[700], // Set the unselected item color to grey
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
              size: 34, ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded , size: 34),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.message,  size: 34,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,  size: 34,),
            label: '',
          ),
        ],

          onTap: (int index) {
            if (index == 0) {
              // Navigate to the WelcomePage when Home is selected
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            }
            if (index == 1) {
              // Navigate to the WelcomePage when Home is selected
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Courses(),
                ),
              );
            }

            if (index == 2) {
              // Navigate to the WelcomePage when Home is selected
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Support(),
                ),
              );
            }
          }
      ),
    );
  }
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
        color: Colors.white,
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
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4), // Add some space between title and description
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time_filled, // Use your desired clock icon here
                      color: Color(0xffDA8938),
                      size: 16,
                    ),
                    SizedBox(width: 4), // Add space between icon and text
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),

                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Enroll Now",
                        style: TextStyle(fontSize: 16, color: Color(0xffDA8938)),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Color(0xffDA8938),
                        size: 16,
                      ),
                    ],
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
// Widget _buildProductCards(String title, String description, String imageUrl, String rating) {
//   return Container(
//     width: 190,
//     margin: EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       color: Colors.white, // Set the background color to grey
//       borderRadius: BorderRadius.circular(8),
//     ),
//     child: Column(
//       children: <Widget>[
//         Container(
//           height: 120,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(8),
//               topRight: Radius.circular(8),
//             ),
//             image: DecorationImage(
//               image: NetworkImage(imageUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             title,
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 16,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: Text(
//             description,
//             style: TextStyle(fontSize: 14, color: Colors.grey),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(4.0),
//           child: _buildRatingStars(double.parse(rating)),
//         ),
//       ],
//     ),
//   );
// }

// Widget _buildProductCards(String title, String description, String imageUrl ,String rating) {
//   return Container(
//     width: 190,
//     margin: EdgeInsets.all(8),
//     child: Column(
//       children: <Widget>[
//         Container(
//           height: 120,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             image: DecorationImage(
//               image: NetworkImage(imageUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           title,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//         ),
//         SizedBox(height: 4),
//         Text(
//           description,
//           style: TextStyle(fontSize: 14, color: Colors.grey),
//         ),
//
//         SizedBox(height: 4),
//
//
//         _buildRatingStars(double.parse(rating)),
//       ],
//     ),
//   );
// }



Widget buildCountry() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[

      Container(
        decoration: BoxDecoration(
          color: Colors.grey[100], // Set the background color of the box to brown
          borderRadius: BorderRadius.circular(20), // Optional: You can set border radius for rounded corners
          boxShadow: [
            BoxShadow(color: Colors.white12, blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        height: 60,
        width: 420,
        padding: EdgeInsets.symmetric(horizontal: 16), // Add horizontal padding
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
                  color: Color(0xffDA8938), // Set the background color of the button to brown
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
    width: 180, // Set the width of the card
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
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
          style: TextStyle(fontSize: 14, color: Colors.grey),
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


