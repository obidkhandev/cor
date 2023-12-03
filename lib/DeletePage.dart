import 'package:flutter/material.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
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
                         child: Text("Удалить?", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 16),),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  /*Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => WordPage(),
                                  ),
                                      (route) => false,//if you want to disable back feature set to false
                                );*/},
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
                                        "Отмена",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 16),
                                      )),
                                )),
                            GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                  /*Navigator.pushAndRemoveUntil<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (BuildContext context) => WordPage(),
                                  ),
                                      (route) => false,//if you want to disable back feature set to false
                                );*/},
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
                                        "Да",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800,fontSize: 16),
                                      )),
                                )),
                          ],
                        )
                      ],
                    ),
                  ), Spacer(flex:1),
                ],
              ))),
    );
  }
}
