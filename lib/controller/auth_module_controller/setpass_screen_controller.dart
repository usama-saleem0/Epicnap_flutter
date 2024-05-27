import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';
import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';

class SetPassScreenController  extends GetxController{
  TextEditingController passwordController = TextEditingController();

  UserServices userServices = UserServices();
  ProgressDialog progressDialog = ProgressDialog();
  void onLoginTap() async{

    // Get.toNamed(AppConstant.kNewLoginScreen);
  }

  void onRegisterTap(){
    Get.toNamed(AppConstant.kRegisterScreen);
  }

  Future<void> register() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString('name') ?? '';
    String age = prefs.getString('age') ?? '';
    String email = prefs.getString('email') ?? '';
    String gender = prefs.getString('selectedGender') ?? '';
    print('gender ,$gender');
    progressDialog.showDialog();
    String res=await userServices.registerUser(email: email, password: passwordController.text, name: name, age: age, gender: gender );
    if(res=="Registration successful"){
      progressDialog.dismissDialog();
      if(Get.previousRoute==AppConstant.kNewLoginScreen){
        Get.back();
      }else{

        Get.offNamed(AppConstant.kNewLoginScreen);
      }

    }
    else{
      progressDialog.dismissDialog();
    }
  }


}