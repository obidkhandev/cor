import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cor/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linear_timer/linear_timer.dart';

import 'main.dart';

class BreathingTrainingPage extends StatefulWidget {
  const BreathingTrainingPage({Key? key}) : super(key: key);

  @override
  State<BreathingTrainingPage> createState() => _BreathingTrainingPageState();
}

num breathindSpeed = 9.2;
List<bool> _inhale = [true, true, true, true];

class _BreathingTrainingPageState extends State<BreathingTrainingPage>
    with TickerProviderStateMixin {
  bool _isStart = false;
  late LinearTimerController timerController1 = LinearTimerController(this);
  late LinearTimerController timerController2 = LinearTimerController(this);
  late LinearTimerController timerController3 = LinearTimerController(this);
  late LinearTimerController timerController4 = LinearTimerController(this);
  int _remainingTime = 5; //initial time in seconds
  late Timer _timer;
  num dur = 60 / breathindSpeed - 1.5;


  @override
  void initState() {
    _inhale=[true,true,true,true];
    super.initState();
    SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);


  }


  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _inhale=[true,true,true,true];
    timerController1.stop();
    timerController2.stop();
    timerController3.stop();
    timerController4.stop();
    timerController1.reset();
    timerController2.reset();
    timerController3.reset();
    timerController4.reset();
    audioPlayer.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: EdgeInsets.only(right: 8, left: 8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  audioPlayer.stop();
                                  Navigator.pop(context);
                                },
                                child: SvgPicture.asset(
                                  "assets/images/back.svg",
                                  colorFilter: ColorFilter.mode(
                                      Colors.red, BlendMode.srcIn),
                                ),
                              ))),
                      Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  audioPlayer.stop();
                                  Navigator.of(context).push(PageRouteBuilder(
                                      opaque: false,
                                      pageBuilder:
                                          (BuildContext context, _, __) =>
                                              SettingsPage()));
                                },
                                child: Image.asset(
                                  "assets/images/settings.jpg",
                                ),
                              ))),
                    ],
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: EdgeInsets.only(right: 12, left: 12),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Text(
                        "0:0$_remainingTime",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      //width: MediaQuery.of(context).size.width-50,
                      margin: EdgeInsets.only(top: 24),
                      padding:
                          EdgeInsets.only(top: 2, bottom: 2, right: 6, left: 6),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.75),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Text(
                        "Выбор ритма дыхания",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      padding: EdgeInsets.only(
                          right: 12, left: 12, top: 12, bottom: 12),
                      margin: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Text(
                        "${breathindSpeed.toStringAsFixed(1)} дых./мин.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            breathindSpeed = breathindSpeed - 0.1;
                            dur = 60 / breathindSpeed - 1.5;
                            Navigator.pop(context);
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    BreathingTrainingPage()));
                            this.setState(() {
                              print(breathindSpeed);
                            });
                          },
                          icon: Icon(
                            Icons.do_not_disturb_on,
                            color: Colors.red,
                            size: 36,
                          )),
                      SvgPicture.asset(
                        "assets/images/arrow1.svg",
                        //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      SvgPicture.asset(
                        "assets/images/arrow.svg",
                        // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                      ),
                      IconButton(
                          onPressed: () {
                            breathindSpeed = breathindSpeed + 0.1;
                            dur = 60 / breathindSpeed - 1.5;
                            Navigator.pop(context);
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    BreathingTrainingPage()));

                            setState(() {
                              print(breathindSpeed);
                            });
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 36,
                          )),
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _inhale[0]
                            ? Container(
                                width: 10,
                                child: Image.asset(
                                  "assets/images/arrowTop.png",
                                ))
                            : Container(
                                width: 10,
                              ),
                        Container(
                            margin: EdgeInsets.only(right: 12, left: 2),
                            padding: EdgeInsets.only(
                                top: 6, bottom: 6, right: 6, left: 6),
                            height:
                                (MediaQuery.of(context).size.height / 2) / 11,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child: LinearTimer(
                                onTimerStart: () {
                                  setState(() {});
                                },
                                backgroundColor: Colors.transparent,
                                color: Colors.indigo,
                                duration: Duration(
                                    milliseconds:
                                        ((((60 / breathindSpeed - 1.5) * 1000)+1000)
                                            .toInt())),
                                controller: timerController1,
                                onTimerEnd: ()async {
                                  timerController1.stop();
                                  timerController1.reset();
                                  _inhale = [false, true, true, true];


                                  await _sound();
                                  Future.delayed(
                                       Duration(milliseconds:
                                      ((((dur * 1000)+1000)  / 10).toInt())), ()async  {
                                    _inhale = [false, false, true, true];
                                    setState(() {});
                                     _soundOut(Duration(
                                        milliseconds:
                                        ((((dur * 1000)) / 10).toInt())));
                                     timerController2.start();

                                    await Future.delayed(Duration(
                                        milliseconds:
                                        ((((dur * 1000)+1000)  / 10).toInt())));

                                  });

                                  setState(() {});
                                })),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _inhale[1]
                            ? Container(
                                width: 10,
                                child: Image.asset(
                                  "assets/images/arrowTop.png",
                                ))
                            : Container(
                                width: 10,
                              ),
                        Container(
                            margin: EdgeInsets.only(right: 12, left: 2),
                            padding: EdgeInsets.only(
                                top: 6, bottom: 6, right: 6, left: 6),
                            height:
                                (MediaQuery.of(context).size.height / 2) / 11,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child: LinearTimer(
                                onTimerStart: () {
                                  setState(() {});
                                },
                                backgroundColor: Colors.transparent,
                                color: Colors.indigo,
                                duration: Duration(
                                    milliseconds:
                                        ((((60 / breathindSpeed - 1.5) * 1000)+1000)
                                            .toInt())),
                                controller: timerController2,
                                onTimerEnd: ()async {
                                  timerController2.stop();
                                  timerController2.reset();

                                  _inhale = [false, false, true, true];
                                  Future.delayed(Duration(
                                      milliseconds:
                                          ((((dur * 1000)+1000)  / 10).toInt())));
                                  await _sound();
                                  Future.delayed(
                                      Duration(
                                          milliseconds:
                                          ((((dur * 1000)+1000) / 10).toInt())), () async {
                                    _inhale = [false, false, false, true];
                                    setState(() {});
                                     _soundOut(Duration(
                                        milliseconds:
                                        ((((dur * 1000))  / 10).toInt())));
                                    timerController3.start();

                                    await Future.delayed(Duration(
                                        milliseconds:
                                        ((((dur * 1000)+1000)  / 10).toInt())));
                                  });

                                  setState(() {});
                                })),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _inhale[2]
                            ? Container(
                                width: 10,
                                child: Image.asset(
                                  "assets/images/arrowTop.png",
                                ))
                            : Container(
                                width: 10,
                              ),
                        Container(
                            margin: EdgeInsets.only(right: 12, left: 2),
                            padding: EdgeInsets.only(
                                top: 6, bottom: 6, right: 6, left: 6),
                            height:
                                (MediaQuery.of(context).size.height / 2) / 11,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child: LinearTimer(
                                onTimerStart: () {
                                  setState(() {});
                                },
                                backgroundColor: Colors.transparent,
                                color: Colors.indigo,
                                duration: Duration(
                                    milliseconds:
                                        ((((60 / breathindSpeed - 1.5) * 1000)+1000)
                                            .toInt())),
                                controller: timerController3,
                                onTimerEnd: () async {
                                  timerController3.stop();
                                  timerController3.reset();

                                  _inhale = [false, false, false, true];
                                  Future.delayed(Duration(
                                      milliseconds:
                                          ((((dur * 1000)+1000) / 10).toInt())));
                                  await _sound();
                                  Future.delayed(
                                      Duration(
                                          milliseconds:
                                          ((((dur * 1000)+1000)/ 10).toInt())), () async {
                                    _inhale = [false, false, false, false];
                                    setState(() {});
                                     _soundOut(Duration(
                                        milliseconds:
                                        ((((dur * 1000)) / 10).toInt())));
                                    timerController4.start();

                                    await Future.delayed(Duration(
                                        milliseconds:
                                        ((((dur * 1000)+1000) / 10).toInt())));
                                  });

                                  setState(() {});
                                })),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _inhale[3]
                            ? Container(
                                width: 10,
                                child: Image.asset(
                                  "assets/images/arrowTop.png",
                                ))
                            : Container(
                                width: 10,
                              ),
                        Container(
                            margin: EdgeInsets.only(right: 12, left: 2),
                            padding: EdgeInsets.only(
                                top: 6, bottom: 6, right: 6, left: 6),
                            height:
                                (MediaQuery.of(context).size.height / 2) / 11,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child: LinearTimer(
                                onTimerStart: () {
                                  setState(() {});
                                },
                                backgroundColor: Colors.transparent,
                                color: Colors.indigo,
                                duration: Duration(
                                    milliseconds:
                                        ((((60 / breathindSpeed - 1.5) * 1000)+1000)
                                            .toInt())),
                                controller: timerController4,
                                onTimerEnd: () async {
                                  timerController4.stop();
                                  timerController4.reset();

                                  _inhale = [true, true, true, true];
                                  setState(() {});
                                  Future.delayed(Duration(
                                      milliseconds:
                                          ((((dur * 1000)+1000)/ 10).toInt())));
                                  await _sound();
                                  Future.delayed(
                                      Duration(
                                          milliseconds:
                                          ((((dur * 1000)+1000)/ 10).toInt())), () async {
                                    _inhale = [false, true, true, true];
                                    setState(() {});
                                     _soundOut(Duration(
                                        milliseconds:
                                        ((((dur * 1000)) / 10).toInt())));
                                    timerController1.start();

                                    await Future.delayed(Duration(
                                        milliseconds:
                                        ((((dur * 1000)+1000) / 10).toInt())));
                                  });

                                  setState(() {});
                                })),
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                      onTap: () async {
                        dur = 60 / breathindSpeed - 1.5;
                        _isStart = !_isStart;
                        if (_isStart == true) {
                          this.setState(() {});
                          _startTimer();
                          Future.delayed(const Duration(milliseconds: 5000),
                              ()async   {
                            _inhale = [true, true, true, true];
                            Future.delayed(Duration(
                                milliseconds: ((((dur * 1000)+1000) / 10).toInt())));
                            await _sound();
                            Future.delayed(Duration(
                                milliseconds:
                                ((((dur * 1000)+1000) / 10).toInt())),
                                () async {
                              _inhale = [false, true, true, true];
                              setState(() {});
                              Future.delayed(Duration(
                                  milliseconds: ((((dur * 1000)+1000) / 10).toInt())));
                               _soundOut(Duration(
                                  milliseconds: ((((dur * 1000)) / 10).toInt())));
                              timerController1.start();

                              await Future.delayed(Duration(
                                  milliseconds:
                                  ((((dur * 1000)+1000) / 10).toInt())));
                            });
                          });
                        } else {
                          _isStart = !_isStart;
                          _inhale = [false, false, false, false];
                          timerController1.stop();
                          timerController2.stop();
                          timerController3.stop();
                          timerController4.stop();
                          audioPlayer.stop();
                          setState(() {});

                          Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                MyHomePage(title: 'Коррекция речи'),
                          ));
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        margin: EdgeInsets.only(
                          top: 12,
                        ),
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        decoration: BoxDecoration(
                          color: _isStart
                              ? Color.fromRGBO(47, 128, 237, 1)
                              : Color.fromRGBO(33, 150, 83, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(
                            child: _isStart
                                ? Text(
                                    "Завершить",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  )
                                : Text(
                                    "Начать",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  )),
                      )),
                  Spacer(
                    flex: 1,
                  )
                ],
              ),
            )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _startTimer() {
    /*  Timer.periodic(Duration(milliseconds: (_remainingTime*1000/11).toInt()), (timer)async {
      for(int sound=1; sound<12; sound++) {
       await player.play(AssetSource("0$sound.ogg") );
        print("====================================================$sound");

      }
    });
*/
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  AudioPlayer audioPlayer = AudioPlayer();

   _sound() async {
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);


    await audioPlayer.play(AssetSource('01.ogg'));
    audioPlayer.getDuration();
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('02.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('03.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('04.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('05.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('06.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('07.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('08.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('09.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('010.ogg'));
    await Future.delayed(const Duration(milliseconds: 70));
    await audioPlayer.play(AssetSource('011.ogg'));

  }

   _soundOut(Duration _dur) async {
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);


    await audioPlayer.play(AssetSource('011.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('010.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('09.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('08.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('07.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('06.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('05.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('04.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('03.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('02.ogg'));
    await Future.delayed(_dur);
    await audioPlayer.play(AssetSource('01.ogg'));

  }
}
