import 'package:first_project/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../screens/custom_widgets/prograssdialog.dart';
import '../../web_services/user_services.dart';
import 'influencer_dashoard_controller.dart';

class CategorySettingController  extends GetxController{

  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  final TextEditingController thirdController = TextEditingController();


  UserServices userServices = UserServices();

  ProgressDialog progressDialog = ProgressDialog();

  Future<void> onCategory() async{
    InfluencerDashboardScreenController influencerController =
    Get.find<InfluencerDashboardScreenController>();
    int influencerId = influencerController.id.value;
    print(firstController);
    progressDialog.showDialog();

    String res=await userServices.categorysettings(first: firstController.text, second: secondController.text, third: thirdController.text, id: influencerId);
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