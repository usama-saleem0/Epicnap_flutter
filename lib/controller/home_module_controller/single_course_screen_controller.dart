import 'package:get/get.dart';

class SingleCourseScreenController  extends GetxController{

 RxString title = ''.obs;
 RxString description = ''.obs;
 RxString imageUrl = ''.obs;
 RxInt currentIndex = 0.obs;

 @override
  void onInit() {
  print('-------------------------$title');
   title.value=Get.arguments[0];
   description.value=Get.arguments[1];
   imageUrl.value=Get.arguments[2];

    super.onInit();
  }



}