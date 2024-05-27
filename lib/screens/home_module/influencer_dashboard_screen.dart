
import 'package:first_project/controller/home_module_controller/influencer_dashoard_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_bottom_navigator.dart';
import 'package:first_project/screens/custom_widgets/custom_bottom_navigator_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfluencerDashboardScreen extends GetView<InfluencerDashboardScreenController>{
  const InfluencerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:(){
        controller.onDialog();
        return Future(() => false);
      },
      child: Scaffold(
        body: Obx(()=> controller.listOfScreens[controller.currentIndex.value]),
        bottomNavigationBar: Obx(()=> CircleBottomNavigator2(onTap: (index){
          controller.currentIndex.value=index;
        }, currentIndex:  controller.currentIndex.value),
        ),
      ),
    );
  }








}