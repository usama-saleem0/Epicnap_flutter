import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Chat App',

      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(text);
    });
  }

  Widget _buildTextComposer() {
    return Container(

      decoration: BoxDecoration(
        color: Colors.black87, // Set input field background color to black
        // Optional: Add border radius to input field
      ),
      child: Row(
        children: [
          Flexible(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                style: TextStyle(color: Colors.white), // Set text color to white
                decoration: InputDecoration(
                  hintText: 'Enter your message...',
                  hintStyle: TextStyle(color: Colors.grey), // Set hint text color to grey
                  border: InputBorder.none, // Hide the input field border
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.white, // Set send button icon color to white
            onPressed: () {
              _handleSubmitted(_textController.text);
            },
          ),
        ],
      ),
    );
  }

  // Widget _buildTextComposer() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 8.0),
  //     child: Row(
  //       children: [
  //         Flexible(
  //           child: TextField(
  //             controller: _textController,
  //             onSubmitted: _handleSubmitted,
  //             decoration: InputDecoration.collapsed(
  //               hintText: 'Enter your message...',
  //             ),
  //           ),
  //         ),
  //         IconButton(
  //           icon: Icon(Icons.send),
  //           onPressed: () {
  //             _handleSubmitted(_textController.text);
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.back(); // Navigate back to the previous screen
              },
              child: Image.asset(
                'assets/back.png', // Replace with the path to your back icon image
                width: 40, // Adjust the width according to your design
                height: 40, // Adjust the height according to your design
              ),
            ),
            SizedBox(width: 12),
            Icon(
              Icons.person, // Your desired icon
              color: Colors.black, // Icon color
              size: 32, // Icon size
            ),
            SizedBox(width: 8), // Add some spacing between the icon and the text
            Text(
              'Connect',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: _messages.length,

              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Align messages to the right side
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.5, // Set maximum width of message container to half of the screen width
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87, // Set message container background color to black
                          borderRadius: BorderRadius.circular(5), // Optional: Add border radius to message container
                        ),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          _messages[index],
                          style: TextStyle(color: Colors.white), // Set message text color to white
                        ),
                      ),
                    ],
                  ),
                );
              },


              // itemBuilder: (BuildContext context, int index) {
              //   return Padding(
              //     padding: EdgeInsets.symmetric(vertical: 8.0),
              //     child: Text(_messages[index]),
              //   );
              // },
            ),
          ),
          Divider(height: 1.0),
          _buildTextComposer(),
        ],
      ),
    );
  }
}
