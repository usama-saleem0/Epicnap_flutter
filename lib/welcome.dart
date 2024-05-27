import 'package:flutter/material.dart';
import 'influencers.dart';
import 'courses.dart';
import 'single_course.dart';
import 'single_influencer.dart';
import 'support.dart';


class HomeScreen extends StatelessWidget {
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


            SizedBox(
              height: 30,
            ),


            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Set the border radius for rounded corners
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 40), // Add horizontal padding for space on both ends
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/banner.png'),
                      // image: NetworkImage(
                      //   'https://graphicsfamily.com/wp-content/uploads/edd/2022/01/Online-Education-Landing-Page-Design-Orage-Version-870x490.jpg', // Replace with your image URL
                      // ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
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
                          'Influncers',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff403D3A),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(width: 8, height: 50,),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Influencer(), // Replace NewPage() with the widget of the new page you want to navigate to
                        ),
                      );
                    },
                    child: Text(
                      'view all',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffDA8938),
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
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildProductCard(context ,'@Influencer 1', 'Description 1', 'assets/influencer1.jpg'),
                  _buildProductCard(context ,'@Influencer 2', 'Description 2', 'assets/influencer2.jpg'),
                  _buildProductCard(context ,'@Influencer 3', 'Description 3', 'assets/influencer5.jpg'),

                  // Add more product cards as needed
                ],
              ),
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
                  SizedBox(width: 8, height: 50,), // Add some space between text and image
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Courses(), // Replace NewPage() with the widget of the new page you want to navigate to
                        ),
                      );
                    },
                    child: Text(
                      'view all',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffDA8938),
                      ),
                    ),
                  )


                ],
              ),


            ),


            Container(
              height: 330, // Set the height of the container to control the overall height
              child: ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: _buildProductCards(context ,'@Courses', 'Description 1', 'assets/course1.jpg' ,'4'),
                      ),
                      SizedBox(width: 8), // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'@Courses 2', 'Description 2', 'assets/course2.jpg', '4'),
                      ),
                    ],
                  ),
                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'@Courses 3', 'Description 2', 'assets/course3.jpg' , '5'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards(context ,'@Courses 3', 'Description 3', 'assets/course4.jpg' , '3'),
                      ),
                      // Add more product cards as needed
                    ],
                  ),

                  SizedBox(height: 8), // Add spacing between rows
                  Row(
                    children: [

                      // Add spacing between the two images
                      Expanded(
                        child: _buildProductCards(context ,'@Courses 3', 'Description 2', 'assets/course2.jpg' , '5'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildProductCards(context ,'@Courses 3', 'Description 3', 'assets/course1.jpg' , '3'),
                      ),
                      // Add more product cards as needed
                    ],
                  ),
                ],
              ),
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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white, // Set the background color to black
        selectedItemColor: Color(0xffDA8938), // Set the selected item color to white
        unselectedItemColor:
        Colors.grey[700], // Set the unselected item color to grey
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home ,  size: 34),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_rounded ,  size: 34),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.message ,  size: 34),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person ,  size: 34),
            label: '',
          ),
        ],
          onTap: (int index) {
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

Widget _buildProductCard(BuildContext context , String title, String description, String imageUrl) {
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
    child: Container(
      width: 190,
      margin: EdgeInsets.all(8),
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
              _buildSmallCard(' Facebook', Icons.facebook),
              SizedBox(width: 8),
              _buildSmallCard(' Youtube', Icons.youtube_searched_for),
            ],
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}


Widget _buildSmallCard(String text , IconData iconData) {
  return Padding(
    padding: EdgeInsets.only(left: 15), // Add left padding to the entire small card
    child: Container(
      height: 20,

      decoration: BoxDecoration(
        color: Colors.grey[200], // Set your desired color
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.black54),

      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 12, // Set your desired icon size
            color: Colors.black87, // Set your desired icon color
          ),
          SizedBox(width: 4), // Add some spacing between the icon and text
          Text(
            text,
            style: TextStyle(
              fontSize: 12, // Set your desired font size
              color: Colors.black54, // Set your desired text color
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


