

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathpuzzle/data2.dart';
import 'package:mathpuzzle/page2.dart';
import 'package:mathpuzzle/winpage.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'data .dart';

class page1 extends StatefulWidget {
  int pos;
  page1(this.pos);

  @override
  _page1State createState() => _page1State();
}

class _page1State extends State<page1> {
  String currentnumber="";
  SharedPreferences? prefs;
  List levelstatus = [];
  bool getdata=false;


  memory() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      for (int i = 0; i < 20; i++) {
        String? status = prefs!.getString('level$i');
        print("level$i=$status");
        levelstatus.add(status);
      }
      getdata = true;
    });
    if (levelstatus[widget.pos] == null) {
      widget.pos = await prefs!.getInt('lastlevel') ?? 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    memory();
  }

  @override
  Widget build(BuildContext context) {
    sizedeta(context);
    return Scaffold(
      appBar: AppBar(title: Text("page 1"),),
      body: Container(
        height: sizedeta.height,
        width: sizedeta.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img/gameplaybackground.jpg"),fit: BoxFit.fill
          )
        ),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              InkWell(

                child: Container(
                  margin: EdgeInsets.all(10),
                  height: sizedeta.width!/10,
                  width: sizedeta.width!/10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("img/skip.png"),fit: BoxFit.fill
                    )
                  ),
                ),
                onTap: () async{
                  await prefs!.setInt("lastlevel", widget.pos+1);
                  await prefs!.setString("level${widget.pos}", "skip");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return page1(widget.pos+1);
                  },));
                },
              ),
            //  Spacer(),
              Container(

                height: 50,
                width: sizedeta.width!/3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("img/level_board.png"),fit: BoxFit.fill

                  )
                ),
                alignment: Alignment.center,
                child: Text("PUZZLE ${widget.pos+1}",style: TextStyle(color: Colors.white),),
              ),
              //Spacer(),
              InkWell(
                child: Container(

                  height: sizedeta.height!/20,
                  width: sizedeta.height!/20,
                  margin: EdgeInsets.all(10),
                  decoration:BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("img/hint.png"),fit: BoxFit.fill
                    )
                  ),
                ),
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      height: 100,
                    );
                  },);
                },
              )
            ],),
            Container(
              height: sizedeta.height!/2,
              width: sizedeta.width!/1.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/p${widget.pos+1}.png"),fit: BoxFit.fill
                )
              )
              ,
            ),
            Spacer(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: sizedeta.height!/16,
                          width: sizedeta.width!/1.7,
                          color: Colors.white,
                          child: Text("${currentnumber}"),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if(currentnumber.length>0)
                                {
                                  currentnumber=currentnumber.substring(0,currentnumber.length-1);
                                }
                            });
                          },
                          child: Container(
                            height: sizedeta.height!*0.05,
                            width: sizedeta.width!*0.2,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("img/delete.png")
                              )
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () async {
                              if (levelstatus[widget.pos] == null) {
                                if (currentnumber ==
                                    data.ansr[widget.pos]) {
                                  await prefs!
                                      .setInt('lastlevel', widget.pos + 1);
                                  await prefs!.setString(
                                      'level${widget.pos}', "win");

                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return winpage(widget.pos+1);
                                        },
                                      ));
                                } else {
                                  print("wrong");
                                }
                              }
                              if (levelstatus[widget.pos] == "win") {
                                if (currentnumber ==
                                    data.ansr[widget.pos]) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return winpage(widget.pos+1);
                                        },
                                      ));
                                } else {
                                  print("wrong");
                                }
                              } else if (levelstatus[widget.pos] ==
                                  "skip") {
                                if (currentnumber ==
                                    data.ansr[widget.pos]) {
                                  await prefs!.setString(
                                      'level${widget.pos}', "win");
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return winpage(widget.pos+1);
                                        },
                                      ));
                                } else {
                                  print("wrong");
                                }
                              }
                            },
                        child: Text("SUBMIT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),))
                      ],

                  ),
                  SizedBox(
                    height: sizedeta.bdheight!/12,
                    width: sizedeta.width!-30,
                    child: GridView.builder(physics: NeverScrollableScrollPhysics(),gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 7,
                      crossAxisCount: 10,
                    ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                      return InkWell(
                      onTap: () {
                        setState(() {
                          currentnumber=currentnumber+data.number[index];
                        });
                      },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey,width: 4)
                          ),
                          alignment: Alignment.center,
                          child: Text("${data.number[index]}",style: TextStyle(color: Colors.black),),
                        ),
                      );
                    },),
                  ),
                ],
              ),
              // child: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Container(
              //       height: sizedeta.height!/15,
              //       width: sizedeta.width!/1.7,
              //       color: Colors.white,
              //     ),
              //     Icon(Icons.backspace,size: 30,),
              //     InkWell(
              //     // onTap: () {
              //     //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     //     return
              //     //   },));
              //     // }
              //     child: Text("SUBMIT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),))
              //   ],
              //
              // ),


              // height: sizedeta.height!/13,
              // width: sizedeta.width!/2,
              // color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
