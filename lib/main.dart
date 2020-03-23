import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coavoid/feedPage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:new SplashScreenPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class SplashScreenPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_SplashScreenState();
}
class _SplashScreenState extends State<SplashScreenPage> with SingleTickerProviderStateMixin{
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
        Duration(seconds: 5),(){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (context)=>FeedPage(),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/logo_transparent.png"),
                  height: 200,
                  width: 200,
                ),
                Text('COAVOID-19',style: GoogleFonts.dosis(fontSize: 50,fontWeight: FontWeight.bold)),
                Text('تجنب كورونا',style: GoogleFonts.elMessiri(fontSize: 40,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
