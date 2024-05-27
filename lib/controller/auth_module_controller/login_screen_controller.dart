import 'package:first_project/model/influncer_model.dart';
import 'package:first_project/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:first_project/web_services/user_services.dart';

import '../../screens/custom_widgets/prograssdialog.dart';
import '../../utils/app_constant.dart';

class LoginScreenController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String validEmail = "nazar@mimsoft.pk";
  final String validPassword = "Explore999";
  UserServices userServices = UserServices();


  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }
  // Future<void> login() async{
  //   progressDialog.showDialog();
  //   UserModel userModel=await userServices.loginUser(email: emailController.text, password: passwordController.text);
  //   print(userModel.toString());
  //   if(userModel.type=="influencer"){
  //     progressDialog.dismissDialog();
  //
  //     Get.offNamed(AppConstant.kInfluencerDashboardScreen,arguments: userModel);
  //
  //   }
  //   else if(userModel.type =="user"){
  //     progressDialog.dismissDialog();
  //     Get.offNamed(AppConstant.kDashboardScreen,arguments: userModel);
  //   }
  //   else{
  //     progressDialog.dismissDialog();
  //   }
  // }
  void onForgotTap(){
    Get.toNamed(AppConstant.kForgetScreen);
  }

  ProgressDialog progressDialog = ProgressDialog();


  @override
  void onInit() {
    emailController.text = 'user111@gmail.com';
    passwordController.text = 'Explore999';
    super.onInit();
  }

}