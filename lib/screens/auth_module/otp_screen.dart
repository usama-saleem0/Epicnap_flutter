
import 'package:first_project/controller/auth_module_controller/otp_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class OtpScreen extends GetView<OtpScreenController> {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: <Widget>[
        
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffF5F5FF)
        
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      // vertical: 120,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 20 , top:0),
                          //   child: Text(
                          //     'abiola.co',
                          //     style: TextStyle(
                          //       color: Color(0xffDA8938),
                          //       fontSize: 48,
                          //       fontWeight: FontWeight.bold,
                          //
                          //     ),
                          //   ),
                          // ),
        
                          SizedBox(height: 30,),
                          Image.asset(
                            'assets/abiola.png', // Replace with the path to your back icon image
                            // Adjust the height according to your design
                          ),
                          SizedBox(height: 30,),
                          Text(
                            'OTP Verification',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Enter the verification code we just sent on your email address.',
                              style: TextStyle(
                                color: Color(0xff8391A1),
                                fontSize: 16,
        
        
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          buildEmail(),
                          SizedBox(
                            height: 10,
                          ),
                          buildPassword(),
                          SizedBox(
                              height: 10), // Add spacing between the buttons
        
                          SizedBox(height: 30),
        
                          ElevatedButton(
                            onPressed: () {
                              controller.onVerifyTap();
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       // Replace the following line with your desired new page widget.
                              //       return Createpassword(); // Create and return the new page widget.
                              //     },
                              //   ),
                              // );
                              // Action to perform when the first button is pressed
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 16), // Increase the padding
                              child: Text(
                                'Verify',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20, // Increase the font size
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation:
                              5, // Add the elevation property to set the shadow
                              shadowColor: Colors.black38,
                            ),
                          ),
                          // SizedBox(
                          //     height: 30),
                          // Text(
                          //   'Or Continue with',
                          //   style: TextStyle(
                          //     color: Colors.black54,
                          //     fontSize: 14,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
        
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30 , top:10),
        
                          ),
        
        
        
        
        
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 230),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Didnt recieve code?',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Resend',
                                    style: TextStyle(
                                      color: Color(0xffFFBA59), // Set brown color for 'guest'
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          // TextButton(
                          //   onPressed: () {
                          //     // Add your "Forgot Password?" action here.
                          //     print("Sign Up");
                          //   },
                          //   child: Text(
                          //     "Don't have an Account? Register now",
                          //     style: TextStyle(
                          //       color: Colors.black87,
                          //       fontSize: 16,
                          //     ),
                          //   ),
                          // ),
                        ]),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        // SizedBox(
        //   height: 10,
        // ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4, // Change this number to the number of OTP digits you want
                (index) => SizedBox(
              width: 70, // Adjust the width of each box as per your design
              height: 70, // Adjust the height of each box as per your design
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xffF5F5FF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black12, // Set the border color of the box
                    width: 2, // Set the border width of the box
                  ),
                ),
                child: Text(
                  '', // You can set your OTP digits here if needed
                  style: TextStyle(
                    fontSize: 20, // Set the font size of the OTP digit
                  ),
                ),
              ),
            ),
          ),
        )

        // Container(
        //   alignment: Alignment.centerLeft,
        //   decoration: BoxDecoration(
        //       color: Colors.grey[200],
        //       borderRadius: BorderRadius.circular(10),
        //       border: Border.symmetric(),
        //       boxShadow: [
        //         BoxShadow(
        //             color: Colors.white12, blurRadius: 6, offset: Offset(0, 2))
        //       ]),
        //   height: 60,
        //   child: TextField(
        //     keyboardType: TextInputType.emailAddress,
        //     style: TextStyle(
        //       color: Colors.black87,
        //     ),
        //     decoration: InputDecoration(
        //         border: InputBorder.none,
        //         contentPadding: EdgeInsets.only(top: 14),
        //         prefixIcon: Icon(
        //           Icons.email,
        //           color: Color(0xffc7cdd2),
        //         ),
        //         hintText: 'Enter your email',
        //         hintStyle: TextStyle(
        //           color: Colors.black54,
        //         )),
        //   ),
        // )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.white12, blurRadius: 6, offset: Offset(0, 2))
              ]),

        )
      ],
    );
  }
}



