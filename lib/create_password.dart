import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class Createpassword extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[


      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            border: Border.symmetric(),
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
            color: Colors.grey[200],
            // color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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

class _LoginScreenState extends State<Createpassword> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final String validEmail = "nazar@mimsoft.pk";
  final String validPassword = "Explore999";

  bool _showImage = false;
  bool _visible = true;

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;


  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: <Widget>[
              if (_showImage)
                Container(
                  color: Colors.black, // Set the background color for the image
                  child: Center(

                  ),
                ),
              if (_visible)
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
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
                      vertical: 120,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20 , top:0),
                            child: Text(
                              'abiola.co',
                              style: TextStyle(
                                color: Color(0xffDA8938),
                                fontSize: 48,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                          Text(
                            'Create new password',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'your new password must be unique from those prevoius use',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,

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
}
