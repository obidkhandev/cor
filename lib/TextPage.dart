import 'package:cor/ChoiceTextPage.dart';
import 'package:cor/MyLibraryPage.dart';
import 'package:cor/Pref.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}
 List<String> items=[];
List<String> text_titles=[];
List<String> text_autor=[];


List<bool> _isSelectAge = [false, false, false, false, false, false, false];
 String selectAge='';

class _TextPageState extends State<TextPage> {
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
                              child: GestureDetector(onTap: (){Navigator.pop(context);},
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
                                child: Image.asset(
                                  "assets/images/settings.jpg",
                                ),
                              ))),
                    ],
                  ),
                  Container(
                      //width: MediaQuery.of(context).size.width-50,
                      // margin: EdgeInsets.only(bottom:12),
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
                        "Выбор текстов",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 24),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 2,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height:
                                  (MediaQuery.of(context).size.height / 2) / 8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                color: Color.fromRGBO(3, 29, 86, 1),
                              ),
                              child: Center(
                                  child: Text(
                                "Возраст",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.center,
                              )),
                            ),
                            GestureDetector(
                                onTap: () {
                                  _isSelectAge = [
                                    true,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                  selectAge = "2-4 года";
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      (MediaQuery.of(context).size.height / 2) /
                                          8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: _isSelectAge[0]
                                        ? Colors.white
                                        : Color.fromRGBO(54, 104, 167, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "2-4 года",
                                    style: TextStyle(
                                        color: _isSelectAge[0]
                                            ?Colors.green
                                            :Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _isSelectAge = [
                                    false,
                                    true,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                  selectAge="4-5 лет";
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      (MediaQuery.of(context).size.height / 2) /
                                          8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: _isSelectAge[1]
                                        ? Colors.white
                                        : Color.fromRGBO(54, 104, 167, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "4-5 лет",
                                    style: TextStyle(
                                        color: _isSelectAge[1]
                                            ?Colors.green
                                            :Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _isSelectAge = [
                                    false,
                                    false,
                                    true,
                                    false,
                                    false,
                                    false,
                                    false
                                  ];
                                  selectAge="1 класс";
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      (MediaQuery.of(context).size.height / 2) /
                                          8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: _isSelectAge[2]
                                        ? Colors.white
                                        : Color.fromRGBO(54, 104, 167, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "1 класс",
                                    style: TextStyle(
                                        color: _isSelectAge[2]
                                            ?Colors.green
                                            :Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _isSelectAge = [
                                    false,
                                    false,
                                    false,
                                    true,
                                    false,
                                    false,
                                    false
                                  ];
                                  selectAge="2 класс";
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      (MediaQuery.of(context).size.height / 2) /
                                          8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: _isSelectAge[3]
                                        ? Colors.white
                                        : Color.fromRGBO(54, 104, 167, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "2 класс",
                                    style: TextStyle(
                                        color: _isSelectAge[3]
                                            ?Colors.green
                                            :Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _isSelectAge = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    true,
                                    false,
                                    false
                                  ];
                                  selectAge="3 класс";
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      (MediaQuery.of(context).size.height / 2) /
                                          8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: _isSelectAge[4]
                                        ? Colors.white
                                        : Color.fromRGBO(54, 104, 167, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "3 класс",
                                    style: TextStyle(
                                        color: _isSelectAge[4]
                                            ?Colors.green
                                            :Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _isSelectAge = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    true,
                                    false
                                  ];
                                  selectAge="4 класс";
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      (MediaQuery.of(context).size.height / 2) /
                                          8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                   color: _isSelectAge[5]
                                        ? Colors.white
                                        : Color.fromRGBO(54, 104, 167, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "4 класс",
                                    style: TextStyle(
                                       color: _isSelectAge[5]
                                            ?Colors.green
                                            :Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                                )),
                            GestureDetector(
                                onTap: () {
                                  _isSelectAge = [
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    false,
                                    true
                                  ];
                                  selectAge=">11 лет";
                                  setState(() {});
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height:
                                      (MediaQuery.of(context).size.height / 2) /
                                          8,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color: _isSelectAge[6]
                                        ? Colors.white
                                        : Color.fromRGBO(54, 104, 167, 1),
                                  ),
                                  child: Center(
                                      child: Text(
                                    ">11 лет",
                                    style: TextStyle(
                                        color: _isSelectAge[6]
                                        ?Colors.green
                                            :Colors.white,
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.center,
                                  )),
                                )),
                          ],
                        ),
                      )),
                  GestureDetector(
                      onTap: () async{
                        text_autor=[];
                        text_titles=[];
                        items = await pref.getStringList("my_lib")?? [];
                        for(var i = 0; i < items!.length; i++){
                          var dott = await pref.getStringList("${items![i]}_info");
                          text_titles.add(dott![0]);
                          text_autor.add(dott[1]);
                        }
                        Navigator.of(context).push(PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                MyLibraryPage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 34,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          color: Color.fromRGBO(54, 104, 167, 1),
                        ),
                        child: Center(
                            child: Text(
                          "Моя библиотека",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        )),
                      )),
                  Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                      onTap: () async{
                        text_titles=[];
                        text_autor=[];
                        selectIndex = -1;



                        if(selectAge!=""){
                          items = (await pref.getStringList(selectAge))!;

                          for(var i = 0; i < items.length; i++){
                              var dott = await pref.getStringList("${items[i]}_info");
                              text_titles.add(dott![0]);
                              text_autor.add(dott[1]);
                          }


                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  ChoiceTextPage()));
                        }
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
                          "Выбор текста",
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
}
