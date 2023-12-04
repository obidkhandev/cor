import 'package:cor/DeletePage.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'PlayPage.dart';

class TextResultPage extends StatefulWidget {
  const TextResultPage({Key? key}) : super(key: key);

  @override
  State<TextResultPage> createState() => _TextResultPageState();
}

class _TextResultPageState extends State<TextResultPage> {
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
                  Container(
                    //width: MediaQuery.of(context).size.width-50,
                      margin: EdgeInsets.only(top:12,bottom: 12),
                      padding: EdgeInsets.only(top:2,bottom: 2,right: 6,left: 6),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.75),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Text(
                        "Название\nАвтор",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize:16,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Padding (
                      padding: EdgeInsets.only(top:12),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [Container(
                                      width: MediaQuery.of(context).size.width/5,
                                      height: (MediaQuery.of(context).size.height/2)/9,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        color: (index==0)?Colors.grey.shade300: Colors.white,

                                      ),
                                      child: Center(child: (index==0)?Text('Дата'):Text('18.10.2023')),

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
                                        child: Center(child: (index==0)?Text('Режим и скорость чтения'):Text("2/90")),

                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/5,
                                        height: (MediaQuery.of(context).size.height/2)/9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          color: (index==0)?Colors.grey.shade300: Colors.white,
                                        ),
                                        child: Center(child: (index==0)?Text('Слушать'):IconButton(onPressed: (){ Navigator.of(context).push(PageRouteBuilder(
                                            opaque: false,
                                            pageBuilder: (BuildContext context, _, __) =>PlayPage()));}, icon: Icon(Icons.play_circle, color: Colors.blue,))),

                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/5,
                                        height: (MediaQuery.of(context).size.height/2)/9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          color: (index==0)?Colors.grey.shade300: Colors.white,
                                        ),
                                        child: Center(child: (index==0)?Text('Удалить'):IconButton(onPressed: (){ Navigator.of(context).push(PageRouteBuilder(
                                            opaque: false,
                                            pageBuilder: (BuildContext context, _, __) =>DeletePage()));}, icon: Icon(Icons.delete_outline, color: Colors.black,))),

                                      )

                                    ],

                                  )
                              );
                            }),)),



                  Spacer(flex: 2,),

                  GestureDetector(
                      onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>MyHomePage(title: 'Коррекция речи'),));},
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
                        child: Center(child:Text("Главное меню", style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w800),)),
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