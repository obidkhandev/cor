import 'package:cor/BreathingTrainingPage.dart';
import 'package:cor/ManualPage.dart';
import 'package:cor/Pref.dart';
import 'package:cor/ResultPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
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
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(33, 150, 82, 1)),
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
                  Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) => SettingsPage()));

                            },
                            child: Image.asset(
                              "assets/images/settings.jpg",
                            ),
                          ))),
                  Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.width / 3.5,
                      // margin: EdgeInsets.only(bottom:12),
                      padding: EdgeInsets.only(left: 14, right: 14),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Image.asset(
                        "assets/images/logo.png",
                      )),
                  Spacer(
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
                      child: Text(
                        "Коррекция\n речи",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize: 36,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      )),
                  Spacer(
                    flex: 3,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
/*
                            Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) => LetterPage()));*/
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                height: MediaQuery.of(context).size.height / 11,
                                margin: EdgeInsets.only(
                                    bottom: 12, left: 24, right: 24),
                                padding: EdgeInsets.only(top: 6, bottom: 6),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(47, 128, 237, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Center(
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
                                Navigator.of(context).push(PageRouteBuilder(
                                    opaque: false,
                                    pageBuilder:
                                        (BuildContext context, _, __) =>
                                            BreathingTrainingPage()));
                              },
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                height: MediaQuery.of(context).size.height / 11,
                                margin: EdgeInsets.only(
                                    bottom: 12, left: 24, right: 24),
                                padding: EdgeInsets.only(top: 6, bottom: 6),
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(234, 87, 87, 1),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10)),
                                ),
                                child: Center(
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
                                    TextPage()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            height: MediaQuery.of(context).size.height / 5,
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.only(top: 6, bottom: 6),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(33, 150, 83, 1),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Center(
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
                      onTap: () {Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => ManualPage()));},
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        margin: EdgeInsets.only(top: 12, bottom: 40),
                        padding: EdgeInsets.only(top: 12, bottom: 12),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 82, 204, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(
                            child: Text(
                          "О методе",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
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
}
