import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundScreenController  extends GetxController{
  TextEditingController nameController = TextEditingController();

  RxList<bool> isLiked = List.generate(5, (_) => false).obs; // Initialize with false for each item

  // void toggleLike(int index) {
  //   isLiked[index] = !isLiked[index]; // Toggle the like state
  // }


  @override
  void onInit() {
    super.onInit();
    _loadLikedSongs(); // Load liked songs when the controller is initialized
  }

  void toggleLike(int index) {
    isLiked[index] = !isLiked[index];
    _saveLikedSongs(); // Save the updated liked songs
  }

  Future<void> _loadLikedSongs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> likedSongs = prefs.getStringList('likedSongs') ?? [];
    for (int i = 0; i < isLiked.length; i++) {
      isLiked[i] = likedSongs.contains(i.toString());
    }
  }

  Future<void> _saveLikedSongs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> likedSongs = [];
    for (int i = 0; i < isLiked.length; i++) {
      if (isLiked[i]) {
        likedSongs.add(i.toString());
      }
    }
    prefs.setStringList('likedSongs', likedSongs);
  }

  void onAlarmTap(){
    Get.toNamed(AppConstant.kSetAlarmScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

}