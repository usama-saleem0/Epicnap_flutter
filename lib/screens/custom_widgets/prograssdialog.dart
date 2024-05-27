import 'package:first_project/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class ProgressDialog {

  static final ProgressDialog _instance = ProgressDialog._internal();
  ProgressDialog._internal();
  factory ProgressDialog() => _instance;

  bool _isShowing = false;

  void showDialog({String? title,Color loaderColor=CustomAppColor.kOrange}){
    if(_isShowing)return;

    _isShowing = true;
    Get.dialog(
      WillPopScope(
        onWillPop: (){
          return Future.value(false);
        },
        child: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(left: 12, right: 12),
          child: Center(child:  CircularProgressIndicator(color: loaderColor,)),
        ),
      ),
      barrierDismissible: true,

    );
  }

  void dismissDialog() {
    if (_isShowing) {
      _isShowing = false;
      Get.back();
    }
  }
}