import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:rj_studio/background/allbackground.dart';
import 'package:rj_studio/screen/audio/main_audio.dart';
import 'package:rj_studio/screen/photoshoot_service.dart';
import 'package:rj_studio/screen/printing_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String name = '';
  String email = '';
  int locate = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _get();
      setState(() {
        build(context);
      });
    });
  }


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
              text: 'RJ Studio',
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            child: Column(
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30,),
                            Row(
                              children: [
                                Text(
                                  'Hi $name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: color,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Welcome to RJ Studio ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: color),
                            ),
                          ],
                        ),
                        // Image(
                        //   height: 120,
                        //   image: AssetImage('assests/rj_icon.jpg'),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: color,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Printing_Service()),
                            );
                          },
                          leading: Padding(
                            padding: EdgeInsets.all(2),
                            child: LineIcon.print(
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          title: Text(
                            "Printing Services",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          subtitle: Text(
                            "Photo Album Printing,Poster Calendar and etc",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          trailing: LineIcon.chevronRight(
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: color,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Photoshoot_Service()),
                            );
                          },
                          leading: Padding(
                            padding: EdgeInsets.all(2),
                            child: LineIcon.retroCamera(
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          title: Text(
                            "Photoshoot Services",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          subtitle: Text(
                            "Family Potraits, Individual Potraits and etc.",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          trailing: LineIcon.chevronRight(
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: color,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainAudio()),
                            );
                          },
                          leading: Padding(
                            padding: EdgeInsets.all(2),
                            child: LineIcon.alternateMicrophone(
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          title: Text(
                            "Audio & Visual Equipment Rental Service",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          subtitle: Text(
                            "Camera, Microphone and etc",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          trailing: LineIcon.chevronRight(
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _get() async{
    final pref = await SharedPreferences.getInstance();
    name = pref.getString('custName')!;
  }


}