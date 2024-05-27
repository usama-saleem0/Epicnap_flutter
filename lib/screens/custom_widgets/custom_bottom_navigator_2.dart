// import 'package:first_project/utils/app_colors.dart';
// import 'package:flutter/material.dart';
//
//
// class BottomNavigator extends StatelessWidget {
//   final Function(int) onTap;
//   final int currentIndex;
//   const BottomNavigator({super.key , required this.onTap , required this.currentIndex});
//
//   @override
//
//
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: CustomAppColor.kWhiteColor,
//       selectedItemColor: CustomAppColor.kOrange,
//       unselectedItemColor: Colors.grey[700],
//       currentIndex: currentIndex,
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             'assets/home.png',
//             width: 30,
//             height: 30,
//           ),
//           activeIcon: Image.asset(
//             'assets/active_home.png', // Replace with selected state icon path
//             width: 30,
//             height: 30,
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             'assets/book.png',
//             width: 34,
//             height: 34,
//           ),
//           activeIcon: Image.asset(
//             'assets/active_book.png', // Replace with selected state icon path
//             width: 34,
//             height: 34,
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             'assets/chat.png',
//             width: 34,
//             height: 34,
//           ),
//           activeIcon: Image.asset(
//             'assets/active_chat.png', // Replace with selected state icon path
//             width: 34,
//             height: 34,
//           ),
//           label: '',
//         ),
//         BottomNavigationBarItem(
//           icon: Image.asset(
//             'assets/person.png',
//             width: 30,
//             height: 30,
//           ),
//           activeIcon: Image.asset(
//             'assets/active_person.png', // Replace with selected state icon path
//             width: 30,
//             height: 30,
//           ),
//           label: '',
//         ),
//       ],
//       onTap: onTap,
//       selectedIconTheme: IconThemeData(size: 40), // Adjust size as needed
//     );
//   }
//
//
// }
//
//
//
//
//

import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:first_project/screens/home_module/maindashboard_screen.dart';
import 'package:flutter/material.dart';

import '../home_module/antisleep.dart';
import '../home_module/history_screen.dart';

class CircleBottomNavigator2 extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CircleBottomNavigator2({Key? key, required this.onTap, required this.currentIndex,});

  @override
  Widget build(BuildContext context) {
    return
      Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff161D34),
            // spreadRadius: 1,
            // blurRadius: 1,
            // offset: Offset(0, 1),
          ),
        ],
      ),
      child: CircleNavBar(
        activeIcons: [
          Image.asset(
            'assets/logos.png',
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/play.png',
            width: 34,
            height: 34,
          ),
          Image.asset(
            'assets/pause.png',
            width: 34,
            height: 34,
          ),
          Image.asset(
            'assets/logos.png',
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/logos.png',
            width: 30,
            height: 30,
          ),
        ],
        inactiveIcons: [
          Image.asset(
            'assets/item1.png',
            width: 50,
            height: 50,
          ),
          Image.asset(
            'assets/item2.png',
            width: 50,
            height: 50,
          ),
          Image.asset(
            'assets/item3.png',
            width: 50,
            height: 50,
          ),
          Image.asset(
            'assets/item4.png',
            width: 50,
            height: 50,
          ),
          Image.asset(
            'assets/item4.png',
            width: 50,
            height: 50,
          ),



        ],
        color: Colors.grey,
        circleColor: Color(0xffFFFFFF).withOpacity(0.1),
        height: 70,
        circleWidth: 70,
        padding: const EdgeInsets.only(left: 6, right: 6, bottom: 0),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.black38.withOpacity(0.2),
        circleShadowColor: Color(0xffFFFFFF).withOpacity(0.2),
        elevation: 10,
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffFFFFFF).withOpacity(0.2), Color(0xffFFFFFF).withOpacity(0.2)],
        ),
        circleGradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xffFFFFFF).withOpacity(0.2), Color(0xffFFFFFF).withOpacity(0.2)],
        ),
        activeIndex: 2,
        onTap: onTap,
      ),
    );


    //   Container(
    //
    // decoration: BoxDecoration(
    // boxShadow: [
    // BoxShadow(
    // color: Colors.grey.withOpacity(0.2),
    // spreadRadius: 1,
    // blurRadius: 1,
    // offset: Offset(0, 1),
    // ),
    // ],
    // ),
    // child: CircleNavBar(
    // activeIcons:  [
    // Icon(Icons.person, color: Colors.deepPurple),
    // Image.asset('assets/item1.png', width: 28, height: 28),
    // Icon(Icons.favorite, color: Colors.deepPurple),
    // ],
    // inactiveIcons: [
    // Image.asset('assets/item2.png', width: 26, height: 26),
    // Image.asset('assets/item3.png', width: 24, height: 24),
    // Image.asset('assets/item4.png', width: 26, height: 26),
    // ],
    // color: Colors.white,
    // circleColor: Colors.white,
    // height: 70,
    // circleWidth: 70,
    //
    //
    // // tabCurve: ,
    // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
    // cornerRadius: const BorderRadius.only(
    // topLeft: Radius.circular(8),
    // topRight: Radius.circular(8),
    // bottomRight: Radius.circular(24),
    // bottomLeft: Radius.circular(24),
    // ),
    // shadowColor: Color(0xffF5F5FF),
    // circleShadowColor: Color(0xffF5F5FF),
    // elevation: 10,
    // gradient: LinearGradient(
    // begin: Alignment.topRight,
    // end: Alignment.bottomLeft,
    // colors: [ Color(0xffFFFFFF), Color(0xffFFFFFF) ],
    // ),
    // circleGradient: LinearGradient(
    // begin: Alignment.topRight,
    // end: Alignment.bottomLeft,
    // colors: [ Color(0xff12AFC2), Color(0xff12AFC2) ],
    // ),
    //
    //   activeIndex: currentIndex,
    //       onTap: onTap,
    //
    // ),
    // );
  }
}

