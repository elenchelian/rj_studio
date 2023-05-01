import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../CallApi/PdfApi.dart';
import '../../background/allbackground.dart';
import '../nav/NavPage.dart';

class StudioPaymentSuc extends StatefulWidget {
  const StudioPaymentSuc({Key? key}) : super(key: key);

  @override
  State<StudioPaymentSuc> createState() => _StudioPaymentSucState();
}

class _StudioPaymentSucState extends State<StudioPaymentSuc> {
  var getPackagename = '';
  var getPrice = '';
  var getCustName = '';
  var getCustPhoneNumber = '';
  var getDate = '';
  var getTime ='';

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
                text: 'Payment Page',
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

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Center(
                    // margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Payment Successful',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        SizedBox(height: 50,),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Customer Name',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  'Phone Number',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  'Package Name',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  'Date',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  'Time Slot',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  'Amount',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  ' : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  ' : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  ' : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  ' : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  ' : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  ' : ',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),

                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  getCustName,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  getCustPhoneNumber,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  getPackagename,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  getDate,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  getTime,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  getPrice,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 15,),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 80,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7DA0FA),
                                      Color(0xFF6D8EF9),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                            child: Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                splashColor: Color(0xFF7DA0FA),
                                onTap: () {
                                  _pdf();
                                },
                                child: const Center(
                                  child: Text(
                                    "Download Receipt",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF7DA0FA),
                                      Color(0xFF6D8EF9),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
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
                                    "Back Home",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
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
              ],
            ),
          )
      ),
    );
  }
  _pdf() async{
    final pdfFile = await PdfApi.generateTable();
    PdfApi.openFile(pdfFile);
  }

  _get() async {
    final pref = await SharedPreferences.getInstance();
    getPackagename = pref.getString('studio_package')!;
    getPrice = pref.getString('studio_price')!;
    getDate = pref.getString('studio_date')!;
    getTime = pref.getString('studio_timeslot')!;
    getCustName = pref.getString('custName')!;
    getCustPhoneNumber = pref.getString('custPhoneNumber')!;

  }
}
