import 'package:cor/BreathingTrainingPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ChoiceTextPage.dart';

class TreningDixaniyaPicker extends StatefulWidget {
  const TreningDixaniyaPicker({super.key});

  @override
  State<TreningDixaniyaPicker> createState() => _TreningDixaniyaPickerState();
}


List<bool> _isSelectAge = [false, false, false, false, false, false, false];

class _TreningDixaniyaPickerState extends State<TreningDixaniyaPicker> {
  num selectAge = 0;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
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
                                  Navigator.pop(context);
                                  _isSelectAge = [false, false, false, false, false, false, false];

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
                          child: Image.asset(
                            "assets/images/settings.jpg",
                          ),
                        ),
                      ),
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
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              _buildAgeSelectionContainer("Возраст"),
                              _buildAgeOption(">20 лет", 0, 8),
                              _buildAgeOption("14-19 лет", 1, 9),
                              _buildAgeOption("11-13 лет", 2, 10),
                              _buildAgeOption("9-10 лет", 3, 11),
                              _buildAgeOption("6-8 лет", 4, 12),
                              _buildAgeOption("4-5 лет", 5, 14),
                            ],
                          ),
                          Column(
                            children: [
                              _buildAgeSelectionContainer(
                                  "Ритм дыхание в минуту"),
                              _buildAgeOption("8", 0, 8),
                              _buildAgeOption("9", 1, 9),
                              _buildAgeOption("10", 2, 10),
                              _buildAgeOption("11", 3, 11),
                              _buildAgeOption("12", 4, 12),
                              _buildAgeOption("14", 5, 14),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 34,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        "Вибере возврат",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  GestureDetector(
                      onTap: () async {
                        print(selectAge.toString() + "Hello select age");
                        text_titles = [];
                        text_autor = [];
                        selectIndex = -1;

                        if (true) {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  BreathingTrainingPage(
                                breathindSpeed: selectAge == 0? 10 : selectAge,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        margin: EdgeInsets.only(
                          top: 12,
                        ),
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
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
                          "Далее",
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

  Widget _buildAgeSelectionContainer(String text) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      height: (MediaQuery.of(context).size.height / 2) / 8,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        color: Color.fromRGBO(3, 29, 86, 1),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAgeOption(String text, int index, int age) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelectAge = [false, false, false, false, false, false, false];
          _isSelectAge[index] = true;
          selectAge = age;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3,
        height: (MediaQuery.of(context).size.height / 2) / 8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          color: _isSelectAge[index]
              ? Colors.white
              : Color.fromRGBO(54, 104, 167, 1),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: _isSelectAge[index] ? Colors.green : Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
