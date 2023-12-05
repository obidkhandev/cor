import 'package:cor/DeletePage.dart';
import 'package:cor/SavePage.dart';
import 'package:cor/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uuid/uuid.dart';

import 'TextPage.dart';

class CreateTextPage extends StatefulWidget {
  const CreateTextPage({Key? key}) : super(key: key);

  @override
  State<CreateTextPage> createState() => _CreateTextPageState();
}

TextEditingController lableController  = TextEditingController();
TextEditingController authorController  = TextEditingController();
List<String> newText=[];
List<String> infoNewText=[];
class _CreateTextPageState extends State<CreateTextPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(child:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                        "Создание новых текстов",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
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
                        "Введите название",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize:14,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: 29,
                    decoration: BoxDecoration(

                      color: Colors.grey.shade300,
                    ),
                    child:  Center(child:TextField(
                      textAlign: TextAlign.center,


                      controller: lableController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        hintText: "",
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(

                          color: Color.fromRGBO(54, 103, 166, 1),
                          fontSize:12,
                          fontWeight: FontWeight.w800),
                    )),


                  ),
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
                        "Введите автора",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize:14,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),
                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: 29,
                    decoration: BoxDecoration(

                      color: Colors.grey.shade300,
                    ),
                    child:  Center(child:TextField(
                      textAlign: TextAlign.center,


                      controller: authorController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        hintText: "",
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      style: TextStyle(

                          color: Color.fromRGBO(54, 103, 166, 1),
                          fontSize:12,
                          fontWeight: FontWeight.w800),
                    )),

                  ),
                  Padding (
                      padding: EdgeInsets.only(top:12),
                      child:Container(

                        width: MediaQuery.of(context).size.width-28,
                        height: 7*((MediaQuery.of(context).size.height/2)/10),
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 40,
                            padding: EdgeInsets.zero,
                            itemBuilder: (BuildContext context, int index) {
                              return  Container(
                                  width: MediaQuery.of(context).size.width-28,
                                  height: (MediaQuery.of(context).size.height/2)/10,

                                  child: Row(
                                    children: [Container(
                                      padding: EdgeInsets.all(4),
                                      width: ((MediaQuery.of(context).size.height/2)/9)*2,
                                      height: (MediaQuery.of(context).size.height/2)/9,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        color:index==0? Colors.grey.shade300: Colors.white,

                                      ),
                                      child: Center(child: index==0? Text("№ Выдоха", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),):Text(index.toString()),)

                                    ),
                                      Container(
                                        padding: EdgeInsets.all(0),
                                        width: MediaQuery.of(context).size.width/1.5,
                                        height: (MediaQuery.of(context).size.height/2)/9,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                          color:index==0? Colors.grey.shade300: Colors.white,
                                        ),
child:Center(child: index==0? Text("Текст", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w800),):  Center(child:TextField(
  textCapitalization: TextCapitalization.sentences,
  textAlign: TextAlign.center,
onChanged: (text){
    print(text);
    newText[index-1]=text;
},

  //controller: readingSpeedController,
  decoration: InputDecoration(
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    hintText: "",
    counterText: "",
    border: InputBorder.none,
  ),
  style: TextStyle(

      color: Color.fromRGBO(54, 103, 166, 1),
      fontSize:14,
      fontWeight: FontWeight.w800),
)),)
                                      ),


                                    ],

                                  )
                              );
                            }),)),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) => DeletePage()));},
                          child:Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: EdgeInsets.only(top:12,),
                            padding: EdgeInsets.only(top:12,bottom: 12,left: 6,right: 6),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(234, 87, 87, 1),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Center(child:Text("Удалить", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w800),)),
                          )),
                      GestureDetector(
                          onTap: ()async{
                            String uuid = Uuid().v4();
                            my_lib.add(uuid);
                            print("Добавили ===================================================== + $my_lib");
                            await pref.setStringList('$uuid', newText);
                            print("Добавили text ===================================================== + $newText");
                            infoNewText.add(lableController.toString());
                            infoNewText.add(authorController.toString());
                            infoNewText.add("90");
                            infoNewText.add("9.2");
                            await pref.setStringList('${uuid}_info', infoNewText);
                            await pref.setStringList('${uuid}_res', <String>['-',]);
                            Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) => SavePage()));},
                          child:Container(
                            width: MediaQuery.of(context).size.width/2.5,
                            margin: EdgeInsets.only(top:12,),
                            padding: EdgeInsets.only(top:12,bottom: 12,left: 6,right: 6),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(43, 208, 49, 1),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                            ),
                            child: Center(child:Text("Сохранить", style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.w800),)),
                          )),
                    ],),
                  Spacer(flex: 2,),

                  GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        /*Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => ReadingModePage()));*/},
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
                        child: Center(child:Text("Моя библиотека", style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w800),)),
                      )),
                  Spacer(flex: 1,)
                ],
              ),
            )),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
