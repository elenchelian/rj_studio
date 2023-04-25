import 'package:flutter/material.dart';
import 'package:rj_studio/screen/credit_card.dart';
import 'package:rj_studio/screen/home.dart';
import 'package:rj_studio/screen/nav/NavPage.dart';
import 'package:rj_studio/screen/photoshoot_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../background/allbackground.dart';

class Confirm_Booking extends StatefulWidget {
  const Confirm_Booking({Key? key}) : super(key: key);

  @override
  State<Confirm_Booking> createState() => _Confirm_BookingState();
}

class _Confirm_BookingState extends State<Confirm_Booking> {
  var getPackagename = '';
  var getPrice = '';
  var getLine1 = '';
  var getLine2 = '';
  var getLine3 = '';
  var getLine4 = '';
  var getDate = '';

  @override
  void initState() {
    super.initState();
    // setName=UserSharedPreference.getName();
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
                text: 'Booking Details',
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

            child: Column(
              children: <Widget>[
                SizedBox(height: 50,),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),

                  color: Color(0xFF6D8FFA),
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          children: <Widget>[
                            SizedBox(height: 10,width: 190,),
                            Text(
                              'Customer Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Phone Number',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Package',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Date',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            SizedBox(height: 80,),
                            Text(
                              'Total Amount',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text(
                              ' : ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              ' : ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              ' : ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              ' : ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            SizedBox(height: 80,),
                            Text(
                              ' : ',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            SizedBox(height: 10),
                            Text(
                              getPackagename,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                   fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              getPrice,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                   fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              getPackagename,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                   fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                            Text(
                              getDate,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                   fontSize: 20),
                            ),
                            SizedBox(height: 80,),
                            Text(
                              getPrice,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  'Payment Method : ',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Color(0xFF7DA0FA),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>Credit_Card())
                                  );
                                },
                                child: const Center(
                                  child: Text(
                                    "Credit Card",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7DA0FA),
                                      Color(0xFF6D8EF9),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Color(0xFF7DA0FA),
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder:(context)=>NavPage())
                                  );
                                },
                                child: const Center(
                                  child: Text(
                                    "Cancel Booking",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7DA0FA),
                                      Color(0xFF6D8EF9),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
  _get() async {
    final pref = await SharedPreferences.getInstance();
    getPackagename = pref.getString('package_name')!;
    getPrice = pref.getString('price')!;
    getLine1 = pref.getString('line1')!;
    getLine2 = pref.getString('line2')!;
    getLine3 = pref.getString('line3')!;
    getLine4 = pref.getString('line4')!;
    getDate = pref.getString('date')!;

    print(
        getPackagename + getPrice + getLine1 + getLine2 + getLine3 + getLine4);
  }
}
