import 'package:cor/ReadingPage.dart';
import 'package:cor/main.dart';
import 'package:cor/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'ChoiceTextPage.dart';
import 'TextPage.dart';

class ReadingModePage extends StatefulWidget {
  const ReadingModePage({Key? key}) : super(key: key);

  @override
  State<ReadingModePage> createState() => _ReadingModePageState();
}

String readingMode = "1 строка";

TextEditingController readingSpeedController = TextEditingController();

class _ReadingModePageState extends State<ReadingModePage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                      //width: MediaQuery.of(context).size.width-50,
                      margin: EdgeInsets.only(bottom: 22),
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
                        "Автор\nНазвание",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: 8, bottom: 12, left: 16, right: 16),
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(54, 103, 166, 0.64),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(bottom: 12),
                            child: Text(
                              "Режим чтения",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  readingMode = '1 строка';
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(217, 217, 217, 0.36),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                    border: Border.all(
                                      color: readingMode == "1 строка"
                                          ? Color.fromRGBO(43, 208, 49, 1)
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                  child: Text(
                                    "1 строка",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            GestureDetector(
                                onTap: () {
                                  readingMode = '2 строки';
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(217, 217, 217, 0.36),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                    border: Border.all(
                                      color: readingMode == "2 строки"
                                          ? Color.fromRGBO(43, 208, 49, 1)
                                          : Colors.transparent,
                                      width: 3,
                                    ),
                                  ),
                                  child: Text(
                                    "2 строки",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                      //width: MediaQuery.of(context).size.width-50,
                      margin: EdgeInsets.only(bottom: 24),
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
                        "Скорость чтения в слогах в минуту",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                      //width: MediaQuery.of(context).size.width-50,
                      margin: EdgeInsets.only(bottom: 16),
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
                        "Установка скорости чтения",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
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
                            fontSize: 40,
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
                          onPressed: () async{
                            readingSpeed--;
                            readingSpeedController.text =
                                readingSpeed.toString();

                            var dott = await pref.getStringList(
                                "${items![selectIndex]}_info")!;
                            dott[2]=readingSpeed.toString();
                            await pref.setStringList('${items![selectIndex]}_info', dott);
                            setState(() {});
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
                          onPressed: ()async {
                            readingSpeed++;
                            var dott = await pref.getStringList(
                                "${items![selectIndex]}_info")!;
                            dott[2]=readingSpeed.toString();
                            await pref.setStringList('${items![selectIndex]}_info', dott);
                            setState(() {});
                            readingSpeedController.text =
                                readingSpeed.toString();
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.green,
                            size: 36,
                          )),
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                      onTap: () {
                        indexLines = 0;
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                ReadingPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        margin: EdgeInsets.only(
                          top: 12,
                        ),
                        padding: EdgeInsets.only(top: 12, bottom: 12),
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
                          "Чтение",
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
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
