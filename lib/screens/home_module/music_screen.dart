import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/bedtime_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/screens/custom_widgets/custom_primary_button.dart';
import 'package:first_project/utils/app_colors.dart';
import 'package:first_project/utils/app_constant.dart';
import 'package:first_project/welcome.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_module_controller/name_screen_controller.dart';
import '../../controller/home_module_controller/alarm_screen_controller.dart';
import '../../controller/home_module_controller/music_screen_controller.dart';
import '../custom_widgets/custom_textfield.dart';


  class MusicScreen extends GetView<MusicScreenController>{
    const MusicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF281f57),
              Color(0xFF161D34),
              Color(0xFF161D34),
              Color(0xFF281f57),
            ],
            stops: [0.0, 0.1, 0.85, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              SizedBox(height: 20),
              Expanded(

                child: ListView(
                  children: List.generate(8, (index) => buildMusicCard(context, index)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
              // Implement back navigation
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          SizedBox(width: 10),
          Text(
            'Music',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildMusicCard(BuildContext context, int index) {
    // final List<Map<String, String>> staticData = [
    //   {
    //     'title': 'Calming meditation',
    //     'description': 'Song for nap, #relaxing, slepping ......',
    //     'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
    //   },
    //   {
    //     'title': 'Another Meditation',
    //     'description': 'Another description...',
    //     'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3', // Replace with your MP3 URL
    //   },
    //   // Add more static data for other cards here
    // ];
    final List<Map<String, String>> staticData = [
      {
        'title': 'A peaceful sleep',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },
      {
        'title': 'Calming Exhalation',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },
      {
        'title': 'The Movement Of The Stars In The Sky',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },
      {
        'title': 'A Sky Like Mind',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },

      {
        'title': 'Bodyscan',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },
      {
        'title': 'Drifting Into Sleep',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },

      {
        'title': 'Letting Go Of Anxiety, Stress and Worries',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },
      {
        'title': 'Introduction to Meditation',
        'description': 'Meditation',
        'url': 'https://epicnap.com/wp-content/uploads/2024/02/A-Peaceful-Sleep-final-2.mp3',
      },


    ];

    final Map<String, String> musicData = staticData[index];

    return GestureDetector(
      onTap: () {
        _showMusicPlayerModal(context, musicData['url']! , musicData['title']!);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xffD8D8D8).withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 15,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset('assets/playicon.png', width: 50),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    musicData['title']!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Text(
                    musicData['description']!,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),

            // GestureDetector(
            //   onTap: () {
            //     controller.toggleLike(index); // Toggle the like state when tapped
            //   },
            //   child: Obx( () =>
            //       Image.asset(
            //         controller.isLiked[index] ? 'assets/like.png' : 'assets/liked.png',
            //         width: 30,
            //       ),
            //   ),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     // Handle onTap event for threedots icon
            //   },
            //   child: Image.asset('assets/threedots.png', width: 30),
            // ),
          ],
        ),
      ),
    );
  }

  void _showMusicPlayerModal(BuildContext context, String url, String title) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: [
            MusicPlayerModal(url: url, title: title),
          ],
        );
        // return MusicPlayerModal(url: url, title:title);
      },
    );
  }
}

class MusicPlayerModal extends StatefulWidget {
  final String url;
  final String title;


  const MusicPlayerModal({required this.url, required this.title});

  @override
  _MusicPlayerModalState createState() => _MusicPlayerModalState();
}

class _MusicPlayerModalState extends State<MusicPlayerModal> {
  bool isPlaying = false;
  late AudioPlayer audioPlayer;
  late Duration _duration = Duration.zero;

  late Duration _position = Duration.zero;

  late Timer _timer;
  bool isExpanded = false;
  bool showImage = false;

  @override
  // void initState() {
  //   super.initState();
  //   audioPlayer = AudioPlayer();
  //   audioPlayer.onPlayerStateChanged.listen((state) {
  //     if (state == PlayerState.stopped || state == PlayerState.completed) {
  //       setState(() {
  //         isPlaying = false;
  //       });
  //     }
  //   });
  //
  // }

  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _duration = Duration();
    _position = Duration();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      audioPlayer.getCurrentPosition().then((position) {
        setState(() {
          _position = position ?? Duration.zero;
        });
      });
    });
    audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.stopped || state == PlayerState.completed) {
        setState(() {
          isPlaying = false;
        });
      }
    });
    audioPlayer.play(UrlSource(widget.url)).then((value) {
      audioPlayer.getDuration().then((duration) {
        setState(() {
          _duration = duration ?? Duration.zero;
        });
      });
    });
  }


  @override
  void dispose() {
    audioPlayer.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.black,
      duration: Duration(milliseconds: 300),
      height: isExpanded ? 900 : 300,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Icon(
              isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: Image.asset(
          //       'assets/musicicon.png',
          //     width: 15,
          //
          //     ),
          // ),

                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis, // Truncate text with ellipsis when it's too long
                    maxLines: 1, // Set maximum number of lines
                  ),
                ),
                // Text(
                //   widget.title,
                //   style: TextStyle(color: Colors.white, fontSize: 20),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          ),
          // Visibility(
          //   visible: isExpanded,
          //   child: Image.asset(
          //     'assets/songimage.png',
          //     // width: 100,
          //     // height: 100,
          //   ),
          // ),

            Visibility(
              visible: isExpanded , // Show the image only if isExpanded is true and showImage is true
              child: Image.asset(
                'assets/songimage.png',
                // width: 100,
                // height: 100,
              ),
            ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              if (isPlaying) {
                audioPlayer.pause();
              } else {
                audioPlayer.play(UrlSource(widget.url));
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.asset(
                    'assets/playback.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                Image.asset(
                  isPlaying ? 'assets/logos.png' : 'assets/pauseicons.png',
                  width: 50,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    'assets/playnext.png',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  '${_position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(_position.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: _duration.inMilliseconds > 0
                      ? _position.inMilliseconds.toDouble() / _duration.inMilliseconds.toDouble()
                      : 0.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(_duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),

          ElevatedButton(
            onPressed: () {



      Get.find<BedTimeScreenController>().scheduleAlarm(widget.url);

              // audioPlayer.stop();

              // Get.back();
              // controller.scheduleAlarm();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xff8650F6)), // Set button color
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Set border radius
                ),
              ),
            ),
            child:Text(
             'Select Music',
              style: TextStyle(color: Colors.white, fontSize: 12),

            ),
            // child: Text( 'Collapse'), // Change button text based on isExpanded
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //
          //       horizontal: 70,
          //
          //   ),
          //   child: CustomPrimaryButton(buttonText: 'Set', onButtonPressed: (){
          //
          //
          //   },buttonColor: Color(0xff8650F6),textColor: Colors.white,),
          // ),

        ],
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return Material(
  //     color: Colors.black,
  //     elevation: 4,
  //     borderRadius: BorderRadius.only(
  //       topLeft: Radius.circular(20),
  //       topRight: Radius.circular(20),
  //     ),
  //     child: Container(
  //       height: 250,
  //       padding: EdgeInsets.all(20),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Center(
  //             child: Text(
  //               widget.title,
  //               style: TextStyle(color: Colors.white, fontSize: 20),
  //               textAlign: TextAlign.center, // Optionally, you can use `TextAlign.center` for center alignment
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           GestureDetector(
  //             onTap: () {
  //               if (isPlaying) {
  //                 audioPlayer.pause(); // Pause audio if it's playing
  //               } else {
  //                 audioPlayer.play(UrlSource(widget.url)); // Start playing audio if it's paused
  //               }
  //               setState(() {
  //                 isPlaying = !isPlaying;
  //               });
  //             },
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //
  //                 Padding(
  //                   padding: const EdgeInsets.only(right: 8.0),
  //                   child: Image.asset(
  //                      'assets/playback.png', // Replace with your asset paths
  //                     width: 40,
  //                     height: 40,
  //                   ),
  //                 ),
  //                 Image.asset(
  //                   isPlaying ? 'assets/logos.png' : 'assets/pauseicons.png', // Replace with your asset paths
  //                   width: 50,
  //                   height: 50,
  //                 ),
  //
  //                 Padding(
  //                   padding: const EdgeInsets.only(left: 8.0),
  //                   child: Image.asset(
  //                     'assets/playnext.png', // Replace with your asset paths
  //                     width: 40,
  //                     height: 40,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //
  //
  //           SizedBox(height: 20),
  //           Row(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 8.0),
  //                 child: Text(
  //                   '${_position.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(_position.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //               Expanded(
  //                 child: LinearProgressIndicator(
  //                   value: _duration.inMilliseconds > 0
  //                       ? _position.inMilliseconds.toDouble() / _duration.inMilliseconds.toDouble()
  //                       : 0.0,
  //                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  //                   backgroundColor: Colors.grey,
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 8.0),
  //                 child: Text(
  //                   '${_duration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(_duration.inSeconds.remainder(60)).toString().padLeft(2, '0')}',
  //                   style: TextStyle(color: Colors.white),
  //                 ),
  //               ),
  //             ],
  //           ),
  //
  //           // LinearProgressIndicator(
  //           //   value: _duration.inMilliseconds > 0
  //           //       ? _position.inMilliseconds.toDouble() / _duration.inMilliseconds.toDouble()
  //           //       : 0.0,
  //           //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  //           //   backgroundColor: Colors.grey,
  //           // ),
  //
  //           // LinearProgressIndicator(
  //           //   value: 0.5,
  //           //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  //           //   backgroundColor: Colors.grey,
  //           // ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}


