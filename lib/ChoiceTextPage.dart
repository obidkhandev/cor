import 'package:cor/Pref.dart';
import 'package:cor/ReadingModePage.dart';

import 'package:cor/TextPage.dart';
import 'package:cor/main.dart';
import 'package:cor/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoiceTextPage extends StatefulWidget {
  const ChoiceTextPage({Key? key}) : super(key: key);

  @override
  State<ChoiceTextPage> createState() => _ChoiceTextPageState();
}
 var selectIndex = -1;
late List<String> lines;
late int readingSpeed;
class _ChoiceTextPageState extends State<ChoiceTextPage> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations ([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

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
                        "Список текстов для чтения\n${selectAge}",
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
                            ListView.builder(padding: EdgeInsets.zero,
                             shrinkWrap: true,
                             itemCount: items?.length ?? 0,

                             itemBuilder: (BuildContext context, int index) {
                               return  GestureDetector(
                                   onTap: (){
                                     selectIndex = index;
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
                             }),
                          ],
                        ),)),



                  Spacer(flex: 2,),


                  GestureDetector(
                      onTap: ()async{
                        if(selectIndex!=-1){
                          nameSelect=text_titles[selectIndex];
                          autorSelect=text_autor[selectIndex];
                          lines = await pref.getStringList(items![selectIndex])!;
                          readingSpeedController.text= await pref.getStringList("${items![selectIndex]}_info")![2];
                           readingSpeed = int.parse(await pref.getStringList("${items![selectIndex]}_info")![2]);
                          Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  ReadingModePage()));
                        }
                      },
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
