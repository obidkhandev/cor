import 'package:cor/CreateTextPage.dart';
import 'package:cor/TextPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'ReadingModePage.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({Key? key}) : super(key: key);

  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}

class _MyLibraryPageState extends State<MyLibraryPage> {
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
                              child: GestureDetector(
                                onTap: (){Navigator.pop(context);},
                                child: SvgPicture.asset(
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
                    //width: MediaQuery.of(context).size.width-50,
                    // margin: EdgeInsets.only(bottom:12),
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
                        "Моя библиотека",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
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
                                child: Center(child: Text("", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),))


                            ),
                              Container(
                                  width: MediaQuery.of(context).size.width/2,
                                  height: (MediaQuery.of(context).size.height/2)/9,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color:  Colors.grey.shade300,
                                  ),
                                  child: Center(child:  Text("Название", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),))


                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width/3.5,
                                  height: (MediaQuery.of(context).size.height/2)/9,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 0.5,
                                    ),
                                    color:  Colors.grey.shade300,
                                  ),
                                  child: Center(child:Text("Автор", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),))

                              )

                            ],

                          )
                      ),
                            ListView.builder(padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: my_lib.length,

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
                                              color:  Colors.white,

                                            ),
                                            child: Center(child: Text((index+1).toString()),)


                                        ),
                                          Container(
                                              width: MediaQuery.of(context).size.width/2,
                                              height: (MediaQuery.of(context).size.height/2)/9,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Center(child: Text(my_lib[0]),)


                                          ),
                                          Container(
                                              width: MediaQuery.of(context).size.width/3.5,
                                              height: (MediaQuery.of(context).size.height/2)/9,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Center(child: Text(''),)

                                          )

                                        ],

                                      )
                                  );
                                }),
                          ],
                        ),)),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
  GestureDetector(
      onTap: (){ Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => CreateTextPage()));},
      child:Container(
        width: MediaQuery.of(context).size.width/2.5,
        margin: EdgeInsets.only(top:12,),
        padding: EdgeInsets.only(top:12,bottom: 12,left: 6,right: 6),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(54, 103, 166, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        child: Center(child:Text("Создать новый текст", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w800),)),
      )),
  GestureDetector(
      onTap: (){ Navigator.of(context).push(PageRouteBuilder(
          opaque: false,
          pageBuilder: (BuildContext context, _, __) => CreateTextPage()));},
      child:Container(
        width: MediaQuery.of(context).size.width/2.5,
        margin: EdgeInsets.only(top:12,),
        padding: EdgeInsets.only(top:12,bottom: 12,left: 6,right: 6),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(26, 161, 190, 1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
        ),
        child: Center(child:Text("Редактировать", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w800),)),
      )),
],),
                  Spacer(flex: 2,),

                  GestureDetector(
                      onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => ReadingModePage()));},
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
                        child: Center(child:Text("Режим чтения", style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w800),)),
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
