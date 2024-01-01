import 'package:cor/MyLibraryPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {

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

                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    padding: EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.78),
                        borderRadius: BorderRadius.all(
                          Radius.circular(22),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: Text("Сохранено", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 16),),),

                        GestureDetector(
                            onTap: ()async{

                              Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) => MyLibraryPage()));},
                            child:Container(
                              width: MediaQuery.of(context).size.width / 4,
                              margin: EdgeInsets.only(bottom: 12),
                              padding: EdgeInsets.only(top: 6, bottom: 6),
                              decoration: const BoxDecoration(
                                boxShadow: [BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0,
                                  offset: Offset(0,1),
                                )],
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(100),
                                    topLeft: Radius.circular(100),
                                    bottomRight: Radius.circular(100),
                                    bottomLeft: Radius.circular(100)),
                              ),
                              child: Center(
                                  child: Text(
                                    "Ок",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 16),
                                  )),
                            )),
                      ],
                    ),
                  ), Spacer(flex:1),
                ],
              ))),
    );
  }
}





