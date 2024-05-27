import 'package:first_project/controller/auth_module_controller/analysis_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/breathing_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/exercise_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/screens/home_module/animation_screen.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseScreen extends GetView<ExerciseScreenController> {
  const ExerciseScreen({Key? key}) : super(key: key);
// class ExerciseScreen extends StatelessWidget {
//   final ExerciseScreenController controller = Get.put(ExerciseScreenController());
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30),// Wrap your Column with a Container
                    height: MediaQuery.of(context).size.height * 1.0, // Adjust the height as needed
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
                                            'Breathing exercise',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
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
                        Expanded(
                          flex: 6,
                          child: Container(
                            padding: EdgeInsets.only(left: 30, right: 30),

                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                                    ),

                                    // color: Colors.black,
                                  ),
                                ),


                                Obx(() {
                                  return Expanded(
                                    flex: controller.secondFlex.value,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      ),
                                      child: AnimatedContainer(
                                        duration: Duration(seconds: 8),
                                        curve: Curves.easeInOut,
                                        color: Color(0xff8650F6),
                                      ),
                                    ),
                                  );
                                }),

                              ],
                            ),
                          ),
                        ),


                        const SizedBox(height: 20),
                        Center(
                          child:Obx(()=>
                             Text(
                              'Taking breath for ${controller.number.value} second by noose',

                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
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
                                    color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
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
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
              
                                                // Text(
                                                //   'Went to bed',
                                                //   style: TextStyle(
                                                //     fontSize: 12,
                                                //
                                                //     color: Colors.white,
                                                //   ),
                                                // ),
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
                                    color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
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
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
              
                                                // Text(
                                                //   'Went to bed',
                                                //   style: TextStyle(
                                                //     fontSize: 12,
                                                //
                                                //     color: Colors.white,
                                                //   ),
                                                // ),
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
                                    color: Color(0xffD8D8D8).withOpacity(0.2), // Set your desired box color
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
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),
              
                                                // Text(
                                                //   'Went to bed',
                                                //   style: TextStyle(
                                                //     fontSize: 12,
                                                //
                                                //     color: Colors.white,
                                                //   ),
                                                // ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(

                              horizontal: 30
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Change breathing intervals',
                                style: TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(

                              horizontal: 20
                          ),

                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.arrow_left, size: 36),
                                        onPressed: controller.decrement,
                                      ),
                                      SizedBox(
                                        width: 20,
                                        child: Obx(() => Text(
                                          '${controller.number.value}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 24, color: Colors.white),
                                        )),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.arrow_right, color: Colors.white, size: 32),
                                        onPressed: controller.increment,
                                      ),
                                    ],
                                  ),
                                  Container(

                                    child: Text(
                                      'Breath in time',
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.arrow_left, size: 36),
                                        onPressed: controller.decrement2,
                                      ),
                                      SizedBox(
                                        width: 20,
                                        child: Obx(() => Text(
                                          '${controller.number2.value}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 24, color: Colors.white),
                                        )),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.arrow_right, color: Colors.white, size: 32),
                                        onPressed: controller.increment2,
                                      ),
                                    ],
                                  ),
                                  Container(

                                    child: Text(
                                      'Holding time',
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.arrow_left, size: 36),
                                        onPressed: controller.decrement3,
                                      ),
                                      SizedBox(
                                        width: 20,
                                        child: Obx(() => Text(
                                          '${controller.number3.value}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 24, color: Colors.white),
                                        )),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.arrow_right, color: Colors.white, size: 32),
                                        onPressed: controller.increment3,
                                      ),
                                    ],
                                  ),
                                  Container(

                                    child: Text(
                                      'Release time',
                                      style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),




                            ],


                          ),

                        ),

                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Obx(() {
                            return Visibility(
                              visible: controller.showStartButton.value,
                              child: CustomPrimaryButton(
                                buttonText: 'Start Exercise',
                                onButtonPressed: () {
                                  // controller.startAnimation();
                                  Get.to(() => AnimationScreen());
                                },
                                buttonColor: Color(0xff8650F6),
                                textColor: Colors.white,
                              ),
                            );
                          }),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Obx(() {
                            return Visibility(
                              visible: !controller.showStartButton.value,
                              child: CustomPrimaryButton(
                                buttonText: 'Stop Exercise',
                                onButtonPressed: () {
                                  controller.onClose();
                                },
                                buttonColor: Color(0xff8650F6),
                                textColor: Colors.white,
                              ),
                            );
                          }),
                        ),


                        // const SizedBox(height: 20),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //
                        //       horizontal: 60
                        //   ),
                        //   child: CustomPrimaryButton(buttonText: 'Start Exercise', onButtonPressed: (){
                        //     controller.startAnimation();
                        //     // controller.onRegisterTap();
                        //   },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
                        // ),
                        //
                        //
                        // const SizedBox(height: 20),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //
                        //       horizontal: 60
                        //   ),
                        //   child: CustomPrimaryButton(buttonText: 'Stop Exercise', onButtonPressed: (){
                        //     controller.onClose();
                        //     // controller.onRegisterTap();
                        //   },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
                        // ),

                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(
                                  'assets/Vector.png',
                                  width: 25,

                                ),
                              ),
                            ),
                            Container(
                              width: 320,


                              padding: const EdgeInsets.only(left: 10),
                              child: Center(
                                child: Text(
                                  'This technique is useful for promoting relaxation and better sleep. Start by exhaling completely through your mouth.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

              
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// class WaterAnimation extends GetView<ExerciseScreenController> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() =>
//         Container(
//           width: 200,
//           height: 100,
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.blue),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: AnimatedBuilder(
//             animation: controller.animationController,
//             builder: (context, child) {
//               return Align(
//                 alignment: Alignment.centerLeft,
//                 child: Container(
//                   width: 200 * controller.animationController.value,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ));
//   }
// }


class AnimatedFillUpContainer extends StatefulWidget {
  final Duration duration;
  final Curve curve;
  final Color color;
  final Widget child;

  AnimatedFillUpContainer({
    required this.duration,
    required this.curve,
    required this.color,
    required this.child,
  });

  @override
  _AnimatedFillUpContainerState createState() => _AnimatedFillUpContainerState();
}

class _AnimatedFillUpContainerState extends State<AnimatedFillUpContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return FractionallySizedBox(
          widthFactor: _animation.value,
          child: Container(
            color: widget.color,
            child: widget.child,
          ),
        );
      },
    );
  }
}

// class AnimationScreen extends StatefulWidget {
//   @override
//   _AnimationScreenState createState() => _AnimationScreenState();
// }
//
// class _AnimationScreenState extends State<AnimationScreen>
//     with TickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 4), // Total duration of the animation
//     );
//
//     // Start animation when the screen loads
//     // _startAnimation();
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   // void _startAnimation() {
//   //   print('start');
//   //   // Reset the animation to its initial value
//   //   _animationController.value = 0;
//   //
//   //   // Start the animation
//   //   _animationController.forward();
//   //
//   //   // Listen for changes in the animation value
//   //   _animationController.addListener(() {
//   //     if (_animationController.status == AnimationStatus.completed) {
//   //       // Hold at 0.9 for 4 seconds
//   //       Future.delayed(Duration(seconds: 4), () {
//   //         // Reverse the animation to go back to 0.25
//   //         _animationController.reverse();
//   //       });
//   //     } else if (_animationController.status == AnimationStatus.dismissed) {
//   //       // Restart the animation if it reaches the beginning
//   //       _animationController.forward();
//   //     }
//   //   });
//   // }
//
//
//   void _startAnimation() {
//     print('start');
//     // Reset the animation to its initial value
//     _animationController.value = 0;
//
//     // Start the animation
//     _animationController.forward();
//
//     _animationController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         // Hold at 0.9 for 4 seconds
//         Future.delayed(Duration(seconds: 4), () {
//           // Reverse the animation to go back to 0.25
//           _animationController.reverse();
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Animation Screen'),
//       ),
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             // Start animation when the button is tapped
//             _startAnimation();
//           },
//           child: WaterAnimation(animationController: _animationController),
//         ),
//       ),
//     );
//   }
// }
//
// class WaterAnimation extends StatelessWidget {
//   final AnimationController animationController;
//
//   const WaterAnimation({required this.animationController});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       height: 400,
//       decoration: BoxDecoration(
//           border: Border.all(color: Colors.purple),
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.black
//       ),
//       child: AnimatedBuilder(
//         animation: animationController,
//         builder: (context, child) {
//           // Use a Tween to control the animation progress
//           final animationValue = Tween(begin: 0.25, end: 0.75).animate(
//             CurvedAnimation(
//               parent: animationController,
//               curve: Curves.linear,
//             ),
//           );
//
//           return Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: 200,
//               height: 400 * animationValue.value,
//               decoration: BoxDecoration(
//                 color: Colors.purple,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
void main() {
  runApp(MaterialApp(
    home: ExerciseScreen(),
  ));
}
