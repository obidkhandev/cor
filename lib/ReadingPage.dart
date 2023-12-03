import 'package:cor/BreathingTrainingPage.dart';
import 'package:cor/ChoiceTextPage.dart';
import 'package:cor/ReadingModePage.dart';
import 'package:cor/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_svg/svg.dart';

class ReadingPage extends StatefulWidget {
  const ReadingPage({Key? key}) : super(key: key);

  @override
  State<ReadingPage> createState() => _ReadingPageState();
}
bool isRecord = false;
var indexLines = 0;
class _ReadingPageState extends State<ReadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    width: MediaQuery.of(context).size.width/2,
                      padding: EdgeInsets.only(right: 12,left: 12),

                      decoration: BoxDecoration(

                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Text(
                        "0:05",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:40,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )
                  ),

                  Container(
                    //width: MediaQuery.of(context).size.width-50,
                      margin: EdgeInsets.only(bottom:22, top:22),
                      padding: EdgeInsets.only(top:2,bottom: 2,right: 6,left: 6),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(126, 157, 198, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Text(
                        "Режим чтения ${readingMode}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),

                  Spacer(flex: 1,),

                 Container(
                     width: MediaQuery.of(context).size.width/1.4,
                   child: Column(
                   // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      (indexLines)> lines.length-1 ?Container(): Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Image.asset("images/arrowTop.png",) ,
                      Container(
                           constraints: BoxConstraints(maxWidth:  MediaQuery.of(context).size.width /
                               1.6,),
                        margin: EdgeInsets.only( right: 12,left: 2),
                        padding: EdgeInsets.only(top:6,bottom:6 , right: 6, left: 6),
                      //  width: MediaQuery.of(context).size.width/1.5,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                            child:Text(lines[indexLines],style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),textAlign: TextAlign.center,),
                      ),
                    ],

                  ),
                      (indexLines+1)> lines.length-1 ?Container():Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Image.asset("images/arrowTop.png",) ,
                          Container(
                            constraints: BoxConstraints(maxWidth:  MediaQuery.of(context).size.width /
                                1.6,),
                            margin: EdgeInsets.only( right: 12,left: 2),
                            padding: EdgeInsets.only(top:6,bottom:6 , right: 6, left: 6),
                            //  width: MediaQuery.of(context).size.width/1.5,

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child:Text(lines[indexLines+1],style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),textAlign: TextAlign.center,),
                          ),
                        ],

                      ),
                      (indexLines+2)> lines.length-1 ?Container(): Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Image.asset("images/arrowTop.png",) ,
                          Container(
                            constraints: BoxConstraints(maxWidth:  MediaQuery.of(context).size.width /
                                1.6,),
                            margin: EdgeInsets.only( right: 12,left: 2),
                            padding: EdgeInsets.only(top:6,bottom:6 , right: 6, left: 6),
                            //  width: MediaQuery.of(context).size.width/1.5,

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child:Text(lines[indexLines+2],style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),textAlign: TextAlign.center,),
                          ),
                        ],

                      ),
                      (indexLines+3)> lines.length-1 ?Container():Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Image.asset("images/arrowTop.png",) ,
                          Container(
                            constraints: BoxConstraints(maxWidth:  MediaQuery.of(context).size.width /
                                1.6,),
                            margin: EdgeInsets.only( right: 12,left: 2),
                            padding: EdgeInsets.only(top:6,bottom:6 , right: 6, left: 6),
                            //  width: MediaQuery.of(context).size.width/1.5,

                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              color: Color.fromRGBO(217, 217, 217, 1),
                            ),
                            child:Text(lines[indexLines+3],style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),textAlign: TextAlign.center,),
                          ),
                        ],

                      ),

                    ],
                  )),


             Row(
               children: [
                GestureDetector(
                    onTap: (){
                      isRecord = !isRecord;
if(indexLines+4 <=lines.length-1) {
  indexLines = indexLines + 4;
}else{print("Закончили!");}
                      setState(() {

                      });
                    },
                    child: Container(

                   width: MediaQuery.of(context).size.width/2.5,
                   margin: EdgeInsets.only(bottom:22,top: 48),

                   decoration:  BoxDecoration(
                     color: Color.fromRGBO(217, 217, 217, 0.81),
                     borderRadius: BorderRadius.only(
                         topRight: Radius.circular(12),
                         topLeft: Radius.circular(12),
                         bottomRight: Radius.circular(12),
                         bottomLeft: Radius.circular(12)),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Padding(
                        padding:EdgeInsets.only(left:(MediaQuery.of(context).size.width/2.5)/4,right: 16),
                        child: Text("Запись", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize:16 ),),),
                       Container(
                         width: 30,
                         height: 25,
                         decoration:  BoxDecoration(
                           border: Border.all(
                             color: Color.fromRGBO(217, 217, 217, 1),
                             width: 3,
                           ),
                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                               topRight: Radius.circular(12),
                               topLeft: Radius.circular(12),
                               bottomRight: Radius.circular(12),
                               bottomLeft: Radius.circular(12)),
                         ),
                         child: isRecord?Image.asset("images/check.png",):Container(),

                       )
                     ],
                   )

                 )),
                 Spacer()
               ],
             ),


                  Container(

                      width: 120,
                      padding: EdgeInsets.only(right: 12,left: 12),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(54, 103, 166, 1),
                          width: 3,
                        ),
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child:
                      Center(child:TextField(
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        controller: readingSpeedController,
                        decoration: InputDecoration(
                          hintText: "",
                          counterText: "",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(

                            color: Color.fromRGBO(54, 103, 166, 1),
                            fontSize:40,
                            fontWeight: FontWeight.w800),
                      ))
                    /*Text(
                        "90",
                        style: TextStyle(
                            color: Color.fromRGBO(54, 103, 166, 1),
                            fontSize:40,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )*/
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){readingSpeed--;readingSpeedController.text=readingSpeed.toString();setState(() {

                      });}, icon: Icon(Icons.do_not_disturb_on,color: Colors.red,size: 36,)),
                      SvgPicture.asset(
                        "images/arrow1.svg",
                        //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

                      ) ,
                      SizedBox(width: 15,),
                      SvgPicture.asset(
                        "images/arrow.svg",
                        // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

                      ) ,
                      IconButton(onPressed: (){readingSpeed++;
                      readingSpeedController.text=readingSpeed.toString();
                      setState(() {

                      });}, icon: Icon(Icons.add_circle,color: Colors.green,size: 36,)),
                    ],),





                  Spacer(flex: 2,),

                  GestureDetector(
                      onTap: (){ Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => ResultPage()));},
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
                        child: Center(child:Text("Начать", style: TextStyle(color: Colors.white, fontSize: 22,fontWeight: FontWeight.w800),)),
                      )),Spacer(flex: 1,)

                ],
              ),
            )),
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
