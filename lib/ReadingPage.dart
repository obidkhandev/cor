import 'dart:async';
import 'dart:io';

import 'package:animated_line_through/animated_line_through.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cor/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cor/BreathingTrainingPage.dart';
import 'package:cor/ChoiceTextPage.dart';
import 'package:cor/ReadingModePage.dart';
import 'package:cor/ResultPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_sound/flutter_sound.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:linear_timer/linear_timer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:uuid/uuid.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}

bool isRecord = false;
var indexLines = 0;
List<bool> _isCrossed = [false, false, false, false];
List<bool> inhale = [true, true, true, true];

List<num> initLineTime(List<String> cur_lines, num? selectSpeed) {
  num syllable_A;
  num exhalation_B;
  num speed_C;
  num count_vowels = 0;
  for (var i = 0; i < cur_lines.length; i++) {
    count_vowels =
        count_vowels + 'а'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'у'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'о'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'ы'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'и'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'э'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'я'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'ю'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'е'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + 'ё'.allMatches(cur_lines[i].toLowerCase()).length;

    count_vowels =
        count_vowels + ' в '.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + ' с '.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels =
        count_vowels + ' к '.allMatches(cur_lines[i].toLowerCase()).length;
  }
  print(count_vowels);
  print(count_vowels / (cur_lines.length));
  readingMode == "1 строка"
      ? syllable_A = count_vowels / (cur_lines.length)
      : syllable_A = count_vowels /
          ((cur_lines.length) /
              2); //==================СРЕДНЕЕ КОЛИЧЕСТВО СЛОГОВ
  print(count_vowels / (cur_lines.length) * 0.4);
  exhalation_B = syllable_A * 0.4; //=============== среднее время выдоха
  print(count_vowels / (cur_lines.length) * 0.4 + 1.5);
  print((count_vowels / (cur_lines.length) * 0.4 + 1.5) / 60);
  print(((syllable_A) / ((syllable_A * 0.4 + 1.5) / 60)).toString() + "speed");
  speed_C = (syllable_A) /
      ((syllable_A * 0.4 + 1.5) / 60); //=============== СКОРОСТЬ ЧТЕНИЯ

  num syllable_1_D; //=============== Длительность 1 слога
  selectSpeed == null
      ? syllable_1_D = (syllable_A / speed_C * 60 - 1.5) / syllable_A
      : syllable_1_D = (syllable_A / selectSpeed * 60 - 1.5) / syllable_A;

  List<num> timeForLine =
      []; //============================время для каждой линии
  for (var i = 0; i < cur_lines.length; i++) {
    num count_vowels_with = 0;

    count_vowels_with =
        count_vowels_with + 'а'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'у'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'о'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'ы'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'и'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'э'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'я'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'ю'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'е'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + 'ё'.allMatches(cur_lines[i].toLowerCase()).length;

    count_vowels_with =
        count_vowels_with + ' в '.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + ' с '.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels_with =
        count_vowels_with + ' к '.allMatches(cur_lines[i].toLowerCase()).length;

    count_vowels_with = count_vowels_with +
        ('. '.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;
    count_vowels_with = count_vowels_with +
        (','.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;
    count_vowels_with = count_vowels_with +
        ('?'.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;
    count_vowels_with = count_vowels_with +
        ('!'.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;
    count_vowels_with = count_vowels_with +
        ('...'.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;
    count_vowels_with = count_vowels_with +
        (':'.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;
    count_vowels_with = count_vowels_with +
        (';'.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;
    count_vowels_with = count_vowels_with +
        ('-'.allMatches(cur_lines[i].toLowerCase()).length) * 0.25;

    timeForLine.add(syllable_1_D * count_vowels_with);
  }
  print(timeForLine);

  return timeForLine;
}

late FlutterSoundRecorder _recordingSession;
final recordingPlayer = AssetsAudioPlayer();
late String pathToAudio;
bool _playAudio = false;

class _ReadingPageState extends State<ReadingPage>
    with TickerProviderStateMixin {
  final _key1 = GlobalKey();
  final _key2 = GlobalKey();
  final _key3 = GlobalKey();
  final _key4 = GlobalKey();

  late LinearTimerController timerController1 = LinearTimerController(this);
  late LinearTimerController timerController2 = LinearTimerController(this);
  late LinearTimerController timerController3 = LinearTimerController(this);
  late LinearTimerController timerController4 = LinearTimerController(this);

  int _remainingTime = 5; //initial time in seconds
  late Timer _timer;
  bool _isStart = false;

  double wdth1 = 50;
  double wdth2 = 50;
  double wdth3 = 50;
  double wdth4 = 50;

  wdthFunc(BuildContext context) {
    setState(() {
      wdth1 = _key1.currentContext?.size?.width ?? 50;
      wdth2 = _key2.currentContext?.size?.width ?? 50;
      wdth3 = _key3.currentContext?.size?.width ?? 50;
      wdth4 = _key4.currentContext?.size?.width ?? 50;
    });
  }



  void initializer() async {
    List<String>? resPath =
        await pref.getStringList('${items[selectIndex]}_res');
    String uuid = Uuid().v4();
    pathToAudio = '/sdcard/Download/${items[selectIndex]}_${uuid}.wav';
    resPath?.add(pathToAudio);
    _recordingSession = FlutterSoundRecorder();
    await _recordingSession.openRecorder(
        /*focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker*/
        );
    await _recordingSession.setSubscriptionDuration(Duration(milliseconds: 10));
    await initializeDateFormatting();
    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  ElevatedButton createElevatedButton(
      {required IconData icon,
      required Color iconColor,
      required Function onPressFunc}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(6.0),
        side: BorderSide(
          color: Colors.red,
          width: 4.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        primary: Colors.white,
        elevation: 9.0,
      ),
      onPressed: () {
        onPressFunc();
      },
      icon: Icon(
        icon,
        color: iconColor,
        size: 38.0,
      ),
      label: Text(''),
    );
  }

  Future<void> startRecording() async {
    print("========================================ЗАПИСЬ ИДЕТ ");
    Directory directory = Directory(path.dirname(pathToAudio));
    if (!directory.existsSync()) {
      directory.createSync();
    }
    _recordingSession.openRecorder();
    await _recordingSession.startRecorder(
      toFile: pathToAudio,
      codec: Codec.pcm16WAV,
    );
    StreamSubscription _recorderSubscription =
        _recordingSession.onProgress!.listen((e) {
      var date = DateTime.fromMillisecondsSinceEpoch(e.duration.inMilliseconds,
          isUtc: true);
      var timeText = DateFormat('mm:ss:SS', 'en_GB').format(date);
      setState(() {});
    });
    _recorderSubscription.cancel();
  }

  Future<String?> stopRecording() async {
    print("========================================СТОП ");
    _recordingSession.closeRecorder();
    return await _recordingSession.stopRecorder();
  }

  Future<void> playFunc() async {
    recordingPlayer.open(
      Audio.file(pathToAudio),
      autoStart: true,
      showNotification: true,
    );
  }

  Future<void> stopPlayFunc() async {
    recordingPlayer.stop();
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


  @override
  void initState() {
    super.initState();
    inhale=[true,true,true,true];
    _isCrossed[0]=false;
    _isCrossed[1]=false;
    _isCrossed[2]=false;
    _isCrossed[3]=false;
    initializer();
    SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    WidgetsBinding.instance.addPostFrameCallback((_) => wdthFunc(context));
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    inhale=[true,true,true,true];
    _timer.cancel();

    timerController1.stop();
    timerController2.stop();
    timerController3.stop();
    timerController4.stop();
    timerController1.reset();
    timerController2.reset();
    timerController3.reset();
    timerController4.reset();

    WidgetsBinding.instance.addPostFrameCallback((_) => wdthFunc(context));
    audioPlayer.stop();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return
        Stack(
          children: [
            Image.asset(
              "assets/images/bg.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
                body: SingleChildScrollView(child: Center(child:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 4),
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
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
                                child: GestureDetector(   onTap: (){Navigator.of(context).push(PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder: (BuildContext context, _, __) => SettingsPage()));},
                                  child: Image.asset(
                                    "assets/images/settings.jpg",
                                  ),
                                ))),
                      ],
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ? MediaQuery.of(context).size.width / 2:MediaQuery.of(context).size.width/5 ,

                        padding: EdgeInsets.only(right: 4, left: 4),
                        margin:(MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ? EdgeInsets.only(top: 12,): EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        child: Text(
                          "0:0$_remainingTime",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?40:28,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        )),
                    Container(
                      //width: MediaQuery.of(context).size.width-50,
                        margin: (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?EdgeInsets.only(bottom: 12, top: 12):EdgeInsets.only(bottom: 4, top: 4),
                        padding:
                        EdgeInsets.only(top: 2, bottom: 2, right: 6, left: 6),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(126, 157, 198, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Text(
                          "Режим чтения ${readingMode}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize:(MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ? 20:14,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        )),
                    Center(child:Container(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (indexLines) > lines.length - 1
                                ? Container()
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                inhale[0]
                                    ? Container(
                                    width: 10,
                                    child: Image.asset(
                                      "assets/images/arrowTop.png",
                                    ))
                                    : Container(
                                  width: 10,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                    MediaQuery.of(context).size.width /
                                        1.6,
                                  ),
                                  margin:
                                  EdgeInsets.only(right: 12, left: 2),
                                  padding: EdgeInsets.only(
                                      top: 1, bottom: 1, right: 6, left: 6),
                                  //  width: MediaQuery.of(context).size.width/1.5,

                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        key: _key1,
                                        constraints: BoxConstraints(
                                          maxWidth: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.6,
                                        ),
                                        child: readingMode == "2 строки"
                                            ?
                                        Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(bottom: 10),
                                                child:Text(
                                                  ((indexLines + 1) >
                                                      (lines.length - 1))
                                                      ? "${lines[indexLines]}"
                                                      : "${lines[indexLines]} ${lines?[indexLines + 1] ?? " "}",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 16),
                                                )),
                                            AnimatedLineThrough( reverseDuration: Duration(milliseconds: 100), color: _isCrossed[0]?Colors.indigo:Colors.transparent,
                                              duration: Duration(
                                                  milliseconds: (1000 *
                                                      initLineTime(
                                                          lines,
                                                          readingSpeed)[
                                                      indexLines +
                                                          0])
                                                      .toInt()),
                                              isCrossed: _isCrossed[0],
                                              strokeWidth: 2,
                                              child: Text(
                                                ((indexLines + 1) >
                                                    (lines.length - 1))
                                                    ? "${lines[indexLines]}"
                                                    : "${lines[indexLines]} ${lines?[indexLines + 1] ?? " "}",
                                                style: TextStyle(
                                                    color: Colors.transparent,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        )

                                            : Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(bottom: 10),
                                                child:Text(
                                                  lines[indexLines] ,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 16),
                                                )),
                                            AnimatedLineThrough(
                                              reverseDuration: Duration(milliseconds: 100),
                                              color: _isCrossed[0]?Colors.indigo:Colors.transparent,
                                              duration: Duration(
                                                  milliseconds: (1000 *
                                                      initLineTime(
                                                          lines,
                                                          readingSpeed)[
                                                      indexLines +
                                                          0])
                                                      .toInt()),
                                              isCrossed: _isCrossed[0],
                                              strokeWidth: 2,
                                              child: Text(
                                                lines[indexLines] ,
                                                style: TextStyle(
                                                    color: Colors.transparent,
                                                    fontWeight:
                                                    FontWeight.w700,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          width: wdth1,
                                          child: LinearTimer(
                                              onTimerStart: () {


                                              },
                                              backgroundColor:
                                              Colors.transparent,
                                              color: Colors.transparent,
                                              duration: Duration(
                                                  milliseconds: (1000 *
                                                      initLineTime(
                                                          lines,
                                                          readingSpeed)[
                                                      indexLines +
                                                          0])
                                                      .toInt()),
                                              controller: timerController1,
                                              onTimerEnd: () async{
                                                timerController1.stop();
                                                timerController1.reset();


                                                if (indexLines + 1 <=
                                                    lines.length - 1) {
                                                  inhale = [
                                                    false,
                                                    true,
                                                    true,
                                                    true
                                                  ];
                                                  await _sound();
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds:
                                                          1500), () {
                                                    inhale = [
                                                      false,
                                                      false,
                                                      true,
                                                      true
                                                    ];
                                                    setState(() {
                                                      wdthFunc(context);
                                                    });
                                                    timerController2
                                                        .start();
                                                    _isCrossed[1]=true;
                                                  });
                                                } else {
                                                  print("Закончили!");
                                                }
                                                setState(() {
                                                  wdthFunc(context);
                                                });
                                              })),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            (indexLines + 1) > lines.length - 1
                                ? Container()
                                : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                inhale[1]
                                    ? Container(
                                    width: 10,
                                    child: Image.asset(
                                      "assets/images/arrowTop.png",
                                    ))
                                    : Container(
                                  width: 10,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth:
                                    MediaQuery.of(context).size.width /
                                        1.6,
                                  ),
                                  margin:
                                  EdgeInsets.only(right: 12, left: 2),
                                  padding: EdgeInsets.only(
                                      top:1, bottom: 1, right: 6, left: 6),
                                  //  width: MediaQuery.of(context).size.width/1.5,

                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width:0.5,
                                    ),
                                    color: Color.fromRGBO(217, 217, 217, 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          key: _key2,
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                .size
                                                .width /
                                                1.6,
                                          ),
                                          child: readingMode == "2 строки"
                                              ?  Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10),
                                                  child:Text(
                                                    ((indexLines + 3) >
                                                        (lines.length -
                                                            1))
                                                        ? "${lines[indexLines + 2]} "
                                                        : "${lines[indexLines + 2]} ${lines?[indexLines + 3] ?? " "}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                        fontSize: 16),
                                                  )),
                                              AnimatedLineThrough(  reverseDuration: Duration(milliseconds: 100),color: _isCrossed[1]?Colors.indigo:Colors.transparent,
                                                duration: Duration(
                                                    milliseconds: (1000 *
                                                        initLineTime(
                                                            lines,
                                                            readingSpeed)[
                                                        indexLines +
                                                            1])
                                                        .toInt()),
                                                isCrossed: _isCrossed[1],
                                                strokeWidth: 2,
                                                child: Text(
                                                  ((indexLines + 3) >
                                                      (lines.length -
                                                          1))
                                                      ? "${lines[indexLines + 2]} "
                                                      : "${lines[indexLines + 2]} ${lines?[indexLines + 3] ?? " "}",
                                                  style: TextStyle(
                                                      color: Colors.transparent,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          )
                                              :  Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10),
                                                  child:Text(lines[indexLines + 1],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 16))),
                                              AnimatedLineThrough(  reverseDuration: Duration(milliseconds: 100),color: _isCrossed[1]?Colors.indigo:Colors.transparent,
                                                  duration: Duration(
                                                      milliseconds: (1000 *
                                                          initLineTime(
                                                              lines,
                                                              readingSpeed)[
                                                          indexLines +
                                                              1])
                                                          .toInt()),
                                                  isCrossed: _isCrossed[1],
                                                  strokeWidth: 2,
                                                  child: Text(lines[indexLines + 1],
                                                      style: TextStyle(
                                                          color: Colors.transparent,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 16))
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: wdth2,
                                          child: LinearTimer(
                                            // forward: false,
                                              backgroundColor:
                                              Colors.transparent,
                                              color: Colors.transparent,
                                              duration: Duration(
                                                  milliseconds: (1000 *
                                                      initLineTime(
                                                          lines,
                                                          readingSpeed)[
                                                      indexLines +
                                                          1])
                                                      .toInt()),
                                              controller: timerController2,
                                              onTimerEnd: ()async {
                                                timerController2.stop();
                                                timerController2.reset();

                                                if (indexLines + 2 <=
                                                    lines.length - 1) {
                                                  if (readingMode !=
                                                      "2 строки") {
                                                    inhale = [
                                                      false,
                                                      false,
                                                      true,
                                                      true
                                                    ];
                                                    await _sound();
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                            1500), () {
                                                      inhale = [
                                                        false,
                                                        false,
                                                        false,
                                                        true
                                                      ];
                                                      setState(() {
                                                        wdthFunc(context);
                                                      });
                                                      timerController3
                                                          .start();
                                                      _isCrossed[2]=true;
                                                    });
                                                  } else {
                                                    if (indexLines + 4 <=
                                                        lines.length - 1) {
                                                      indexLines =
                                                          indexLines + 4;
                                                      setState(() {
                                                        wdthFunc(context);
                                                      });
                                                      _isCrossed[0]=false;
                                                      _isCrossed[1]=false;
                                                      inhale = [
                                                        true,
                                                        true,
                                                        false,
                                                        false
                                                      ];
                                                      await _sound();
                                                      Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                              1500),
                                                              () {
                                                            inhale = [
                                                              false,
                                                              true,
                                                              false,
                                                              false
                                                            ];
                                                            setState(() {
                                                              wdthFunc(context);
                                                            });
                                                            timerController1
                                                                .start();
                                                            _isCrossed[0]=true;
                                                          });
                                                    }
                                                  }
                                                } else {
                                                  print("Закончили!");
                                                }
                                                setState(() {
                                                  wdthFunc(context);
                                                });
                                              })),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            (indexLines + 2) > lines.length - 1
                                ? Container()
                                : readingMode == "2 строки"
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                inhale[2]
                                    ? Container(
                                    width: 10,
                                    child: Image.asset(
                                      "assets/images/arrowTop.png",
                                    ))
                                    : Container(
                                  width: 10,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context)
                                        .size
                                        .width /
                                        1.6,
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 12, left: 2),
                                  padding: EdgeInsets.only(
                                      top: 1,
                                      bottom: 1,
                                      right: 6,
                                      left: 6),
                                  //  width: MediaQuery.of(context).size.width/1.5,

                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: Color.fromRGBO(
                                        217, 217, 217, 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          key: _key3,
                                          constraints: BoxConstraints(
                                            maxWidth:
                                            MediaQuery.of(context)
                                                .size
                                                .width /
                                                1.6,
                                          ),
                                          child:  Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10),
                                                  child:Text(
                                                      lines[indexLines + 2],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 16))),
                                              AnimatedLineThrough(  reverseDuration: Duration(milliseconds: 100),color: _isCrossed[2]?Colors.indigo:Colors.transparent,
                                                  duration: Duration(
                                                      milliseconds: (1000 *
                                                          initLineTime(
                                                              lines,
                                                              readingSpeed)[
                                                          indexLines +
                                                              2])
                                                          .toInt()),
                                                  isCrossed: _isCrossed[2],
                                                  strokeWidth: 2,
                                                  child: Text(
                                                      lines[indexLines + 2],
                                                      style: TextStyle(
                                                          color: Colors.transparent,
                                                          fontWeight:
                                                          FontWeight.w700,
                                                          fontSize: 16))
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: wdth3,
                                          child: LinearTimer(
                                              onTimerStart: () {},
                                              backgroundColor:
                                              Colors.transparent,
                                              color: Colors.transparent,
                                              duration: Duration(
                                                  milliseconds: (1000 *
                                                      initLineTime(
                                                          lines,
                                                          readingSpeed)[
                                                      indexLines +
                                                          2])
                                                      .toInt()),
                                              controller:
                                              timerController3,
                                              onTimerEnd: () async{
                                                timerController3.stop();
                                                timerController3
                                                    .reset();


                                                if (indexLines + 3 <=
                                                    lines.length - 1) {
                                                  inhale = [
                                                    false,
                                                    false,
                                                    false,
                                                    true
                                                  ];
                                                  await _sound();
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds:
                                                          1500),
                                                          () {
                                                        inhale = [
                                                          false,
                                                          false,
                                                          false,
                                                          false
                                                        ];
                                                        setState(() {
                                                          wdthFunc(context);
                                                        });
                                                        timerController4
                                                            .start();
                                                        _isCrossed[3]=true;
                                                      });
                                                } else {
                                                  print("Закончили!");
                                                }
                                                setState(() {
                                                  wdthFunc(context);
                                                });
                                              })),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            (indexLines + 3) > lines.length - 1
                                ? Container()
                                : readingMode == "2 строки"
                                ? Container()
                                : Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                inhale[3]
                                    ? Container(
                                    width: 10,
                                    child: Image.asset(
                                      "assets/images/arrowTop.png",
                                    ))
                                    : Container(
                                  width: 10,
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context)
                                        .size
                                        .width /
                                        1.6,
                                  ),
                                  margin: EdgeInsets.only(
                                      right: 12, left: 2),
                                  padding: EdgeInsets.only(
                                      top:1,
                                      bottom: 1,
                                      right: 6,
                                      left: 6),
                                  //  width: MediaQuery.of(context).size.width/1.5,

                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: Color.fromRGBO(
                                        217, 217, 217, 1),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          key: _key4,
                                          constraints: BoxConstraints(
                                            maxWidth:
                                            MediaQuery.of(context)
                                                .size
                                                .width /
                                                1.6,
                                          ),
                                          child:  Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(bottom: 10),
                                                  child:Text(
                                                    lines[indexLines + 3],
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 16,
                                                    ),
                                                  )),
                                              AnimatedLineThrough(  reverseDuration: Duration(milliseconds: 100),color: _isCrossed[3]?Colors.indigo:Colors.transparent,
                                                  duration: Duration(
                                                      milliseconds: (1000 *
                                                          initLineTime(
                                                              lines,
                                                              readingSpeed)[
                                                          indexLines +
                                                              3])
                                                          .toInt()),
                                                  isCrossed: _isCrossed[3],
                                                  strokeWidth: 2,
                                                  child: Text(
                                                    lines[indexLines + 3],
                                                    style: TextStyle(
                                                      color: Colors.transparent,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 16,
                                                    ),
                                                  )
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: wdth4,
                                          child: LinearTimer(
                                              backgroundColor:
                                              Colors.transparent,
                                              color: Colors.transparent,
                                              duration: Duration(
                                                  milliseconds: (1000 *
                                                      initLineTime(
                                                          lines,
                                                          readingSpeed)[
                                                      indexLines +
                                                          3])
                                                      .toInt()),
                                              controller:
                                              timerController4,
                                              onTimerEnd: () async {
                                                timerController4.stop();
                                                timerController4
                                                    .reset();
                                                _isCrossed[0]=false;
                                                _isCrossed[1]=false;
                                                _isCrossed[2]=false;
                                                _isCrossed[3]=false;

                                                if (indexLines + 4 <=
                                                    lines.length - 1) {
                                                  indexLines =
                                                      indexLines + 4;
                                                  setState(() {
                                                    wdthFunc(context);
                                                  });
                                                  inhale = [
                                                    true,
                                                    true,
                                                    true,
                                                    true
                                                  ];
                                                  await _sound();
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds:
                                                          1500),
                                                          () {
                                                        inhale = [
                                                          false,
                                                          true,
                                                          true,
                                                          true
                                                        ];
                                                        setState(() {
                                                          wdthFunc(context);
                                                        });
                                                        timerController1
                                                            .start();
                                                        _isCrossed[0]=true;
                                                      });
                                                } else {
                                                  print("Закончили!");
                                                }
                                                setState(() {
                                                  wdthFunc(context);
                                                });
                                              }))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ))),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () async {
                              isRecord = !isRecord;

                              /*  if (indexLines + 4 <= lines.length - 1) {
                          indexLines = indexLines + 4;
                        } else {
                          print("Закончили!");
                        }*/
                              setState(() {});
                            },
                            child: Container(
                                width: (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?MediaQuery.of(context).size.width / 2.5:MediaQuery.of(context).size.width / 5,
                                margin: (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?EdgeInsets.only(bottom: 22, top: 48):EdgeInsets.only(bottom: 2, top: 4),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(217, 217, 217, 0.81),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(12),
                                      bottomLeft: Radius.circular(12)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?EdgeInsets.only(
                                          left:
                                          (MediaQuery.of(context).size.width /
                                              2.5) /
                                              4,
                                          right: 16):EdgeInsets.only(
                                          left:
                                          12,
                                          right: 16),
                                      child: Text(
                                        "Запись",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                            fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color.fromRGBO(217, 217, 217, 1),
                                          width: 3,
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            topLeft: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                            bottomLeft: Radius.circular(12)),
                                      ),
                                      child: isRecord
                                          ? Image.asset(
                                        "assets/images/check.png",
                                      )
                                          : Container(),
                                    )
                                  ],
                                ))),Spacer(),

                      ],
                    ),
                    Container(

                        width: 120,
                        padding: EdgeInsets.only(right: 12, left: 12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(54, 103, 166, 1),
                            width: 3,
                          ),
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        child: Center(
                            child: TextField(
                              onChanged: (speed) async {
                                var dott = await pref
                                    .getStringList("${items![selectIndex]}_info")!;
                                dott[2] = speed;
                                await pref.setStringList(
                                    '${items![selectIndex]}_info', dott);
                              },
                              readOnly: _isStart ? true : false,
                              textAlign: TextAlign.center,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              controller: readingSpeedController,
                              decoration: InputDecoration(
                                hintText: "",
                                counterText: "",
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  color: Color.fromRGBO(54, 103, 166, 1),
                                  fontSize:(MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ? 40:24,
                                  fontWeight: FontWeight.w800),
                            ))
                      /*Text(
                    "90",
                    style: TextStyle(
                        color: Color.fromRGBO(54, 103, 166, 1),
                        fontSize:40,
                        fontWeight: FontWeight.w800),
                    textAlign: TextAlign.center,
                  )*/
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () async {
                              if (_isStart == false) {
                                readingSpeed--;
                                var dott = await pref.getStringList(
                                    "${items![selectIndex]}_info")!;
                                dott[2] = readingSpeed.toString();
                                await pref.setStringList(
                                    '${items![selectIndex]}_info', dott);
                                setState(() {});
                                readingSpeedController.text =
                                    readingSpeed.toString();
                                setState(() {});
                              }
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
                            onPressed: () async {
                              if (_isStart == false) {
                                readingSpeed++;
                                var dott = await pref.getStringList(
                                    "${items![selectIndex]}_info")!;
                                dott[2] = readingSpeed.toString();
                                await pref.setStringList(
                                    '${items![selectIndex]}_info', dott);
                                setState(() {});
                                readingSpeedController.text =
                                    readingSpeed.toString();
                                setState(() {});
                              }
                            },
                            icon: Icon(
                              Icons.add_circle,
                              color: Colors.green,
                              size: 36,
                            )),
                      ],
                    ),
                    GestureDetector(
                        onTap: () async {
                          _isStart = !_isStart;
                          if (_isStart == true) {
                            if (isRecord) {
                              startRecording();
                            }
                            print(
                                "Меняем====================================================================$_isStart");
                            this.setState(() {});
                            _startTimer();
                            Future.delayed(const Duration(milliseconds: 5000),
                                    () async {
                                  initLineTime(lines, readingSpeed);
                                  inhale = [true, true, true, true];
                                  await _sound();
                                  Future.delayed(const Duration(milliseconds: 1500),
                                          () {
                                        inhale = [false, true, true, true];
                                        _isCrossed=[true, false, false, false];
                                        setState(() {});
                                        timerController1.start();
                                        _isCrossed[0]=true;
                                      });
                                });
                          } else {
                            audioPlayer.stop();
                            if (isRecord) {
                              stopRecording();
                              var mode;
                              if (readingMode == "2 строки") {
                                mode = 2;
                              } else {
                                mode = 1;
                              }
                              var ddd = await pref
                                  .getStringList('${items[selectIndex]}_res');
                              ddd?.add(pathToAudio);
                              await pref.setStringList(
                                  '${items[selectIndex]}_res', ddd!);

                              print(
                                  "${await pref.getStringList('${items[selectIndex]}_res')}=========================================HTPSSSSSSSSSSSSSSSSSS=");
                              await pref.setStringList(
                                pathToAudio,
                                <String>[
                                  "${DateFormat.yMd().format(DateTime.now())}",
                                  "${mode}/${readingSpeed}",
                                ],
                              );
                            }
                            inhale = [false, false, false, false];
                            _isCrossed = [false, false, false, false];
                            timerController1.stop();
                            timerController2.stop();
                            timerController3.stop();
                            timerController4.stop();
                            setState(() {
                              _isStart = !_isStart;
                            });
                            items.clear();
                            items = await pref.getStringList('2-4 года') ?? [];
                            items.addAll(
                                await pref.getStringList('4-5 лет') ?? []);
                            items.addAll(
                                await pref.getStringList('1 класс') ?? []);
                            items.addAll(
                                await pref.getStringList('2 класс') ?? []);
                            items.addAll(
                                await pref.getStringList('3 класс') ?? []);
                            items.addAll(
                                await pref.getStringList('4 класс') ?? []);
                            items.addAll(
                                await pref.getStringList('>11 лет') ?? []);
                            items
                                .addAll(await pref.getStringList('my_lib') ?? []);

                            text_autor = [];
                            text_titles = [];
                            for (var i = 0; i < items.length; i++) {
                              var dott =
                              await pref.getStringList("${items[i]}_info");
                              text_titles.add(dott![0]);
                              text_autor.add(dott[1]);
                            }
                            print(items);

                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) => ResultPage()));
                          }
                        },
                        child: Container(
                          width:  (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?MediaQuery.of(context).size.width / 1.5:MediaQuery.of(context).size.width / 4,
                          margin:  (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?EdgeInsets.only(
                              top: 4, bottom: 4
                          ):EdgeInsets.only(top: 1, bottom: 1),
                          padding:  (MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) ?EdgeInsets.only(top: 12, bottom: 12):EdgeInsets.only(top: 2, bottom: 2),
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


                  ],
                ))),),
          ],
        );

          // This trailing comma makes auto-formatting nicer for build methods.

  }
  AudioPlayer audioPlayer = AudioPlayer();

   _sound()async{
    audioPlayer.setPlayerMode(PlayerMode.lowLatency);
    await Future.delayed(const Duration(milliseconds: 70));

    await audioPlayer.play(AssetSource('01.ogg'));
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
    await Future.delayed(const Duration(milliseconds: 70));


  }
}
