import 'dart:io';

import 'package:first_project/controller/home_module_controller/dashboard_screen_controller.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:core';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
class SettingsScreenController  extends GetxController{
  TextEditingController nameController = TextEditingController();
  final Uri _url = Uri.parse('https://epicnap.com/contact-2/');
  final Uri _urlss = Uri.parse('mailto:info@epicnap.com');

  void onLoginTap(){
    Get.toNamed(AppConstant.kAcceptScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kAlarmScreen);
  }

  void onLogoutTap(){
    Get.toNamed(AppConstant.kWelcomeScreen);
  }


  void openWebPage(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    // }
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
    else {
      throw 'Could not launch $url';
    }
  }

  void sendEmail() async {
    if (!await launchUrl(_urlss)) {
      throw Exception('Could not launch $_urlss');
    }
    else {
      throw 'Could not launch $_urlss';
    }
}


  void sendEmails(String emailAddress) async {
    final Email email = Email(
      body: '',
      subject: '',
      recipients: [emailAddress],
    );

    await FlutterEmailSender.send(email);
  }



  // Future<void> launchUrl(url) async {
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }

  void onPrivacyTap(){
    Get.toNamed(AppConstant.kPrivacyScreen);
  }


  void onNotificationTap(){
    Get.toNamed(AppConstant.kNotificationScreen);
  }
}