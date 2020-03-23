import 'package:coavoid/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Finish extends StatefulWidget {
  @override
  _FinishState createState() => _FinishState();
}

class _FinishState extends State<Finish> with  SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController=AnimationController (
      vsync: this,
      duration: Duration(seconds: 4),
    )..addListener(()=>setState((){}));
    animation=CurvedAnimation(
        parent: animationController,
        curve: Curves.linearToEaseOut);
    animationController.forward();
    Future.delayed(
        Duration(seconds:60),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (context)=>SplashScreenPage(),
          ));
    }
    );
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(140,223,224,1.0),
      body: new Center(
        child: ScaleTransition(
          scale: animation,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top:25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    child: Image(
                      image: AssetImage("assets/finish.png"),
                      height: 300,
                      width: 300,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('“In the midst of this crisis, we must not only pray-though we must most fervently pray-we must also work. There are many things to be done and it’s going to be up to us to do them.”\n \n "في خضم هذه الأزمة ، يجب علينا ألا نصلي فقط - على الرغم من أننا يجب أن نصلي بشدة - علينا أن نعمل أيضا. هناك أشياء كثيرة يتعين القيام بها ، والأمر متروك لنا للقيام بها "',style: GoogleFonts.dosis(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                  Expanded(
                    child:  new Align(
                      alignment: Alignment.bottomCenter,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text('Made by Benantar Abdenour',style: GoogleFonts.firaSansCondensed(fontSize: 10),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
