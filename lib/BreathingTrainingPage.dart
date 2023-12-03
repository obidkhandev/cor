import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BreathingTrainingPage extends StatefulWidget {
  const BreathingTrainingPage({Key? key}) : super(key: key);

  @override
  State<BreathingTrainingPage> createState() => _BreathingTrainingPageState();
}
double  breathindSpeed = 9.2;
class _BreathingTrainingPageState extends State<BreathingTrainingPage> {
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
                     margin: EdgeInsets.only(top:24),
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
                        "Выбор ритма дыхания",
                        style: TextStyle(
                            color: Color.fromRGBO(0, 87, 204, 1),
                            fontSize:20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )),

                  Container(
                    width: MediaQuery.of(context).size.width/1.5,
                      padding: EdgeInsets.only(right: 12,left: 12,top: 12,bottom:12 ),
                      margin: EdgeInsets.only(top: 12 ),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: Text(
                        "${breathindSpeed.toStringAsFixed(1)} дых./мин.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:20,
                            fontWeight: FontWeight.w800),
                        textAlign: TextAlign.center,
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        breathindSpeed=breathindSpeed-0.1;
                        setState(() {

                        });


                      }, icon: Icon(Icons.do_not_disturb_on,color: Colors.red,size: 36,)),
                      SvgPicture.asset(
                        "images/arrow1.svg",
                        //  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

                      ) ,
                      SizedBox(width: 15,),
                      SvgPicture.asset(
                        "images/arrow.svg",
                        // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),

                      ) ,
                      IconButton(onPressed: (){
                        breathindSpeed=breathindSpeed+0.1;
                        setState(() {

                        });

                      }, icon: Icon(Icons.add_circle,color: Colors.green,size: 36,)),
                    ],),

                  Spacer(flex: 1,),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/arrowTop.png",
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 12, left: 2),
                          padding: EdgeInsets.only(
                              top: 6, bottom: 6, right: 6, left: 6),
                          width: MediaQuery.of(context).size.width / 1.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                            color: Color.fromRGBO(217, 217, 217, 1),
                          ),
                          child: Center(
                              child: Text(
                                "Ветер по морю гуляет",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset("images/arrowTop.png",) ,
                      Container(
                        margin: EdgeInsets.only( right: 12,left: 2),
                        padding: EdgeInsets.only(top:6,bottom:6 , right: 6, left: 6),
                        width: MediaQuery.of(context).size.width/1.5,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        child: Center(child:Text("И кораблик подгоняет;",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),textAlign: TextAlign.center,)),
                      ),
                    ],

                  ),),
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset("images/arrowTop.png",) ,
                      Container(
                        margin: EdgeInsets.only( right: 12,left: 2),
                        padding: EdgeInsets.only(top:6,bottom:6 , right: 6, left: 6),
                        width: MediaQuery.of(context).size.width/1.5,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        child: Center(child:Text("Он бежит себе в волнах",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),textAlign: TextAlign.center,)),
                      ),
                    ],

                  ),),
                  Container(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Image.asset("images/arrowTop.png",) ,
                      Container(
                        margin: EdgeInsets.only( right: 12,left: 2),
                        padding: EdgeInsets.only(top:6,bottom:6 , right: 6, left: 6),
                        width: MediaQuery.of(context).size.width/1.5,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          color: Color.fromRGBO(217, 217, 217, 1),
                        ),
                        child: Center(child:Text("На поднятых парусах",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),textAlign: TextAlign.center,)),
                      ),
                    ],

                  ),),
                  
                  Spacer(flex: 2,),

                  GestureDetector(
                      onTap: (){ /*Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) => NewsPage()));*/},
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
