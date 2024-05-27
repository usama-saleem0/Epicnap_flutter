import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:first_project/controller/auth_module_controller/setpass_screen_controller.dart';
import 'package:first_project/controller/auth_module_controller/welcome_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/bedtime_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/library_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/maindashboard_screen_controller.dart';
import 'package:first_project/controller/home_module_controller/sound_screen_controller.dart';
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


  class SoundScreen extends GetView<SoundScreenController>{
    const SoundScreen({Key? key}) : super(key: key);
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
                  children: List.generate(5, (index) => buildMusicCard(context, index)),
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
            child:
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset(
                'assets/previous.png',
                width: 25,
                height: 25,
              ),
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Sounds Library',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildMusicCard(BuildContext context, int index) {

    final List<Map<String, String>> staticData = [
      {
        'title': 'Water Gate Flowing',
        'description': 'Sound',
        'url': 'https://epicnap.appssols.com/sound/25310%20water%20gate%20flowing%20water%20loop-full.mp3',
      },
      {
        'title': 'Rain Under Raincoat',
        'description': 'Sound',
        'url': 'https://epicnap.appssols.com/sound/26267%20rain%20under%20raincoat%20loop-full.mp3',
      },
      {
        'title': 'Waves Lapping on Beach',
        'description': 'Sound',
        'url': 'https://epicnap.appssols.com/sound/LDj_Audio%20-%20Waves%20Lapping%20on%20Beach%20(Mp3).mp3',
      },
      {
        'title': 'Rain',
        'description': 'Sound',
        'url': 'https://epicnap.appssols.com/sound/Rain%202.mp3',
      },


      {
        'title': 'Rain 2',
        'description': 'Music',
        'url': 'https://epicnap.appssols.com/sound/Rain.mp3',
      },



    ];

    final Map<String, String> musicData = staticData[index];

    return GestureDetector(
      onTap: () {
        _showMusicPlayerModal(context, musicData['url']! , musicData['title']!);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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

            GestureDetector(
              onTap: () {
                controller.toggleLike(index);
              },
              child: Obx( () =>
                  Icon(
                    controller.isLiked[index] ? Icons.favorite : Icons.favorite_border,
                    color: controller.isLiked[index] ? Color(0xff8650F6) : null,
                  )
                  // Image.asset(
                  //   controller.isLiked[index] ? 'assets/like.png' : 'assets/liked.png',
                  //   width: 30,
                  // ),
              ),
            ),

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


                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis, // Truncate text with ellipsis when it's too long
                    maxLines: 1, // Set maximum number of lines
                  ),
                ),

              ],
            ),
          ),


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
                  isPlaying ? 'assets/playing.png' : 'assets/pauseicons.png',
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

        ],
      ),
    );
  }

}


