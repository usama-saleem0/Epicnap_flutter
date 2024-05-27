import 'package:first_project/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget{
  String hintText = "";
  bool enabled = true;
  bool isAllProduct = false;
  bool isPassword = false;
  bool showPassword = false;
  Widget? suffixIcon;
  Widget? prefixIcon;
  TextInputFormatter? textInputFormatter;
  Color color = Colors.white;
  int? maxLength;
  TextInputType? keyBoardType;
  double? fontSize;
  dynamic onChanged;
  bool readOnly = false;
  Color? fillColor;
  double radius = 30;
  TextEditingController? controller;
  bool isMultiLine = false;
  FocusNode? focusNode;
  double height = 60;
  double width = Get.width;
  double paddingHorizontal;
  bool autoCorrect=false;
  TextInputAction? textInputAction;
  List<String> autofillHints=<String>[];

  CustomTextField({super.key, this.hintText = "",
    this.enabled = true,
    this.isAllProduct = false,
    this.isPassword = false,
    this.showPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.color = Colors.white,
    this.maxLength,
    this.keyBoardType,
    this.fontSize,
    this.onChanged,
    this.readOnly = false,
    this.fillColor,
    this.radius = 12,
    this.controller,
    this.isMultiLine = false,
    this.focusNode,
    this.height = 70,
    this.width = double.infinity,
    this.textInputAction,
    this.paddingHorizontal = 0,
    this.textInputFormatter,
    this.autofillHints=const [],
    this.autoCorrect=false
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMultiLine ? null : height,
      width: width,
      decoration: BoxDecoration(
          color: Color(0xffD8D8D8).withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          // border: const Border.symmetric(),
          border: Border.all(
            color: Color(0xff848484).withOpacity(0.3), // Set your desired border color here
            width: 1, // Set the border width
          ),
          boxShadow: [
            // const BoxShadow(
            //     color: Color(0xff848484), blurRadius: 6, offset: Offset(0, 2))
          ]),
      child: TextField(
        readOnly: readOnly,
        focusNode: focusNode,
        enabled: enabled,
        controller: controller,
        obscureText: showPassword,
        textAlign: maxLength != null ? TextAlign.center : TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        maxLength: maxLength,
        keyboardType: keyBoardType,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration:  InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15,),
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffDFDFDF),
              fontSize: 14,
              // fontWeight: FontWeight.bold

            )),
        onChanged: (text) {
          if(onChanged!=null) {
            onChanged(text);
          }
        },
      ),
    );
  }


}