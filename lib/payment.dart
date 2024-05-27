import 'package:flutter/material.dart';
import 'welcome.dart';

void main() {
  runApp(Payment());
}

class Payment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'abiola.co',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      // home: EcommerceHomePage(imageUrl: 'https://example.com/image.jpg'),
      home: EcommerceHomePage(),
    );
  }
}

class EcommerceHomePage extends StatelessWidget {

  //
  EcommerceHomePage();

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
            SizedBox(
              height: 50,
            ),



            Padding(
              padding: EdgeInsets.only(left: 120.0), // Adjust the value according to your preference
              child: Text(
                'Add Card',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // SizedBox(
            //   height: 50,
            // ),

            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Set the border radius for rounded corners
                child: Container(
                  width: 500,
                  height: 250,
                  padding: EdgeInsets.symmetric(horizontal: 40), // Add horizontal padding for space on both ends
                  decoration: BoxDecoration(
                    image: DecorationImage(

                      image: AssetImage('assets/card.png'),
                      // image: NetworkImage(
                      //   'https://graphicsfamily.com/wp-content/uploads/edd/2022/01/Online-Education-Landing-Page-Design-Orage-Version-870x490.jpg', // Replace with your image URL
                      // ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),







            // Center(
            //   child: Stack(
            //     children: [
            //       ClipRRect(
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(20),
            //           bottomRight: Radius.circular(20),
            //         ),
            //         // borderRadius: BorderRadius.circular(20),
            //
            //         child: Container(
            //           // width: MediaQuery.of(context).size.width * 0.9,
            //           height: 250,
            //           padding: EdgeInsets.symmetric(horizontal: 40),
            //           decoration: BoxDecoration(
            //             image: DecorationImage(
            //               image: NetworkImage(imageUrl), // Use the imageUrl passed from SingleCourse
            //               fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //       ),
            //
            //
            //
            //
            //
            //     ],
            //   ),
            // ),









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



                  Padding(
                    padding: EdgeInsets.only(left: 18.0), // Adjust the value according to your preference
                    child: Text(
                      'Card Details',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),



                  SizedBox(height: 50), // Add spacing between the image and the card row

                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Card number',

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name',

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Expire date',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'CVC',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(color: Colors.black54, width: 1), // Set the border width
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed:() {

                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 16), // Increase the padding
                      child: Text(
                        'Paynow',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20, // Increase the font size
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black87,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation:
                      5, // Add the elevation property to set the shadow
                      shadowColor: Colors.black38,
                    ),
                  ),


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


