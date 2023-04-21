import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:rj_studio/background/allbackground.dart';
import 'package:rj_studio/screen/other_print.dart';
import 'package:rj_studio/screen/photo_album.dart';
import 'package:rj_studio/screen/wedding_card.dart';

class Printing_Service extends StatefulWidget {
  const Printing_Service({Key? key}) : super(key: key);

  @override
  State<Printing_Service> createState() => _Printing_ServiceState();
}

class _Printing_ServiceState extends State<Printing_Service> {

  @override
  Widget build(BuildContext context) {
    Color bgcolor = Color(0xFFFFFFFF);
    Color color= Color(0xFF5982FF);

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgcolor,

        appBar: AppBar(
          backgroundColor: color,
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
          ),
          title: RichText(
            text: TextSpan(
              text: 'Printing Services',
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
                SizedBox(height: 60,),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.5,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
                SizedBox(
                  width: 220,
                  height: 120,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: color,
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Photo_Album()),
                            );
                          },
                          leading: Padding(
                            padding: EdgeInsets.all(2),
                            child: LineIcon.images(
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Photo and Album Printing",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
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
                  width: 220,
                  height: 120,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: color,
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wedding_Card()),
                            );
                          },
                          leading: Padding(
                            padding: EdgeInsets.all(2),
                            child: LineIcon.mailBulk(
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Wedding Card",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
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
                  width: 220,
                  height: 120,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.5),
                    child: Card(
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: color,
                      child: Center(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Other_Print()),
                            );
                          },
                          leading: Padding(
                            padding: EdgeInsets.all(2),
                            child: LineIcon.plusSquare(
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            "Others",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 15,
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

}
