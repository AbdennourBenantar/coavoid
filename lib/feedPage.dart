import 'package:coavoid/Finsh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(140,223,224,1.0),
      body: Center(
        child: CarouselSlider(
          enableInfiniteScroll: false,
          aspectRatio: 16/9,
          height: MediaQuery.of(context).size.height*0.75,
          items: [1,2,3,4,5,6,7].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    margin: EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          Text('Tip $i', style:GoogleFonts.nunitoSans(fontSize: 20,fontWeight: FontWeight.bold)),
                          Image.asset("assets/tip$i.png",width: 250,height: 250,),
                          i==1?Text('Cover your mouth and nose with a tissue when you cough or sneeze.\n  \n غطي فمك وأنفك بمنديل عند السعال أو العطس',textAlign: TextAlign.center,style: GoogleFonts.libreBaskerville(fontSize: 18),):
                              i==2?Text('Clean your hands often.\n \n نظف يديك كثيرًا',textAlign: TextAlign.center,style: GoogleFonts.libreBaskerville(fontSize: 18)):
                                  i==3?Text('Avoid close contact.\n \n تجنب الاتصال الوثيق',textAlign: TextAlign.center,style: GoogleFonts.libreBaskerville(fontSize: 18)):
                                      i==4?Text('Stay home if you’re sick.\n \n ابق في المنزل إذا كنت مريضًا',textAlign: TextAlign.center,style: GoogleFonts.libreBaskerville(fontSize: 18)):
                                          i==5?Text('Cover coughs and sneezes.\n \n غطِ السعال والعطس',textAlign: TextAlign.center,style: GoogleFonts.libreBaskerville(fontSize: 18)):
                                              i==6?Text('Wear a facemask if you are sick.\n \n ضع قناع للوجه إذا كنت مريضًا',textAlign: TextAlign.center,style: GoogleFonts.libreBaskerville(fontSize: 18)):Text('Clean and disinfect\n \n نظف وعقم',textAlign: TextAlign.center,style: GoogleFonts.libreBaskerville(fontSize: 18)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height*0.1,
                          ),
                          i==7?RaisedButton(
                            child: Text('Stay Safe Please',style: GoogleFonts.josefinSans(color: Colors.white,fontSize: 25),),
                            color: Color.fromRGBO(140,223,224,1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context)=>Finish()
                              ));
                            },
                          ):SizedBox(height: 0,)
                        ],
                      ),
                    ),

                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
