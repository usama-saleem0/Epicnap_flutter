import 'dart:io';

import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/utils/route_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;
import 'controller/auth_module_controller/newlogin_screen_controller.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final NewloginScreenController loginController = Get.put(NewloginScreenController());
  tzdata.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/New_York'));


  // HttpOverrides.global = MyHttpOverrides();
  // runApp(const MyApp());
  runApp(MyApp(loginController: loginController));
}

class MyApp extends StatelessWidget {
  final NewloginScreenController loginController;
  // const MyApp({super.key});
  const MyApp({required this.loginController});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.kAppName,
      getPages: RouteGenerator.getPages(),
      // initialRoute: AppConstant.kWelcomeScreen,
      initialRoute: loginController.isLogged ? AppConstant.kNameScreen : AppConstant.kWelcomeScreen,
    );
  }
}
// class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }

