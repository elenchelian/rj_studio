import 'dart:convert';

import 'package:calendar_builder/calendar_builder.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rj_studio/CallApi/CallApi.dart';
import 'package:rj_studio/background/allbackground.dart';
import 'package:rj_studio/screen/confirm_booking.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Service_Booking extends StatefulWidget {
  const Service_Booking({Key? key}) : super(key: key);

  @override
  State<Service_Booking> createState() => _Service_BookingState();
}

class _Service_BookingState extends State<Service_Booking> {

  var getPackagename = '';
  var getPrice = '';
  var getLine1 = '';
  var getLine2 = '';
  var getLine3 = '';
  var getLine4 = '';

  String date = '';
  String time = '';
  List list = [];
  // List<Map<String, dynamic>> list = [];

  // final dates = list.map(DateTime.parse).toList();
  String dates123 = "2023,06,06" ;
  List<DateTime> _dates = [];


  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // setName=UserSharedPreference.getName();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _get();
      fetchdetails();
      // _splitdate();
      setState(() {
        build(context);
      });

      // _dates.add(DateTime(2023, 6, 6));
      // _dates.add(DateTime(2023, 6, 7));
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
                text: 'Photo and Album Printing',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,

                ),
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: AllBackground(

              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      color: Color(0xFF6D8FFA),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 10, width: 380,),
                            Text(
                              getPackagename,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Text(
                              getPrice,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                            ),
                            Text(
                              ("• " + getLine1),
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              ("• " + getLine2),
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              ("• " + getLine3),
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              ("• " + getLine4),
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    const Text(
                      ('Please Select preferred data for photoshoot.'),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                        height: 300,
                        width: 300,

                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: Color(0xFFD6DDFF)
                          ),
                          child: CbMonthBuilder(
                            cbConfig: CbConfig(
                                startDate: DateTime.now(),
                                endDate: DateTime(2050),
                                selectedDate: DateTime.now(),
                                selectedYear: DateTime(2023),
                                eventDates:_dates,
                              disabledDates: [
                                // DateTime(2023, 4, 24),
                              ],
                            ),
                            onDateClicked: (onDateClicked) {
                              if (onDateClicked.hasEvent) {
                                // Fluttertoast.showToast(
                                //     msg: "This is Center Short Toast",
                                //     toastLength: Toast.LENGTH_SHORT,
                                //     gravity: ToastGravity.CENTER,
                                //     timeInSecForIosWeb: 1,
                                //     backgroundColor: Colors.red,
                                //     textColor: Colors.black,
                                //     fontSize: 16.0
                                // );
                                print('The is already booked for another event');
                              }
                              else if(onDateClicked.isDisabled){
                                print('The is not available for booking');
                              }
                            },
                          ),
                        )
                    ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'd MMM, yyyy',
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Select Date',
                    selectableDayPredicate: (date) {

                      if (_dates.contains(date)) {
                        return false;
                      }
                      return true;
                    },
                    onChanged: (val) {
                      setState(() {
                        date=val;
                      });
                    },
                    validator: (val) {
                      if(val==null || val.isEmpty){
                        return 'Please Select your Date';
                      }
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                  ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: DateTimePicker(
                        type: DateTimePickerType.time,
                        icon: Icon(Icons.punch_clock),
                        timeLabelText: "Select Time",
                        onChanged: (val) {
                          setState(() {
                            time=val;
                          });
                        },
                        validator: (val) {
                          if(val==null || val.isEmpty){
                            return 'Please Select your Time';
                          }
                          return null;
                        },
                        onSaved: (val) => print(val),
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
                                      if(_formKey.currentState!.validate()){
                                        _register();
                                      }
                                    },
                                    child: const Center(
                                      child: Text(
                                        "Confirm Booking",
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
              ),
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

    print(
        getPackagename + getPrice + getLine1 + getLine2 + getLine3 + getLine4);

    // var data = CallApi.getMyBookingDate();
    // print('start date');
    // print(data.toString());
    // list=data;

  }

  Future<Map<String, dynamic>> fetchdetails() async {
    final url = 'http://10.0.2.2:8000/api/dateservice';

    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      list=data;
      // print(list);
      _splitdate();
      return data;
    } else {
      throw Exception('Failed to fetch city counter detail');
    }
  }

  _splitdate() async{
    var getvar;
    print('Start split');
    print(list);
    print(list.length);
    for(int i=0;i<list.length;i++){
      getvar = list[i];
      String getval = getvar.toString();
      String selectedNum=getval.substring(7,11);
      String selectedNum1=getval.substring(12,14);
      String selectedNum2=getval.substring(15,17);
      var year = int.parse(selectedNum);
      var month = int.parse(selectedNum1);
      var day = int.parse(selectedNum2);
      _dates.add(DateTime(year, month, day));
    }
    print("print date list");
    print(_dates);
  }

  _register() async{
    if(date != null && time !=null){
      final pref = await SharedPreferences.getInstance();
      pref.setString('date',date);
      pref.setString('time', time);
      print(date);
      Navigator.push(context,
          MaterialPageRoute(builder:(context)=>Confirm_Booking())
      );
    }

  }

}


