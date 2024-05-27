
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatScreenController  extends GetxController{

  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(text);
    });
  }
}

void setState(Null Function() param0) {
}