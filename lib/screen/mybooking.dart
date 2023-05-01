import 'package:flutter/material.dart';
import 'package:rj_studio/model/booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CallApi/CallApi.dart';

class MyBooking_Page extends StatefulWidget {
  const MyBooking_Page({Key? key}) : super(key: key);

  @override
  State<MyBooking_Page> createState() => _MyBooking_PageState();
}

class _MyBooking_PageState extends State<MyBooking_Page> {

  @override
  Widget build(BuildContext context) {
    Color bgcolor = Color(0xFFFFFFFF);
    Color color = Color(0xFF5982FF);

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
              text: 'My Booking',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: FutureBuilder<List<Booking>>(
          future: CallApi.getMyBooking(),
          builder: (context,snapshot){
            final services = snapshot.data;

            switch (snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if(snapshot.hasError){
                  print(snapshot.error);
                  return Center(child: Text('Error: ${snapshot.error}'));
                }else{
                  return buildCart(services!);
                }
            }
          },
        ),
      ),
    );
  }
}

Widget buildCart(List<Booking> services)=> ListView.builder(

  physics: BouncingScrollPhysics(),
  itemCount: services.length,
  itemBuilder: (BuildContext context,int index){
    final ser = services[index];
    return GestureDetector(
      onTap: () async {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => Service_Booking()));
        // final prefs = await SharedPreferences.getInstance();
        // prefs.setString('package_name',ser.package_name);
        // prefs.setString('price',ser.price);
        // prefs.setString('line1',ser.line1);
        // prefs.setString('line2', ser.line2);
        // prefs.setString('line3', ser.line3);
        // prefs.setString('line4', ser.line4);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Color(0xFF9FB9FC),
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 20,),
              Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Text(
                    "Package Name ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                  Text(
                    "Category  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Date  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Time  ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Price ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Phone Number ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Text(
                    " : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                  Text(
                    " : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " : ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " : ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " : ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    " : ",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(height: 10,),
                  Text(
                    ser.package,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                  Text(
                    ser.category,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    ser.date,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    ser.time,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    ser.price,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    ser.phonenum,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  },

);
