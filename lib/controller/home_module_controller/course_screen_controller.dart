import 'package:first_project/utils/app_constant.dart';
import 'package:get/get.dart';

class CourseScreenController  extends GetxController{

  void onCourseTap({required String title,required String description , required String imageUrl}){
    Get.toNamed(AppConstant.kSingleCourseScreen,arguments: [title , description , imageUrl]);
  }


}