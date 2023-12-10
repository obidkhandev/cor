import 'package:cor/ChoiceTextPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/TextResultPage.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ReadingModePage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}
List<String> resForText=[];
List <String> dateForText=[];
List <String> modeForText=[];
class _ResultPageState extends State<ResultPage> {
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
        child:Padding(
            padding: EdgeInsets.only(right: 8,left: 8),

            child:Center(
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
                              child: GestureDetector(onTap: (){Navigator.pop(context);},child: SvgPicture.asset(
                                "assets/images/back.svg",
                                colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

                              ) ,))),
                      Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(child:Image.asset("assets/images/settings.jpg",) ,))),
                    ],
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width-50,
                    // margin: EdgeInsets.only(bottom:12),
                      padding: EdgeInsets.only(top:2,bottom: 2,right: 6,left: 6),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(47, 128, 237, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Text(
                        "Сводная таблица\nрезультатов",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Padding (
                      padding: EdgeInsets.only(top:24),
                      child:Container(

                        width: MediaQuery.of(context).size.width-28,
                        height: MediaQuery.of(context).size.height/2,
                        child: Column(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width-28,
                                height: (MediaQuery.of(context).size.height/2)/9,

                                child: Row(
                                  children: [Container(
                                      width: (MediaQuery.of(context).size.height/2)/9,
                                      height: (MediaQuery.of(context).size.height/2)/9,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        color:  Colors.grey.shade300,

                                      ),
                                      child: Center(child:  Text("", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),))


                                  ),
                                    Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        height: (MediaQuery.of(context).size.height/2)/9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          color: Colors.grey.shade300,
                                        ),
                                        child: Center(child:Text("Название", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),))


                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        height: (MediaQuery.of(context).size.height/2)/9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          color: Colors.grey.shade300,
                                        ),
                                        child: Center(child: Text("Автор", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),))

                                    )

                                  ],

                                )
                            ),
                           Container(
                               height: (MediaQuery.of(context).size.height/2)-(((MediaQuery.of(context).size.height /
                                   2) /
                                   10)*1.5),
                               child: ListView.builder(padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: items?.length ?? 0,

                                itemBuilder: (BuildContext context, int index) {
                                  return  GestureDetector(
                                      onTap: ()async{
                                        selectIndex = index;
                                        resForText=await pref.getStringList("${items[selectIndex]}_res") ?? [];// ссылки на записи
                                        resForText.removeWhere((item) => item == '-');

                                        for(var i =0; i<resForText.length;i++){
                                          dateForText.add((await pref.getStringList("${resForText[i]}"))?[0] ?? "");
                                          modeForText.add((await pref.getStringList("${resForText[i]}"))?[1] ?? "");

                                        }
                                        setState(() {

                                        });

                                      },

                                      child:Container(
                                          width: MediaQuery.of(context).size.width-28,
                                          height: (MediaQuery.of(context).size.height/2)/9,

                                          child: Row(
                                            children: [Container(
                                                width: (MediaQuery.of(context).size.height/2)/9,
                                                height: (MediaQuery.of(context).size.height/2)/9,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.grey,
                                                    width: 0.5,
                                                  ),
                                                  color: selectIndex == index ? Color.fromRGBO(102, 156, 238, 0.97):Colors.white,

                                                ),
                                                child: Center(child: Text("${index+1}".toString(), textAlign: TextAlign.center,),)


                                            ),
                                              Container(
                                                  width: MediaQuery.of(context).size.width/2,
                                                  height: (MediaQuery.of(context).size.height/2)/9,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 0.5,
                                                    ),
                                                    color: selectIndex == index ? Color.fromRGBO(102, 156, 238, 0.97):Colors.white,
                                                  ),
                                                  child: Center(child:Text('${text_titles[index]}', textAlign: TextAlign.center,),)


                                              ),
                                              Container(
                                                  width: MediaQuery.of(context).size.width/3.5,
                                                  height: (MediaQuery.of(context).size.height/2)/9,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 0.5,
                                                    ),
                                                    color: selectIndex == index ? Color.fromRGBO(102, 156, 238, 0.97):Colors.white,
                                                  ),
                                                  child: Center(child: Text('${text_autor[index]}', textAlign: TextAlign.center,),)

                                              )

                                            ],

                                          )
                                      ));
                                })),
                          ],
                        ),)),



                  Spacer(flex: 2,),

                  GestureDetector(
                      onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => TextResultPage()));},
                      child:Container(
                        width: MediaQuery.of(context).size.width/1.5,
                        margin: EdgeInsets.only(top:12,),
                        padding: EdgeInsets.only(top:12,bottom: 12),
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(33, 150, 83, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Center(child:Text("Выбрать", style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w800),)),
                      )),
                  Spacer(flex: 1,)
                ],
              ),
            )),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
