

import 'package:first_project/controller/home_module_controller/payment_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';






class PaymentScreen extends GetView<PaymentScreenController>{
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[50],
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

          ],

        ),

      ),


    );
  }

}






