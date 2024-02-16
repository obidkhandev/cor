import 'dart:async';

//import 'package:audioplayers/audioplayers.dart';
import 'package:cor/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:linear_timer/linear_timer.dart';

import 'main.dart';

class BreathingTrainingPage extends StatefulWidget {
  const BreathingTrainingPage({Key? key}) : super(key: key);

  @override
  State<BreathingTrainingPage> createState() => _BreathingTrainingPageState();
}

num breathindSpeed = 9.2;
List<bool> _inhale = [false, false, false, false];

String speedForLine ="-";
 var player0 = AudioPlayer();
var player1 = AudioPlayer();

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
    player1= AudioPlayer();
    player0= AudioPlayer();

print("ИНИТ СТАРИЦЫ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    speedForLine = _durSound(breathindSpeed);
    _inhale=[false,false,false,false];
    super.initState();
    SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);


  }


  @override
  void dispose() {
    player0.dispose();
    player1.dispose();
    super.dispose();

    _timer.cancel();
    _inhale=[false,false,false,false];
    timerController1.stop();
    timerController2.stop();
    timerController3.stop();
    timerController4.stop();
    timerController1.reset();
    timerController2.reset();
    timerController3.reset();
    timerController4.reset();
   player1.stop();
    player0.stop();
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
                                 // audioPlayer.stop();
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
                                 // audioPlayer.stop();
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
                           if(breathindSpeed>5.1) breathindSpeed = breathindSpeed - 0.1;
                            dur = 60 / breathindSpeed - 1.5;






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
                           if(breathindSpeed<14.99) breathindSpeed = breathindSpeed + 0.1;
                            dur = 60 / breathindSpeed - 1.5;



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
                                        (((60 / breathindSpeed - 1.5) * 1000+300)
                                            .toInt())),
                                controller: timerController1,
                                onTimerEnd: ()async {
                                  timerController1.stop();
                                  timerController1.reset();


                                  await Future.delayed(Duration(
                                      milliseconds:
                                      1000));
                                  _inhale = [false, true, false, false];
                                  setState(() {});
                                  await _sound();
                                  _inhale = [false, false, false, false];
                                  setState(() {});
                                  await Future.delayed(Duration(
                                      milliseconds:
                                      500));
                                   _soundOut(speedForLine);
                                  timerController2.start();



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
                                        (((60 / breathindSpeed - 1.5) * 1000+300)
                                            .toInt())),
                                controller: timerController2,
                                onTimerEnd: ()async {
                                  timerController2.stop();
                                  timerController2.reset();

                                  _inhale = [false, false, false, false];
                                  setState(() {});
                                  await Future.delayed(Duration(
                                      milliseconds:
                                      1000));
                                  _inhale = [false, false, true, false];
                                  setState(() {});
                                  await _sound();
                                  _inhale = [false, false, false, false];
                                  setState(() {});
                                  await Future.delayed(Duration(
                                      milliseconds:
                                      500));
                                  _soundOut(speedForLine);
                                  timerController3.start();



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
                                        (((60 / breathindSpeed - 1.5) * 1000+300)
                                            .toInt())),
                                controller: timerController3,
                                onTimerEnd: () async {
                                  timerController3.stop();
                                  timerController3.reset();


                                  await Future.delayed(Duration(
                                      milliseconds:
                                      1000));
                                  _inhale = [false, false, false, true];
                                  setState(() {});
                                  await _sound();
                                  _inhale = [false, false, false, false];
                                  setState(() {});await Future.delayed(Duration(
                                      milliseconds:
                                      500));
                                  _soundOut(speedForLine);
                                  timerController4.start();


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
                                        (((60 / breathindSpeed - 1.5) * 1000+300)
                                            .toInt())),
                                controller: timerController4,
                                onTimerEnd: () async {
                                  timerController4.stop();
                                  timerController4.reset();


                                  setState(() {});
                                  await Future.delayed(Duration(
                                      milliseconds:
                                      1000));
                                  _inhale = [true, false, false, false];
                                  setState(() {});
                                  await _sound();
                                  _inhale = [false, false, false, false];
                                  setState(() {});
                                  await Future.delayed(Duration(
                                      milliseconds:
                                      500));
                                  _soundOut(speedForLine);
                                  timerController1.start();



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
                            _inhale = [false, false, false, false];
                            await Future.delayed(Duration(
                                milliseconds:
                                1000));
                            _inhale = [true, false, false, false];
                            setState(() {});
                            await _sound();
                            _inhale = [false, false, false, false];
                            setState(() {});
                            await Future.delayed(Duration(
                                milliseconds:
                                500));
                            _soundOut(speedForLine);
                            timerController1.start();


                          });
                        } else {
                          _isStart = !_isStart;
                          _inhale = [false, false, false, false];
                          setState(() {});
                          timerController1.stop();
                          timerController2.stop();
                          timerController3.stop();
                          timerController4.stop();
                          player0.dispose();
                          player1.dispose();


                          setState(() {});


                          Navigator.pushAndRemoveUntil<dynamic>(
                            context,
                            MaterialPageRoute<dynamic>(
                              builder: (BuildContext context) => MyHomePage(title: 'Коррекция речи'),
                            ),
                                (route) => false,//if you want to disable back feature set to false
                          );

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

 // AudioPlayer audioPlayer = AudioPlayer();

   _sound() async {


await player0.setAsset('assets/in.mp3');
await player0.play();
player0.stop();

  }

  _durSound(num speed) {

    switch (speed.toStringAsFixed(1)) {

      case "15.0":
        return 'assets/15-0.mp3';

      case "14.9":
        return 'assets/15-0.mp3';
      case "14.8":
        return 'assets/15-0.mp3';
      case "14.7":
        return 'assets/15-0.mp3';
      case "14.6":
        return 'assets/14-6.mp3';
      case "14.5":
        return 'assets/14-6.mp3';

      case"14.4":
        return 'assets/14-6.mp3';
      case "14.3":
        return 'assets/14-6.mp3';
      case "14.2":
        return 'assets/14-2.mp3';
      case "14.1":
        return 'assets/14-2.mp3';


      case "14.0":
        return 'assets/14-2.mp3';
      case "13.9":
        return 'assets/13-9.mp3';
      case "13.8":
        return 'assets/13-9.mp3';
      case "13.7":
        return 'assets/13-9.mp3';
      case "13.6":
        return 'assets/13-5.mp3';
      case "13.5":
        return 'assets/13-5.mp3';
      case "13.4":
        return 'assets/13-5.mp3';
      case "13.3":
        return 'assets/13-2.mp3';
      case "13.2":
        return 'assets/13-2.mp3';
      case "13.1":
        return 'assets/13-2.mp3';


      case "13.0":
        return 'assets/12-9.mp3';
      case "12.9":
        return 'assets/12-9.mp3';
      case "12.8":
        return 'assets/12-9.mp3';
      case "12.7":
        return 'assets/12-6.mp3';
      case "12.6":
        return 'assets/12-6.mp3';
      case "12.5":
        return 'assets/12-4.mp3';
      case "12.4":
        return 'assets/12-4.mp3';
      case "12.3":
        return 'assets/12-4.mp3';
      case "12.2":
        return 'assets/12-1.mp3';
      case "12.1":
        return 'assets/12-1.mp3';


      case "12.0":
        return 'assets/11-9.mp3';
      case "11.9":
        return 'assets/11-9.mp3';
      case "11.8":
        return 'assets/11-9.mp3';
      case "11.7":
        return 'assets/11-6.mp3';
      case "11.6":
        return 'assets/11-6.mp3';
      case "11.5":
        return 'assets/11-4.mp3';
      case "11.4":
        return 'assets/11-4.mp3';
      case "11.3":
        return 'assets/11-2.mp3';
      case "11.2":
        return 'assets/11-2.mp3';
      case "11.1":
        return 'assets/11-0.mp3';


      case "11.0":
        return 'assets/11-0.mp3';
      case "10.9":
        return 'assets/10-8.mp3';
      case "10.8":
        return 'assets/10-8.mp3';
      case "10.7":
        return 'assets/10-6.mp3';
      case "10.6":
        return 'assets/10-6.mp3';
      case "10.5":
        return 'assets/10-4.mp3';
      case "10.4":
        return 'assets/10-4.mp3';
      case "10.3":
        return 'assets/10-2.mp3';
      case "10.2":
        return 'assets/10-2.mp3';
      case "10.1":
        return 'assets/10-2.mp3';


      case "10.0":
        return 'assets/9-9.mp3';
      case "9.9":
        return 'assets/9-9.mp3';
      case "9.8":
        return 'assets/9-6.mp3';
      case "9.7":
        return 'assets/9-6.mp3';
      case "9.6":
        return 'assets/9-6.mp3';
      case "9.5":
        return 'assets/9-4.mp3';
      case "9.4":
        return 'assets/9-4.mp3';
      case "9.3":
        return 'assets/9-4.mp3';
      case "9.2":
        return 'assets/9-1.mp3';
      case "9.1":
        return 'assets/9-1.mp3';


      case "9.0":
        return 'assets/8-9.mp3';
      case "8.9":
        return 'assets/8-9.mp3';
      case "8.8":
        return 'assets/8-7.mp3';
      case "8.7":
        return 'assets/8-7.mp3';
      case "8.6":
        return 'assets/8-5.mp3';
      case "8.5":
        return 'assets/8-5.mp3';
      case "8.4":
        return 'assets/8-3.mp3';
      case "8.3":
        return 'assets/8-3.mp3';
      case "8.2":
        return 'assets/8-1.mp3';
      case "8.1":
        return 'assets/8-1.mp3';


      case "8.0":
        return 'assets/7-9.mp3';
      case "7.9":
        return 'assets/7-9.mp3';
      case "7.8":
        return 'assets/7-7.mp3';
      case "7.7":
        return 'assets/7-7.mp3';
      case "7.6":
        return 'assets/7-5.mp3';
      case "7.5":
        return 'assets/7-5.mp3';
      case "7.4":
        return 'assets/7-3.mp3';
      case "7.3":
        return 'assets/7-3.mp3';
      case "7.2":
        return 'assets/7-1.mp3';
      case "7.1":
        return 'assets/7-1.mp3';


      case "7.0":
        return 'assets/6-9.mp3';
      case "6.9":
        return 'assets/6-9.mp3';
      case "6.8":
        return 'assets/6-7.mp3';
      case "6.7":
        return 'assets/6-7.mp3';
      case "6.6":
        return 'assets/6-5.mp3';
      case "6.5":
        return 'assets/6-5.mp3';
      case "6.4":
        return 'assets/6-3.mp3';
      case "6.3":
        return 'assets/6-3.mp3';
      case "6.2":
        return 'assets/6-1.mp3';
      case "6.1":
        return 'assets/6-1.mp3';


      case "6.0":
        return 'assets/5-9.mp3';
      case "5.9":
        return 'assets/5-9.mp3';
      case "5.8":
        return 'assets/5-7.mp3';
      case "5.7":
        return 'assets/5-7.mp3';
      case "5.6":
        return 'assets/5-5.mp3';
      case "5.5":
        return 'assets/5-5.mp3';
      case "5.4":
        return 'assets/5-4.mp3';
      case "5.3":
        return 'assets/5-3.mp3';
      case "5.2":
        return 'assets/5-2.mp3';
      case "5.1":
        return 'assets/5-1.mp3';


      case "5.0":
        return 'assets/5-0.mp3';

      default :
        return 'assets/9-6.mp3';



    }

  }

   _soundOut(String speedForLine) async {


     await player1.setAsset(speedForLine);

     await player1.play();
     player1.stop();
  }
}
