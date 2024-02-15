import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({Key? key}) : super(key: key);

  @override
  State<ManualPage> createState() => _ManualPageState();
}




class _ManualPageState extends State<ManualPage> {

  @override
void initState(){
  super.initState();
  SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 246, 202, 1),
      body:Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 8,),
      Row(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [


          GestureDetector(
              onTap: (){},
              child:Container(
                width: MediaQuery.of(context).size.width/2,
                margin: EdgeInsets.only(top:0,bottom: 0),
                padding: EdgeInsets.only(top:12,bottom: 12),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(0, 82, 204, 1),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                ),
                child: Center(child:Text("Инструкция", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),)),
              )),Padding(
              padding: EdgeInsets.only(left: 0),
              child:GestureDetector(
              onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) => MyHomePage(title: 'Коррекция речи')));},
              child:Icon(Icons.clear, color: Colors.grey,size: 42,))),
        ],
      ),
                Row(
                  children: [Spacer(),
                    Container(
                                   width: MediaQuery.of(context).size.width/2.5,
                      margin: EdgeInsets.only(top:12,bottom: 0, ),
                      padding: EdgeInsets.only(top:12,bottom: 12),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(234, 87, 87, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Center(child:Text("Тренинг\nдыхания", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),)),
                    ),Spacer(),
                  ],
                ),


      Padding(
          padding:EdgeInsets.only(top: 24,bottom:8,left: 12,right: 12 ) ,
          child:   Text("Установи ритм речевого дыхания. Нажми кнопку “Начать” и тренируй речевое дыхание",textAlign: TextAlign.center,
            style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
      Container(margin: EdgeInsets.only(bottom: 8),
          height: 250,
          child:Image.asset(
        "assets/images/manual_1.png",
      )),

      Container(
        width: MediaQuery.of(context).size.width-50,
        height: 3,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 82, 204, 1),

        ),
      ),
      Padding(
          padding:EdgeInsets.only(top: 8,bottom:8 ,left: 12,right: 12) ,
          child: Text("Вдох - вертикальная красная стрелка (или звук).\nВыдох - синяя полоса.\nВдох - живот округляется.\nВыдох - живот втягивается.\nДыши животом без усилий.",textAlign: TextAlign.center,
            style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 250,
                    child:Image.asset(
                      "assets/images/manual_2.png",
                    )),
      Container(

        width: MediaQuery.of(context).size.width-50,
        height: 3,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 82, 204, 1),

        ),
      ),

                Row(
                  children: [Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width/2.5,
                      margin: EdgeInsets.only(top:12,bottom: 0, ),
                      padding: EdgeInsets.only(top:12,bottom: 12),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(33, 150, 82, 1),

                      ),
                      child: Center(child:Text("Чтение", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),)),
                    ),Spacer(),
                  ],
                ),

      Padding(
          padding:EdgeInsets.only(top: 8,bottom:8 ) ,
          child: Text("Выбери возраст тренирующегося или открой “Моя библиотека”",textAlign: TextAlign.center,
            style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 180,
                    child:Image.asset(
                      "assets/images/manual_3.png",
                    )),
      Container(
        width: MediaQuery.of(context).size.width-50,
        height: 3,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 82, 204, 1),

        ),
      ),
      Padding(
          padding:EdgeInsets.only(top: 8,bottom:8,left: 12,right: 12 ) ,
          child: Text("Выбери текст для чтения",textAlign: TextAlign.center,
            style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 300,
                    child:Image.asset(
                      "assets/images/manual_4.png",
                    )),
                Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 82, 204, 1),

                  ),
                ),
      Padding(
          padding:EdgeInsets.only(top: 8,bottom:8 ,left: 12,right: 12) ,
          child: Text("Выбери режим чтения по 1 или 2 строчки Установи скорость чтения в слогах в минуту",textAlign: TextAlign.center,
            style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),

                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 300,
                    child:Image.asset(
                      "assets/images/manual_4.png",
                    )),

                Padding(
                    padding:EdgeInsets.only(top: 8,bottom:8 ,left: 12,right: 12) ,
                    child: Text("Перейди в режим чтения",textAlign: TextAlign.center,
                      style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
                Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 82, 204, 1),

                  ),
                ),
                Padding(
                    padding:EdgeInsets.only(top: 8,bottom:8 ,left: 12,right: 12) ,
                    child: Text("Нажми запись голоса. Начинай читать.",textAlign: TextAlign.center,
                      style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 300,
                    child:Image.asset(
                      "assets/images/manual_4.png",
                    )),
                Container(
                  width: MediaQuery.of(context).size.width-50,
                  height: 3,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 82, 204, 1),

                  ),
                ),

                Row(
                  children: [Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      margin: EdgeInsets.only(top:12,bottom: 0, ),
                      padding: EdgeInsets.only(top:12,bottom: 12),
                      decoration: const BoxDecoration(
                        color:Color.fromRGBO(0, 82, 204, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Center(child:Text("Сводная таблица\nрезультатов", textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),)),
                    ),Spacer(),
                  ],
                ),

                Padding(
                    padding:EdgeInsets.only(top: 8,bottom:8 ,left: 12,right: 12) ,
                    child: Text("Выбери произведение",textAlign: TextAlign.center,
                      style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 300,
                    child:Image.asset(
                      "assets/images/manual_4.png",
                    )),
                Padding(
                    padding:EdgeInsets.only(top: 8,bottom:8 ,left: 12,right: 12) ,
                    child: Text("Прослушай",textAlign: TextAlign.center,
                      style: TextStyle(fontWeight:FontWeight.w700 ,fontSize:20 ),)),
                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 300,
                    child:Image.asset(
                      "assets/images/manual_4.png",
                    )),
                Container(margin: EdgeInsets.only(bottom: 8),
                    height: 300,
                    child:Image.asset(
                      "assets/images/manual_4.png",
                    )),




      Spacer(flex: 1,),
      SizedBox(height: 100, child: Image.asset("assets/images/logo.png")),

              ],)),
    );
  }
}
