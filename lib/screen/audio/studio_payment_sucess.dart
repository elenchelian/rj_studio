import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../CallApi/PdfApi.dart';
import '../../background/allbackground.dart';
import '../nav/NavPage.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';



// import 'package:pdf/widgets.dart' as pw;

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
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                                onTap: () async {
                                  _createPDF();
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

  Future<void> _createPDF() async {
    final pref = await SharedPreferences.getInstance();
    getPackagename = pref.getString('studio_package')!;
    getPrice = pref.getString('studio_price')!;
    getDate = pref.getString('studio_date')!;
    getTime = pref.getString('studio_timeslot')!;
    getCustName = pref.getString('custName')!;
    getCustPhoneNumber = pref.getString('custPhoneNumber')!;

    PdfDocument document = PdfDocument();

    PdfGrid grid = PdfGrid();

    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 30),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Pkg Name';
    header.cells[1].value = getPackagename;
    // header.cells[2].value = 'Time';
    // header.cells[3].value = 'Price';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Date';
    row.cells[1].value = getDate;

    row = grid.rows.add();
    row.cells[0].value = 'Time';
    row.cells[1].value = getTime;

    row = grid.rows.add();
    row.cells[0].value = 'Price';
    row.cells[1].value = getPrice;


    grid.draw(
        page: document.pages.add(), bounds: const Rect.fromLTWH(0, 80, 0, 0));

    PdfPage page = document.pages[0];
    page.graphics.drawString(
        'RJ Studio Payment Receipt', PdfStandardFont(PdfFontFamily.helvetica, 40),
        brush: PdfBrushes.black, bounds: Rect.fromLTWH(80, 10, 400, 60));

    page.graphics.drawString(
        'Please show this receipt at \nthe counter.', PdfStandardFont(PdfFontFamily.helvetica, 30),
        brush: PdfBrushes.black, bounds: Rect.fromLTWH(10, 350, 600, 200));
    _readImageData();

    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'Receipt.pdf');
  }
  Future<Uint8List> _readImageData() async {
    final data = await rootBundle.load('assests/rj_icon.jpg');
    return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
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
