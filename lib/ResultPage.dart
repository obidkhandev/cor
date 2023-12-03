import 'package:cor/TextResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ReadingModePage.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
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
                                "images/back.svg",
                                colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

                              ) ,))),
                      Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(child:Image.asset("images/settings.jpg",) ,))),
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
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: 20,

                            itemBuilder: (BuildContext context, int index) {
                              return  Container(
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
                                        color: (index==0)?Colors.grey.shade300: Colors.white,

                                      ),
                                      child: Center(child: (index==0)?Text(''):Text(index.toString())),

                                    ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/2,
                                        height: (MediaQuery.of(context).size.height/2)/9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          color: (index==0)?Colors.grey.shade300: Colors.white,
                                        ),
                                        child: Center(child: (index==0)?Text('Название'):Text("")),

                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/3.5,
                                        height: (MediaQuery.of(context).size.height/2)/9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          color: (index==0)?Colors.grey.shade300: Colors.white,
                                        ),
                                        child: Center(child: (index==0)?Text('Автор'):Text("")),

                                      )

                                    ],

                                  )
                              );
                            }),)),



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
