import 'package:cor/CreateTextPage.dart';
import 'package:cor/ReadingPage.dart';
import 'package:cor/TextPage.dart';
import 'package:cor/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'ChoiceTextPage.dart';
import 'ReadingModePage.dart';
import 'main.dart';

class MyLibraryPage extends StatefulWidget {
  const MyLibraryPage({Key? key}) : super(key: key);

  @override
  State<MyLibraryPage> createState() => _MyLibraryPageState();
}
List<String> mylib_titles=[];
List<String> mylib_autor=[];
 bool isEdit = false ;
class _MyLibraryPageState extends State<MyLibraryPage> {


  @override
  void initState() {
    SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    selectIndex = -1;
    super.initState();
  }

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
                              child: GestureDetector(
                                onTap: (){Navigator.pop(context);},
                                child: SvgPicture.asset(
                                "assets/images/back.svg",
                                colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

                              ) ,))),
                      Padding(
                          padding: EdgeInsets.only(top: 24),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(   onTap: (){Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) => SettingsPage()));},child:Image.asset("assets/images/settings.jpg",) ,))),
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
                                itemCount: items.length,

                                itemBuilder: (BuildContext context, int index) {
                                  return  GestureDetector(
                                  onTap: (){
                                  selectIndex = index;
                                  setState(() {

                                  });},
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
                                              color:  selectIndex == index ? Color.fromRGBO(102, 156, 238, 0.97):Colors.white,

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
                                                color:  selectIndex == index ? Color.fromRGBO(102, 156, 238, 0.97):Colors.white,
                                              ),
                                              child: Center(child: Text(text_titles[index]),)


                                          ),
                                          Container(
                                              width: MediaQuery.of(context).size.width/3.5,
                                              height: (MediaQuery.of(context).size.height/2)/9,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                  width: 0.5,
                                                ),
                                                color:  selectIndex == index ? Color.fromRGBO(102, 156, 238, 0.97):Colors.white,
                                              ),
                                              child: Center(child: Text(text_autor[index]),)

                                          )

                                        ],

                                      )
                                  ));
                                }),
                          ],
                        ),)),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
  GestureDetector(
      onTap: (){
        isEdit = false;
        Navigator.of(context).push(PageRouteBuilder(
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
      onTap: ()async{
       if(selectIndex!=-1) {
         isEdit = true;
         lines = await pref.getStringList(items[selectIndex])!;


                              Navigator.of(context).push(PageRouteBuilder(
                                  opaque: false,
                                  pageBuilder: (BuildContext context, _, __) =>
                                      CreateTextPage()));
                            }
                          },
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
                      onTap: ()async{

                        lines = await pref.getStringList(items[selectIndex])!;
                        print(lines);
                        readingSpeedController.text= await pref.getStringList("${items[selectIndex]}_info")![2];

                        var ttt = double.parse(await pref.getStringList("${items[selectIndex]}_info")![2]);
                        readingSpeed = ttt.round();
                        print(readingSpeed);
                        initLineTime(lines, readingSpeed);



                        Navigator.of(context).push(PageRouteBuilder(
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
num libLineTime (List<String>cur_lines){

  num syllable_A;
  num exhalation_B;
  num speed_C;
  num count_vowels = 0;
  for (var i = 0; i < cur_lines.length; i++) {
    count_vowels = count_vowels + 'а'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'у'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'о'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'ы'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'и'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'э'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'я'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'ю'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'е'.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + 'ё'.allMatches(cur_lines[i].toLowerCase()).length;

    count_vowels = count_vowels + ' в '.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + ' с '.allMatches(cur_lines[i].toLowerCase()).length;
    count_vowels = count_vowels + ' к '.allMatches(cur_lines[i].toLowerCase()).length;
  }
  print(count_vowels);
  print(count_vowels/(cur_lines.length));
  readingMode=="1 строка"?syllable_A =count_vowels/(cur_lines.length) :syllable_A =count_vowels/((cur_lines.length)/2); //==================СРЕДНЕЕ КОЛИЧЕСТВО СЛОГОВ
  print(count_vowels/(cur_lines.length)*0.4);
  exhalation_B = syllable_A*0.4;//=============== среднее время выдоха
  print(count_vowels/(cur_lines.length)*0.4+1.5);
  print((count_vowels/(cur_lines.length)*0.4+1.5)/60);
  print(((syllable_A)/((syllable_A*0.4+1.5)/60)).toString()+"speed");
  speed_C = (syllable_A)/((syllable_A*0.4+1.5)/60);//=============== СКОРОСТЬ ЧТЕНИЯ

  return speed_C.round();
  }





