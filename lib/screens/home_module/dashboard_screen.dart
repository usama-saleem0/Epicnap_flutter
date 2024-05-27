//
// import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
// import 'package:first_project/screens/custom_widgets/custom_bottom_navigator.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DashboardScreen extends GetView<DashboardScreenController>{
//   const DashboardScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop:(){
//         controller.onDialog();
//         return Future(() => false);
//       },
//       child: Scaffold(
//         body: Obx(()=> controller.listOfScreens[controller.currentIndex.value]),
//         bottomNavigationBar: Obx(()=> CircleBottomNavigator(onTap: (index){
//             controller.currentIndex.value=index;
//           }, currentIndex:  controller.currentIndex.value),
//         ),
//       ),
//     );
//   }
//
//
//
//
//
//
//
//
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_module_controller/dashboard_screen_controller.dart';
import '../../screens/custom_widgets/custom_bottom_navigator.dart';

class DashboardScreen extends GetView<DashboardScreenController> {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.onDialog();
        return Future(() => false);
      },
      child: Scaffold(
        body: Obx(() => controller.listOfScreens[controller.currentIndex.value]),
        // bottomNavigationBar: Obx(() => CircleBottomNavigator(
        //   onTap: (index) {
        //     controller.currentIndex.value = index;
        //   },
        //   currentIndex: controller.currentIndex.value,
        //   activeIcons: [
        //     Image.asset(
        //       'assets/logos.png',
        //       width: 30,
        //       height: 30,
        //     ),
        //     Image.asset(
        //       'assets/play.png',
        //       width: 34,
        //       height: 34,
        //     ),
        //     Image.asset(
        //       'assets/pause.png',
        //       width: 34,
        //       height: 34,
        //     ),
        //     Image.asset(
        //       'assets/logos.png',
        //       width: 30,
        //       height: 30,
        //     ),
        //     Image.asset(
        //       'assets/logos.png',
        //       width: 30,
        //       height: 30,
        //     ),
        //
        //     // Add the new active icon here
        //   ],
        //   inactiveIcons: [
        //     Image.asset(
        //       'assets/item1.png',
        //       width: 50,
        //       height: 50,
        //     ),
        //     Image.asset(
        //       'assets/item2.png',
        //       width: 50,
        //       height: 50,
        //     ),
        //     Image.asset(
        //       'assets/item3.png',
        //       width: 50,
        //       height: 50,
        //     ),
        //     Image.asset(
        //       'assets/item4.png',
        //       width: 50,
        //       height: 50,
        //     ),
        //     Image.asset(
        //       'assets/item4.png',
        //       width: 50,
        //       height: 50,
        //     ),
        //     // Add the new inactive icon here
        //   ],
        // )),
      ),
    );
  }
}
