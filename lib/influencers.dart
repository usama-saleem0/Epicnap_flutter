import 'package:flutter/material.dart';
import 'welcome.dart';
import 'single_influencer.dart';
import 'support.dart';
import 'courses.dart';


void main() {
  runApp(Influencer());
}

class Influencer extends StatelessWidget {
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
                          'Influencer',
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

            // Container(
            //   height: 530, // Set the height of the container to control the overall height
            //   child: ListView(
            //     children: [
            //       Row(
            //         children: [
            //           Expanded(
            //             child: _buildProductCards(context,'Influencer', 'Description 1', 'assets/course1' ,'@tester'),
            //           ),
            //           SizedBox(width: 8), // Add spacing between the two images
            //           Expanded(
            //             child: _buildProductCards(context ,'Influencer 2', 'Description 2', 'assets/influencer2', '@tester'),
            //           ),
            //         ],
            //       ),
            //       SizedBox(height: 8), // Add spacing between rows
            //       Row(
            //         children: [
            //
            //           // Add spacing between the two images
            //           Expanded(
            //             child: _buildProductCards(context ,'Influencer 3', 'Description 2', 'assets/influencer3' , '@tester'),
            //           ),
            //           SizedBox(width: 8),
            //           Expanded(
            //             child: _buildProductCards(context ,'Influencer 3', 'Description 3', 'assets/influencer4' , '@tester'),
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
            //             child: _buildProductCards(context ,'Influencer 5', 'Description 2', 'assets/influencer2' , '@tester'),
            //           ),
            //           SizedBox(width: 8),
            //           Expanded(
            //             child: _buildProductCards(context ,'Influencer 6', 'Description 3', 'assets/influencer5' , '@tester'),
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
            //             child: _buildProductCards(context ,'Influencer 5', 'Description 2', 'assets/influencer1' , '@tester'),
            //           ),
            //           SizedBox(width: 8),
            //           Expanded(
            //             child: _buildProductCards(context ,'Influencer 6', 'Description 3', 'assets/influencer1' , '@tester'),
            //           ),
            //           // Add more product cards as needed
            //         ],
            //       ),
            //     ],
            //   ),
            // ),


            Container(
              height: 530, // Set the height of the container to control the overall height
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildProductCards(context, '@Influencer', 'Description 1', 'assets/influencer1.jpg' ,'test1'),
                      ),
                      SizedBox(width: 8), // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'@Influencer 2', 'Description 2', 'assets/influencer2.jpg', 'test2'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'@Influencer 3', 'Description 2', 'assets/influencer3.jpg' , 'test3'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards( context ,'@Influencer 4', 'Description 3', 'assets/influencer4.jpg' , 'tets4'),
                      ),
                      // Add more product cards as needed
                    ],
                  ),

                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'@Influencer 5', 'Description 2', 'assets/influencer5.jpg' , 'test5'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards(context ,'@Influencer 6', 'Description 3', 'assets/influencer6.jpg' , 'test6'),
                      ),
                      // Add more product cards as needed
                    ],
                  ),

                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards( context ,'@Influencer 7', 'Description 2', 'assets/influencer2.jpg' , 'test7'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards( context ,'@Influencer 8', 'Description 3', 'assets/influencer1.jpg' , 'test8'),
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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Set the background color to black
        selectedItemColor: Color(0xffDA8938), // Set the selected item color to white
        unselectedItemColor:
        Colors.grey[700], // Set the unselected item color to grey
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,  size: 34,),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded ,  size: 34,),
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

Widget _buildProductCards(BuildContext context , String title, String description, String imageUrl, String rating ) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SingleInfluencer(

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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              rating,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(4.0),
          //   child: _buildRatingStars(double.parse(rating)),
          // ),


        ],
      ),
    ),
  );
}
// Widget _buildProductCards(BuildContext context ,String title, String description, String imageUrl ,String rating) {
//
//
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => SingleInfluencer(
//
//             // title: title,
//             // description: description,
//             imageUrl: imageUrl,
//             // rating: double.parse(rating),
//           ),
//         ),
//       );
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
//       margin: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         children: <Widget>[
//           Container(
//             height: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
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
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Text(
//               description,
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Text(
//               rating,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//
//           ),
//         ],
//       ),
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
    stars.add(Icon(Icons.star, color: Color(0xffE17922), size: 16));
  }
  return Row(children: stars);
}


