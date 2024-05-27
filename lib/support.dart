import 'package:flutter/material.dart';
import 'welcome.dart';
import 'courses.dart';
import 'supportmessage.dart';

void main() {
  runApp(Support());
}

class Support extends StatelessWidget {

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
                'Support',
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
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 40), // Add horizontal padding for space on both ends
                  decoration: BoxDecoration(
                    image: DecorationImage(

                      image: AssetImage('assets/Group.png'),
                      // image: NetworkImage(
                      //   'https://graphicsfamily.com/wp-content/uploads/edd/2022/01/Online-Education-Landing-Page-Design-Orage-Version-870x490.jpg', // Replace with your image URL
                      // ),
                      // fit: BoxFit.cover,
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



                  Center(
                  // Adjust the value according to your preference
                    child: Text(
                      'Hello, How can We help? You',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),



                  // SizedBox(height: 50), // Add spacing between the image and the card row
                  //
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Contact live Chat',
                  //
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Colors.black87, width: 1), // Set the border width
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'Send us Email',
                  //
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Colors.black87, width: 1), // Set the border width
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     labelText: 'FAQ',
                  //
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(8.0),
                  //       borderSide: BorderSide(color: Colors.black87, width: 1), // Set the border width
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 50),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SupportChat(

                            // title: title,
                            // description: description,

                            // rating: double.parse(rating),
                          ),
                        ),
                      );

                      // Add your button click functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[100],
                      onPrimary: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black87,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align children at the start of the row
                        children: [
                          Icon(
                            Icons.headphones, // Add your desired icon
                            color: Colors.black87,
                          ),
                          SizedBox(width: 8), // Add a small spacing between the icon and text
                          Text(
                            'Contact live chat',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  // ElevatedButton(
                  //   onPressed:() {
                  //
                  //   },
                  //   child: Container(
                  //     width: double.infinity,
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: 18), // Increase the padding
                  //     child: Text(
                  //       'Contact live chat',
                  //       textAlign: TextAlign.start,
                  //       style: TextStyle(
                  //         fontSize: 16, // Increase the font size
                  //
                  //       ),
                  //     ),
                  //   ),
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Colors.grey[100],
                  //     onPrimary: Colors.black87,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(5.0),
                  //     ),
                  //     elevation:
                  //     5, // Add the elevation property to set the shadow
                  //     shadowColor: Colors.black87,
                  //   ),
                  // ),

                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button click functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[100],
                      onPrimary: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black87,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align children at the start of the row
                        children: [
                          Icon(
                            Icons.email, // Add your desired icon
                            color: Colors.black87,
                          ),
                          SizedBox(width: 8), // Add a small spacing between the icon and text
                          Text(
                            'Send us an Email',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Add your button click functionality here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[100],
                      onPrimary: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      elevation: 5,
                      shadowColor: Colors.black87,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start, // Align children at the start of the row
                        children: [
                          Icon(
                            Icons.info, // Add your desired icon
                            color: Colors.black87,
                          ),
                          SizedBox(width: 8), // Add a small spacing between the icon and text
                          Text(
                            'FAQ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  SizedBox(height: 40),



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


