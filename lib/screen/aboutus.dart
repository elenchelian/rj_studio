import 'package:flutter/material.dart';

import '../background/allbackground.dart';

class About_Us extends StatefulWidget {
  const About_Us({Key? key}) : super(key: key);

  @override
  State<About_Us> createState() => _About_UsState();
}

class _About_UsState extends State<About_Us> {
  @override
  Widget build(BuildContext context) {
    Color bgcolor = Color(0xFFFFFFFF);
    Color color= Color(0xFF5982FF);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          backgroundColor: color,
          title: RichText(
            text: TextSpan(
              text: 'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: AllBackground(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              height: size.height,
              child: Center(
               child:Column(
                 children:  <Widget>[
                   const SizedBox(height: 30,),
                   Image.asset(
                       "assests/rj_icon.jpg",
                       width: size.width * 0.30
                   ),
                   const SizedBox(height: 20,),
                   const Text(
                     "RJ Studio",
                     textAlign: TextAlign.center,
                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),
                   ),
                   const SizedBox(height: 35,),
                   Row(
                     children:const <Widget>[
                       SizedBox(width: 20,),
                       Text(
                         "Location : ",
                         textAlign: TextAlign.center,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                       SizedBox(width: 20),
                       Text(
                         "No.13 Jalan Susur Mutiara,\nTaman Mutiara, \n83300, Sri Ganding,\nBatu Pahat, \nJohor.",
                         textAlign: TextAlign.left,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children:const <Widget>[
                       SizedBox(width: 20,),
                       Text(
                         "Whatsapp : ",
                         textAlign: TextAlign.center,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                       SizedBox(width: 10),
                       Text(
                         "012-3440018",
                         textAlign: TextAlign.left,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children:const <Widget>[
                       SizedBox(width: 20,),
                       Text(
                         "Email         : ",
                         textAlign: TextAlign.center,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                       SizedBox(width: 10),
                       Text(
                         "studio.rj@gmail.com",
                         textAlign: TextAlign.left,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children:const <Widget>[
                       SizedBox(width: 20,),
                       Text(
                         "Instagram : ",
                         textAlign: TextAlign.center,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                       SizedBox(width: 10),
                       Text(
                         "@stduio.rj125",
                         textAlign: TextAlign.left,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                     ],
                   ),
                   SizedBox(height: 10,),
                   Row(
                     children:const <Widget>[
                       SizedBox(width: 20,),
                       Text(
                         "Facebook  : ",
                         textAlign: TextAlign.center,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                       SizedBox(width: 10),
                       Text(
                         "Rj Studio",
                         textAlign: TextAlign.left,
                         style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                       ),
                     ],
                   ),
                 ],
               )

              ),

            ),
          ),
        ),
      ),
    );
  }
}
