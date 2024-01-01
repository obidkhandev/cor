import 'package:cor/ManualPage.dart';
import 'package:cor/ResultPage.dart';
import 'package:cor/TextPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
void initState(){
  super.initState();
  SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.65),
      body: Center(
          child: Container(
              padding: EdgeInsets.only(left: 64,right:64 ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(flex:1),
                  Align(
                      alignment: Alignment.centerRight,
                      child:IconButton(icon:Icon(
                        Icons.clear,
                        color: Colors.grey,
                        size: 46,
                      ), onPressed:(){ Navigator.pop(context);},)),
                  Container(
                    padding: EdgeInsets.only(top: 32, bottom: 32, left: 12, right: 12),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO (214, 247, 127, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(0),
                        )),
                    child: Column(
                      children: [
                        GestureDetector(
                            onTap: (){Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) => ManualPage()));},
                            child: Text(
                              "Инструкция",textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            )),
                        SizedBox(height: 15,),
                        GestureDetector(
                            onTap: ()async{
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

                              Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    ResultPage()));},
                            child:  Text(
                              "Результаты",textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            ))
                        ,  SizedBox(height: 15,),
                        GestureDetector(
                            onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    TextPage()));},
                            child:Text(
                              "Чтение(Коррекция речи)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900),
                            )),  SizedBox(height: 15,),
                        GestureDetector(
                            onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) => MyHomePage(title: 'Коррекция речи')));},
                            child:Text(
                              "Главное меню", textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w900),
                            ))
                      ],
                    ),
                  ), Spacer(flex:2),
                ],
              ))),
    );
  }
}
