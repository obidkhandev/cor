import 'package:flutter/material.dart';

import 'main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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

                  Spacer(flex: 2,),
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
                        child: Center(child:Text("О Методе", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.w800),)),
                      )),Padding(
                      padding: EdgeInsets.only(left: 0),
                      child:GestureDetector(
                          onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) => MyHomePage(title: 'Коррекция речи')));},
                          child:Icon(Icons.clear, color: Colors.grey,size: 42,))),Spacer(flex: 1,)
                ],
              ),


              Padding(
                  padding:EdgeInsets.only(top: 24,bottom:8,left: 12,right: 12 ) ,
                  child:   Text("Дыши животом без усилий.\nВдох - живот округляется.\nВыдох- живот втягивается.\nЧитай только на выдохе.\n\nУстанови удобную для тебя\nскорость чтения в слогах в минуту.\nТренируйся чтению без уcилий.\nна выбранной скорости.\n\nУчись разбивать текст на выдохи.\nГлавное - читай равномерно\nи без усилий.\n\nПостепенно усложняй тексты\nдля чтения.\nСледуй рекомендациям\nспециалистов голоса и речи.\n\nЖелаю успехов на пути\nк правильной и красивой речи!\n\nАвтор метода\nСметанкин Александр Афанасьевич.\n\nБольше информации на\nсайте производителя\nhttps://biosvyaz.com/",
                   textAlign: TextAlign.center,
                    style: TextStyle(fontWeight:FontWeight.w900 ,fontSize:20 ),)),







              Spacer(flex: 1,),
              SizedBox(height: 100, child: Image.asset("assets/images/logo.png")),

            ],)),
    );
  }
}
