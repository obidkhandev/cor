import 'dart:async';

import 'package:animated_line_through/animated_line_through.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cor/AboutPage.dart';
import 'package:cor/BreathingTrainingPage.dart';
import 'package:cor/ManualPage.dart';
import 'package:cor/Pref.dart';
import 'package:cor/ResultPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/settings.dart';
import 'package:cor/trening_dixaniya_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

late SharedPreferences pref;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Коррекция речи',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(33, 150, 82, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Коррекция речи'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initBD();
  }

  bool _isCrossed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) =>
                                      const SettingsPage()));
                            },
                            child: Image.asset(
                              "assets/images/settings.jpg",
                            ),
                          ))),
                  Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.width / 3.5,
                      // margin: EdgeInsets.only(bottom:12),
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Image.asset(
                        "assets/images/logo.png",
                      )),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      // margin: EdgeInsets.only(bottom:12),
                      // padding: EdgeInsets.only(top:6,bottom: 6),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.75),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            'Чтение на 5+',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 82, 204, 1),
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            '•Логопедам,\n•Дефектологом \n•И всем, всем, всем!!!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )),
                  const Spacer(
                    flex: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            const ManualPage()));
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                height: MediaQuery.of(context).size.height / 11,
                                margin: const EdgeInsets.only(
                                    bottom: 12, left: 24, right: 24),
                                padding:
                                    const EdgeInsets.only(top: 6, bottom: 6),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(47, 128, 237, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Инструкция",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                )),
                              )),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            const TreningDixaniyaPicker()
                                  ),
                                );
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                height: MediaQuery.of(context).size.height / 11,
                                margin: const EdgeInsets.only(
                                    bottom: 12, left: 24, right: 24),
                                padding:
                                    const EdgeInsets.only(top: 6, bottom: 6),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(234, 87, 87, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Тренинг\nдыхания",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                )),
                              ))
                        ],
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    const TextPage()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            height: MediaQuery.of(context).size.height / 5,
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(33, 150, 83, 1),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: const Center(
                                child: Text(
                              "Чтение\n(корреция\nречи)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800),
                            )),
                          )),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                const AboutPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        margin: const EdgeInsets.only(top: 12, bottom: 40),
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 82, 204, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: const Center(
                            child: Text(
                          "О методе",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800),
                        )),
                      )),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  AudioPlayer audioPlayer = AudioPlayer();

  void _sound() async {
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
