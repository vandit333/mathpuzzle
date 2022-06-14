import 'package:flutter/material.dart';
import 'package:mathpuzzle/page2.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:pagevieew/data.dart';
// import 'package:pagevieew/page1.dart';
// import 'package:pagevieew/page2.dart';
// import 'package:pagevieew/page3.dart';
import 'data .dart';
import 'page1 .dart';

void main()
{
  runApp(MaterialApp(
    home: puzzle(),
  ));
}
class puzzle extends StatefulWidget {
  const puzzle({Key? key}) : super(key: key);

  @override
  _puzzleState createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {

  int lastlevel=0;
  SharedPreferences? prefs;
  memory()async{
    prefs=await SharedPreferences.getInstance();
    lastlevel=prefs!.getInt("lastlevel") ?? 0;
    print("lastlevel=$lastlevel");
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
      appBar: AppBar(title: Text("PUZZLE"),),
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage("img/background.jpg") ,fit: BoxFit.fill),),
        child: Column(
          children: [
            Container(
              margin:EdgeInsets.only(top: 50),
              child: Text("MATH PUZZLE",style: TextStyle(
                fontSize: 30,fontWeight:FontWeight.bold
              ),),
            ),
            Container(
              height: sizedeta.height!/1.6,
              width: sizedeta.width!/1.2,
              decoration: BoxDecoration(
                image:
                  DecorationImage(
                    image: AssetImage("img/backgroundbord.png"),fit: BoxFit.fill
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text("CONTINUE",style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                      )),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return page1(lastlevel);
                      },));
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text("PUZZLES",style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    )),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return page2();
                      },));
                    },
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text("Benefits of pro version"),
                          content: Text("1.No Ads"
                              "\n2.No wait time for hint and skip"
                              "\n3.Hint for every level"
                              "\n4.Solution for every level"),
                          actions: [
                            TextButton(onPressed: () {

                            }, child: Text("BUY")),
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: Text("NO,THANKS"))
                          ],
                        );
                      },);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Text("BUY PRO",style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  )
                ],
              )
            ),
           // Spacer(),
            Expanded(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 100,
                    width: 100,

                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("img/ltlicon.png"),fit: BoxFit.fill)
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}
