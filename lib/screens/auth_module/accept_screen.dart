
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/accept_screen_controller.dart';
import '../custom_widgets/custom_primary_button.dart';

class AcceptScreen extends GetView<AcceptScreenController>{
  const AcceptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF281f57),
              Color(0xFF161D34),
              Color(0xFF161D34),
              Color(0xFF281f57),
            ],
            stops: [0.0, 0.1, 0.85, 1.0],
          ),
        ),
        child: SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height: 250),
                Container(
                  color: Colors.transparent,

                  child: Image.asset(
                    'assets/White version 1.png',
                    width: 220,
                  ),
                ),
                SizedBox(height: 80),
                Padding(
                  padding: EdgeInsets.only(right: 30,left: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Would you like to participate in research by sharing data?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,


                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(

                        onPressed: () {
                          controller.onLoginTap();
                        },
                        style: ElevatedButton.styleFrom(

                          primary: Colors.transparent, // Set button color
                          onPrimary: Colors.white, // Set font color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Color(0xff8650F6)),// Set border radius
                          ),
                          fixedSize: Size(120, 50),
                        ),
                        child: Text('No',

                          style: TextStyle(fontSize: 20),),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(

                        onPressed: () {
                          controller.onLoginTap();

                        },
                        style: ElevatedButton.styleFrom(

                          primary: Color(0xff8650F6), // Set button color
                          onPrimary: Colors.white,
                          // Set font color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Color(0xff8650F6)),// Set border radius
                          ),
                          fixedSize: Size(120, 50),

                        ),
                        child: Text('Yes',

                          style: TextStyle(fontSize: 20),),

                      ),
                    ),
                  ],
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }


}