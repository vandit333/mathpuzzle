
import 'package:flutter/material.dart';
import 'package:mathpuzzle/data%20.dart';
import 'package:mathpuzzle/page1%20.dart';

import 'main .dart';

class winpage extends StatefulWidget {
  int? pos;
  winpage(this.pos);

  @override
  _winpageState createState() => _winpageState();
}

class _winpageState extends State<winpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WIN"),),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("img/background.jpg") ,fit: BoxFit.fill
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Container(
              height: sizedeta.height!/6,
              width: sizedeta.width,
              alignment: Alignment.center,
              child: Text("PUZZLE ${widget.pos} COMPLETED",style: TextStyle(fontSize: 30),),
            ),
            Container(
              height: sizedeta.height!/4,
              width: sizedeta.height!/1.2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/trophy.png")
                )
              ),
            ),
            InkWell(
              child: Container(
                height: sizedeta.height!/15,
                width: sizedeta.width!/2,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("CONTINUE",style: TextStyle(fontSize: 20),),
              ),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return page1(widget.pos!+1);
                },));
              },
            ),
            InkWell(
              child: Container(
                height: sizedeta.height!/15,
                width: sizedeta.width!/2,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("MAIN MENU",style: TextStyle(fontSize: 20),),
              ),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return puzzle();
                },));
              },
            ),
            InkWell(
              child: Container(
                height: sizedeta.height!/15,
                width: sizedeta.width!/2,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("BUY PRO",style: TextStyle(fontSize: 20),),
              ),
            ),
            Container(
              child: Text("SHARE THIS PUZZLE",style: TextStyle(fontSize: 30),),
            ),
            Container(
              height: sizedeta.height!/15,
              width: sizedeta.width!/6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/shareus.png") ,fit: BoxFit.fill
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}
