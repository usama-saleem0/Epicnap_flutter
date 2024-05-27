import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';
import 'influencer_dashoard_controller.dart';

class PaymentSettingController  extends GetxController{

  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();

// Future<void> onPayment() async {
//
//   UserServices userServices = UserServices();
//  String res = await userServices.initiatePaypalPayments(userId: userId);
//  print(res);
//  if (res == "Registration successful") {
//   if (Get.previousRoute == AppConstant.kLoginScreen) {
//    Get.back();
//   } else {
//    // Get.offNamed(AppConstant.kLoginScreen);
//   }
//   Get.toNamed(AppConstant.kPaymentScreen);
//  }
// }
  UserServices userServices = UserServices();

  ProgressDialog progressDialog = ProgressDialog();

  Future<void> onPayment() async{
    InfluencerDashboardScreenController influencerController =
    Get.find<InfluencerDashboardScreenController>();
    int influencerId = influencerController.id.value;
    print("Influencer ID: $influencerId");
    progressDialog.showDialog();

    String res=await userServices.paymentsettings(first: firstController.text, second: secondController.text, third: thirdController.text, id: influencerId);
   print(res);
    if(res=="saved"){
      progressDialog.dismissDialog();


        Get.offNamed(AppConstant.kAccountSetting);


    }
    else{
      progressDialog.dismissDialog();
    }
  }


}