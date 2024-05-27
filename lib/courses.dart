import 'package:flutter/material.dart';
import 'welcome.dart';
import 'single_course.dart';
import 'support.dart';
void main() {
  runApp(Courses());
}

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'abiola.co',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: EcommerceHomePage(),
    );
  }
}

class EcommerceHomePage extends StatelessWidget {
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hey John',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Lets learn together',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ],
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











            Container(
              padding: EdgeInsets.all(16),

              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Courses',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff403D3A),
                          ),
                        ),

                      ],
                    ),
                  ),



                ],
              ),


            ),


            Container(
              height: 530, // Set the height of the container to control the overall height
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                            child: _buildProductCards(context, 'Natural Language Course Overview', 'Description 1', 'assets/course1.jpg' ,'4'),
                      ),
                      SizedBox(width: 8), // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'Natural Language Course Overview 2', 'Description 2', 'assets/course2.jpg', '4.5'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'Natural Language Course Overview 3', 'Description 2', 'assets/course3.jpg' , '3.5'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards( context ,'Natural Language Course Overview 4', 'Description 3', 'assets/course4.jpg' , '5'),
                      ),
                      // Add more product cards as needed
                    ],
                  ),

                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'Natural Language Course Overview 5', 'Description 2', 'assets/course1.jpg' , '4'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards(context ,'Natural Language Course Overview 6', 'Description 3', 'assets/course2.jpg' , '3'),
                      ),
                      // Add more product cards as needed
                    ],
                  ),

                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards( context ,'Natural Language Course Overview 7', 'Description 2', 'assets/course3.jpg' , '5'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards( context ,'Natural Language Course Overview 8', 'Description 3', 'assets/course4.jpg' , '4.5'),
                      ),
                      // Add more product cards as needed
                    ],
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(bottom: 20 , top:20),

            ),
          ],

        ),

      ),
    );
  }
}

Widget _buildProductCards(BuildContext context , String title, String description, String imageUrl, String rating ) {
  return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleCourse(

              title: title,
              description: description,
              imageUrl: imageUrl,
              // rating: double.parse(rating),
            ),
          ),
        );
      },
    // onTap: () {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => SingleCourse(), // Replace NewPage() with the widget of the new page you want to navigate to
    //     ),
    //   );
    // },
    child: Container(
      width: 190,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: _buildRatingStars(double.parse(rating)),
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

Widget _buildRatingStars(double rating) {
  int numberOfStars = rating.round();
  List<Widget> stars = [];
  for (int i = 0; i < numberOfStars; i++) {
    stars.add(Icon(Icons.star, color: Color(0xffDA8938), size: 16));
  }
  return Row(children: stars);
}


