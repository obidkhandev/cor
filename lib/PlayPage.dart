import 'package:flutter/material.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.65),
      body: Center(
          child: Container(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(flex:1),

                  Container(
                    width: MediaQuery.of(context).size.width-48,
                    padding: EdgeInsets.only(top: 15, bottom: 5, left: 15, right: 15),
                    decoration: BoxDecoration(
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 1.0,
                          spreadRadius: 1.0,
                          offset: Offset(0,3),
                        )],
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        )),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: Text("Название. Дата. Скорость чтения.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 16),),),

                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                              },
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
                                color: Color.fromRGBO(217, 217, 217, 0.78),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    topLeft: Radius.circular(6),
                                    bottomRight: Radius.circular(6),
                                    bottomLeft: Radius.circular(6)),
                              ),
                              child: Center(
                                  child: Text(
                                    "Закрыть",
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 16),
                                  )),
                            ))
                      ],
                    ),
                  ), Spacer(flex:1),
                ],
              ))),
    );
  }
}
