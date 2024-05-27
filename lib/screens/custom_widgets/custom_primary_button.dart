import 'package:first_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final VoidCallback onButtonPressed;
  final double? height;
  final double? width;
  final Color buttonColor;
  const CustomPrimaryButton({Key? key, this.height, this.width,this.buttonColor = CustomAppColor.kOrange, required this.buttonText, this.textColor=CustomAppColor.kWhiteColor, required this.onButtonPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width?? Get.width,
      height: height??65,
      child: ElevatedButton(
        onPressed: onButtonPressed,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          shadowColor: Colors.black38,
        ),
        child:  Text(
          buttonText,
          style:  TextStyle(
            color: textColor,
            fontSize: 22, // Increase the font size of the button text
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}