import 'package:first_project/utils/app_constant.dart';
import 'package:get/get.dart';

import '../../web_services/user_services.dart';
import 'dashboard_screen_controller.dart';

class SingleInfluencerScreenController  extends GetxController {


 RxString title = ''.obs;
 RxString description = ''.obs;
 RxString imageUrl = ''.obs;
 UserServices userServices = UserServices();

 @override
 void onInit() {
  title.value = Get.arguments[0];
  description.value = Get.arguments[1];
  imageUrl.value = Get.arguments[2];

  super.onInit();
 }

 // Future<void> onPayment() async {
 //  DashboardScreenController dashboardScreenController = Get.find<
 //      DashboardScreenController>();
 //  int userId = dashboardScreenController.id.value;
 //  print("Influencer ID: $userId");
 //
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


 Future<void> onPayment() async {
  try {
   DashboardScreenController dashboardScreenController = Get.find<DashboardScreenController>();
   int userId = dashboardScreenController.id.value;
   print("Influencer ID: $userId");

   String res = await userServices.initiatePaypalPayment(userId: userId);
   print(res);

   // Handle the result, e.g., show a message or navigate to another screen
   if (res == "Payment initiation successful") {
    // Payment initiation was successful, navigate to the next screen
   } else {
    // Payment initiation failed, show an error message
   }
  } catch (e) {
   // Handle exceptions
   print("Error: $e");
  }
 }

}