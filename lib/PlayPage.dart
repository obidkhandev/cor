import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cor/ChoiceTextPage.dart';
import 'package:cor/ReadingPage.dart';
import 'package:cor/ResultPage.dart';
import 'package:cor/TextPage.dart';
import 'package:flutter/material.dart';

import 'TextResultPage.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

bool _isPlay = false;

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.65),
      body: Center(
          child: Container(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(flex: 1),
          Container(
            width: MediaQuery.of(context).size.width - 48,
            padding: EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 3),
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                )),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "${text_titles[selectIndex]}. ${curDateText}. ${curModeText}.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 16),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        recordingPlayer.seekBy(Duration(seconds: -5));
                      },
                      icon: Icon(Icons.fast_rewind),
                    ),
                    IconButton(
                        onPressed: () async {
                          if (_isPlay == false) {
                            setState(() {
                              _isPlay = !_isPlay;
                            });

                            recordingPlayer.open(
                              Audio.file(resForText[curIndex]),
                              autoStart: true,
                              showNotification: true,
                            );
                          } else {
                            setState(() {
                              _isPlay = !_isPlay;
                            });
                            recordingPlayer.stop();
                          }
                        },
                        icon: _isPlay
                            ? Icon(
                                Icons.pause_circle,
                                size: 48,
                              )
                            : Icon(
                                Icons.play_circle,
                                size: 48,
                              )),

                    IconButton(
                      onPressed: () {
                        recordingPlayer.seekBy(Duration(seconds: 5));
                      },
                      icon: Icon(Icons.fast_forward),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      recordingPlayer.stop();
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.only(top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 1.0,
                            spreadRadius: 1.0,
                            offset: Offset(0, 1),
                          )
                        ],
                        color: Color.fromRGBO(217, 217, 217, 0.78),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            topLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6)),
                      ),
                      child: Center(
                          child: Text(
                        "Закрыть",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      )),
                    ))
              ],
            ),
          ),
          Spacer(flex: 1),
        ],
      ))),
    );
  }
}
