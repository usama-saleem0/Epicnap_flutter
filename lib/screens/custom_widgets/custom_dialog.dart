import 'package:first_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_constant.dart';

class CustomDialog {



  static Future<void> showMyDialog() async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you Sure'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to logout.'),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Get.offAllNamed(AppConstant.kWelcomeScreen);
              },
            ),
          ],
        );
      },
    );
  }
}