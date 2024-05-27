import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_module_controller/bedtime_screen_controller.dart';
import '../../controller/home_module_controller/exercise_screen_controller.dart';
import '../custom_widgets/custom_primary_button.dart';

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();

}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  Color breatheInColor = Colors.transparent;
  Color holdColor = Colors.transparent;
  Color breatheOutColor = Colors.transparent;

  @override
  void initState() {

    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds:Get.find<ExerciseScreenController>().number.value),
      // Total duration of the animation
    );



    // Start animation when the screen loads
    _startAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    print('start');
    setState(() {
      breatheInColor = Color(0xff8650F6);
      holdColor = Colors.transparent;
      breatheOutColor = Colors.transparent;
    });
    // Reset the animation to its initial value
    _animationController.value = 0;

    // Start the animation
    _animationController.forward();



    // Listen for changes in the animation value
    _animationController.addListener(() {
      print('start2');
      if (_animationController.status == AnimationStatus.completed) {
        // Hold at 0.9 for 4 seconds
        setState(() {
          breatheInColor = Colors.transparent;
          holdColor = Color(0xff8650F6);
          breatheOutColor = Colors.transparent;
        });
        Future.delayed(Duration(seconds: Get.find<ExerciseScreenController>().number2.value), () {
          print('start5');
          // Reverse the animation to go back to 0.25
          _animationController.reverse();
          setState(() {
            breatheInColor = Colors.transparent;
            holdColor = Colors.transparent;
            breatheOutColor = Color(0xff8650F6);
          });
        });
      } else if (_animationController.status == AnimationStatus.dismissed) {
        print('start3');
        // Restart the animation if it reaches the beginning
        _animationController.forward();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 30),// Wrap your Column with a Container
                  height: MediaQuery.of(context).size.height * 0.9, // Adjust the height as needed
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Color(0xFF161D34),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.back();
                        },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20.0),
                                      child: Image.asset(
                                        'assets/previous.png',
                                        width: 25,
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 300,
                                      padding: const EdgeInsets.only(right: 25.0),
                                      child: Center(
                                        child: Text(
                                          'Breathing Exercise',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // Start animation when the button is tapped
                          _startAnimation();
                        },
                        child: WaterAnimation(animationController: _animationController),
                      ),
                    ),
                  ),

                      const SizedBox(height: 20),

                      Container(
                        padding: const EdgeInsets.symmetric(

                            horizontal: 20
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10), // Adjust margin for the paddings
                                padding: EdgeInsets.only(left:5, right:5, top: 15, bottom: 15), // Adjust padding for the entire content
                                decoration: BoxDecoration(
                                  color: breatheInColor,
                                  // color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                  borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                                ),
                                child: Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Breathe in',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),


                                            ],
                                          ),
                                        ),


                                        // Add other text widgets or content if needed
                                      ],
                                    ),
                                  ],
                                ),



                              ),

                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10), // Adjust margin for the paddings
                                padding: EdgeInsets.only(left:5, right:5, top: 15, bottom: 15), // Adjust padding for the entire content
                                decoration: BoxDecoration(
                                  color: holdColor,
                                  // color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                  borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                                ),
                                child: Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Hold',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),


                                            ],
                                          ),
                                        ),



                                        // Add other text widgets or content if needed
                                      ],
                                    ),
                                  ],
                                ),



                              ),

                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 0, bottom: 0, right: 10, left: 10), // Adjust margin for the paddings
                                padding: EdgeInsets.only(left:5, right:5, top: 15, bottom: 15), // Adjust padding for the entire content
                                decoration: BoxDecoration(
                                  color: breatheOutColor,
                                  // color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
                                  borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                                ),
                                child: Column(
                                  children: [

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          // padding: const EdgeInsets.only(left: 0.0, top: 0),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Breathe out',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),


                                        // Add other text widgets or content if needed
                                      ],
                                    ),
                                  ],
                                ),



                              ),

                            ),

                          ],
                        ),
                      ),

                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(

                            horizontal: 60
                        ),
                        child: CustomPrimaryButton(buttonText: 'Stop Exercise', onButtonPressed: (){
                          // controller.onRegisterTap();
                          // Get.to(() => AnimationScreen());
                          Get.back();

                        },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WaterAnimation extends StatelessWidget {
  final AnimationController animationController;

  const WaterAnimation({required this.animationController});

  @override
  Widget build(BuildContext context) {
    return Container(


      // width: 350,
      height: 500,
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.purple),
        borderRadius: BorderRadius.circular(20),
        color: Colors.black
      ),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          // Use a Tween to control the animation progress
          final animationValue = Tween(begin: 0.25, end: 1.0).animate(
            CurvedAnimation(
              parent: animationController,
              curve: Curves.linear,
            ),
          );

          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // width: 400,
              height: 500 * animationValue.value,
              decoration: BoxDecoration(
                color: Color(0xff8650F6),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
