import 'package:first_project/screens/custom_widgets/prograssdialog.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/web_services/user_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class RegisterScreenController  extends GetxController{

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController countryController = TextEditingController();


  UserServices userServices = UserServices();
  RxBool isUser = true.obs;

  ProgressDialog progressDialog = ProgressDialog();

//   Future<void> register() async{
//    progressDialog.showDialog();
// String res=await userServices.registerUser(email: emailController.text, password: passwordController.text, name: usernameController.text, confirm: confirmpasswordController.text, country: countryController.text , user:isUser.value ?'user':'influencer');
//  if(res=="Registration successful"){
//    progressDialog.dismissDialog();
//    if(Get.previousRoute==AppConstant.kLoginScreen){
//      Get.back();
//    }else{
//
//      Get.offNamed(AppConstant.kLoginScreen);
//    }
//
//  }
//  else{
//    progressDialog.dismissDialog();
//  }
//   }

}