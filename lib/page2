import 'package:flutter/material.dart';
import 'package:mathpuzzle/data .dart';
import 'package:mathpuzzle/page1%20.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page2 extends StatefulWidget {
  const page2({Key? key}) : super(key: key);

  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {

  SharedPreferences? prefs;
  List levelstatus=[];
  bool getdata=false;
  int? lastlevel;
  memory() async{
    prefs = await SharedPreferences.getInstance();
    lastlevel = prefs!.getInt("lastlevel")?? 0;
    print("lastlevel=$lastlevel");
    setState(() {
      for(int i=0;i<24;i++)
        {
          String? status =prefs!.getString("level$i");
          print ("level$i=$status");
          levelstatus.add(status);
        }
      getdata=true;
    });
  }
  @override
  void initState(){
    super.initState();
    memory();
  }
  Widget build(BuildContext context) {
    sizedeta(context);
    return Scaffold(
      appBar: AppBar(title: Text("page2"),),
      body: getdata?Container(
        height: sizedeta.height,
        width: sizedeta.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/background.jpg"),fit: BoxFit.fill
            )
        ),
        child: Column(
          children: [
            Container(
              child: Text("Select Puzzle"
              ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ),
            Container(
              height: sizedeta.height!/1.3,
              width: sizedeta.width,
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,

              ),itemCount: 20, itemBuilder:(context, index) {
                if(index==lastlevel!)
                  {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                          return page1(index);
                        },));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${index+1}"),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                      ),
                    );
                  }
                if(levelstatus[index]=="win")
                  {
                    return InkWell(
                      onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return page1(index);
                      },));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${index+1}"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                          image: DecorationImage(
                            image: AssetImage("img/tick.png")
                          )
                        ),
                      ),
                    );
                  }
                if(levelstatus[index]=="skip")
                  {
                    return InkWell(
                      onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return page1(index);
                      },));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("${index+1}"),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)
                        ),
                      ),
                    );
                  }
                else
                  {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("img/lock.png")
                        )
                      ),
                    );
                  }
              }, ),
            )
          ],
        ),
      ):Container()
    );
  }
}
