
import 'package:first_project/controller/auth_module_controller/create_password_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class CreatePasswordScreen extends GetView<CreatePasswordScreenController> {
  const CreatePasswordScreen({super.key});

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
                    // gradient: LinearGradient(
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //     colors: [
                    //   Color(0xffb0bdca),
                    //   Color(0xff566573),
                    //   Color(0xff26303a),
                    //   Color(0xff1d2329),
                    // ])
        
                  ),
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 8,
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
                            'Create new password',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 30,left: 30,top: 10),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Your new password must be unique from those previously used.',
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
        
                              // Action to perform when the first button is pressed
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 16), // Increase the padding
                              child: Text(
                                'Reset Password',
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


        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xffF5F5FF),
              borderRadius: BorderRadius.circular(10),
              // border: Border.symmetric(),
              border: Border.all(
                color: Colors.black12,  // Set your desired border color here
                width: 2,             // Set the border width
              ),

              boxShadow: [
                BoxShadow(
                    color: Colors.white12, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xffc7cdd2),
                ),
                hintText: 'New Password',
                hintStyle: TextStyle(
                  color: Colors.black54,
                )),
          ),
        ),

        SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xffF5F5FF),
              // color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black12,  // Set your desired border color here
                width: 2,             // Set the border width
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.white12, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextField(

            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,

                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  // color: Color(0xff566573),
                  color: Color(0xffdbdfe3),
                ),
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  color: Colors.black54,
                  // color: Colors.white,
                )),
          ),
        )
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



