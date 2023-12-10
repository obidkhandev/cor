import 'package:cor/MyLibraryPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';

class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
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






/*
Padding(
padding: EdgeInsets.only(top: 12),
child: Container(
width: MediaQuery.of(context).size.width - 28,
height:
7 * ((MediaQuery.of(context).size.height / 2) / 10),
child: Column(
children: [
Container(
width: MediaQuery.of(context).size.width - 28,
height:
(MediaQuery.of(context).size.height / 2) /
10,
child: Row(
children: [
Container(
padding: EdgeInsets.all(4),
width: ((MediaQuery.of(context)
    .size
    .height /
2) /
9) *
2,
height: (MediaQuery.of(context)
    .size
    .height /
2) /
9,
decoration: BoxDecoration(
border: Border.all(
color: Colors.grey,
width: 0.5,
),
color:  Colors.grey.shade300
,
),
child: Center(
child:  Text(
"№ Выдоха",
textAlign: TextAlign.center,
style: TextStyle(
fontWeight:
FontWeight.w800),
),
)),
Container(
padding: EdgeInsets.all(0),
width: MediaQuery.of(context)
    .size
    .width /
1.5,
height: (MediaQuery.of(context)
    .size
    .height /
2) /
9,
decoration: BoxDecoration(
border: Border.all(
color: Colors.grey,
width: 0.5,
),
color:  Colors.grey.shade300
,
),
child: Center(
child:  Text(
"Текст",
textAlign: TextAlign.center,
style: TextStyle(
fontWeight:
FontWeight.w800),
),
)),
],
)),

ListView.builder(
shrinkWrap: true,
itemCount: 40,
padding: EdgeInsets.zero,
itemBuilder: (BuildContext context, int index) {
return Container(
width: MediaQuery.of(context).size.width - 28,
height:
(MediaQuery.of(context).size.height / 2) /
10,
child: Row(
children: [
Container(
padding: EdgeInsets.all(4),
width: ((MediaQuery.of(context)
    .size
    .height /
2) /
9) *
2,
height: (MediaQuery.of(context)
    .size
    .height /
2) /
9,
decoration: BoxDecoration(
border: Border.all(
color: Colors.grey,
width: 0.5,
),
color: Colors.white,
),
child: Center(
child:  Text("${index+1}".toString()),
)),
Container(
padding: EdgeInsets.all(0),
width: MediaQuery.of(context)
    .size
    .width /
1.5,
height: (MediaQuery.of(context)
    .size
    .height /
2) /
9,
decoration: BoxDecoration(
border: Border.all(
color: Colors.grey,
width: 0.5,
),
color:Colors.white,
),
child: Center(
child:  TextField(
controller:
controllers[index],
textCapitalization:
TextCapitalization
    .sentences,
textAlign: TextAlign.center,
*/
/*onChanged: (text) {
                                                  print(text);
                                                  newText[index - 1] = text;
                                                },*//*


//controller: readingSpeedController,
decoration: InputDecoration(
isDense: true,
contentPadding:
EdgeInsets.symmetric(
horizontal: 0,
vertical: 0),
hintText: "",
counterText: "",
border: InputBorder.none,
),
style: TextStyle(
color: Color.fromRGBO(
54, 103, 166, 1),
fontSize: 14,
fontWeight:
FontWeight.w800),
),
)),
],
));
}),
],
),
))*/
