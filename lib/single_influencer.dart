import 'package:flutter/material.dart';
import 'welcome.dart';
import 'payment.dart';
import 'message.dart';
import 'support.dart';
import 'courses.dart';

void main() {
  runApp(SingleInfluencer(imageUrl: 'https://example.com/image.jpg' , title:'' , description:''));
}

class SingleInfluencer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;


  SingleInfluencer({required this.imageUrl , required this.title, required this.description});

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
  EcommerceHomePage({required this.imageUrl , required this.title , required this.description});

  // final String imageUrl;
  //
  // EcommerceHomePage({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 20,
            // ),





            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Container(
                      height: 250,
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
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
              color: Colors.grey[100], // Set background color to white
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

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
                    padding: EdgeInsets.only(left: 18.0, right: 18.0), // Adjust the value according to your preference
                    child: Text(
                      description,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,

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
                        fontSize: 23,
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
                        color: Colors.black54,
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
                        fontSize: 23,
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
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Hiring Influencer'),
                                 // Popup title
                                content: Container(
                                  width: MediaQuery.of(context).size.width * 0.8,
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
                                        padding: EdgeInsets.only(left: 8.0), // Adjust the value according to your preference
                                        child: Text(
                                          'Total Payments    500',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold,
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Payment(

                                                // title: title,
                                                // description: description,

                                                // rating: double.parse(rating),
                                              ),
                                            ),
                                          );
                                          // Navigator.of(context).pop(); // Close the popup
                                        },
                                        child: Text(
                                          'Payment',
                                          style: TextStyle(fontSize: 18, color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black87,
                                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 50), // Adjust button padding
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Adjust button border radius
                                        ),

                                      ),
                                    ),

                                    SizedBox(height: 20),
                                  ],
                                );
                              },
                            );
                            // Handle the first button press
                          },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffDA8938), // Change button color here
                        minimumSize: Size(150, 50), // Set button size here
                      ),
                          child: Text('Hire Me' ,
                            style: TextStyle(fontSize: 16   , color: Colors.white),),
                        ),
                        ElevatedButton(
                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatApp(

                                  // title: title,
                                  // description: description,

                                  // rating: double.parse(rating),
                                ),
                              ),
                            );
                            // Handle the second button press
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
            // Two cards in one line
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     _buildCourseCard('1876', 'Student Enrolled' ),
            //     _buildCourseCard('46 ', 'Total'),
            //   ],
            // ),
            // SizedBox(height: 20),
            //
            // Padding(
            //   padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
            //   child: Text(
            //     'Natural Language Course Overview',
            //     style: TextStyle(
            //       color: Colors.black87,
            //       fontSize: 23,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //
            //
            // ),
            //
            // SizedBox(height: 10),
            // Padding(
            //   padding: EdgeInsets.only(left: 18.0 , right: 18.0), // Adjust the value according to your preference
            //   child: Text(
            //     'This is a test description for Natural Language Course Overview',
            //     style: TextStyle(
            //       color: Colors.black54,
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            //
            //
            // ),
            //
            //
            //
            //
            //
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20 , top:20),
            //
            // ),
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


Widget _buildCourseCard(String title, String description) {

  return Container(
    width: 100,
    height: 100,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.black, width: 1),
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
            style: TextStyle(fontSize: 14, color: Colors.grey),
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


