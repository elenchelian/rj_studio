import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rj_studio/background/allbackground.dart';
import 'package:rj_studio/screen/audio/audio_Credit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class StudioBooking extends StatefulWidget {
  const StudioBooking({Key? key}) : super(key: key);

  @override
  State<StudioBooking> createState() => _StudioBookingState();
}

class _StudioBookingState extends State<StudioBooking> {
  Color bgcolor = Color(0xFFFFFFFF);
  Color color= Color(0xFF5982FF);

  List<String> list = <String> [''];
  // List list = [];

  String packageName='';
  String packagePrice='';
  String date = '';
  String? selectedTime;
  // String date = '';
  String time = '';
  List lists = [];
  var deposit;

  String dates123 = "2023,06,06" ;
  List<DateTime> _dates = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _get();
      fetchdetails();
        setState(() {
        build(context);
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: color,
            leading: const BackButton(
              color: Colors.white, // <-- SEE HERE
            ),
            title: RichText(
              text: TextSpan(
                text: 'Book Our Studio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,

                ),
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: _formKey,
            child: AllBackground(
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Text('Booking Details',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                      color: Colors.black,
                      fontSize: 23)
                  ),
                  SizedBox(height: 50,),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFF89A4F8),
                    child: Container(
                      height: 380,
                      width: 350,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Package Name ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Text(' : ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Text(packageName,style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Package Price ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Text(' : ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Text(packagePrice,style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Pick your Date ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Text(' : ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Container(
                                width: 150,
                                child: DateTimePicker(
                                  initialValue: '',
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100),
                                  dateLabelText: 'Date',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                  onChanged: (val) {
                                    date=val;
                                  },
                                  selectableDayPredicate: (date) {

                                    if (_dates.contains(date)) {
                                      return false;
                                    }
                                    return true;
                                  },
                                  validator: (val) {
                                    print(val);
                                    return null;
                                  },
                                  onSaved: (val) => print(val),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Time Slot ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Text(' : ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  isExpanded: true,
                                  hint: Row(
                                    children: const [

                                      SizedBox(
                                        width: 4,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Select Time Slot',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  items: list
                                      .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                                      .toList(),
                                  value: selectedTime,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedTime = value as String;
                                    });
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: 160,
                                    padding: const EdgeInsets.only(left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: Color(0xFF5982FF),
                                    ),
                                    elevation: 2,
                                  ),
                                  iconStyleData: const IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                    iconSize: 14,
                                    iconEnabledColor: Colors.white,
                                    iconDisabledColor: Colors.grey,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    maxHeight: 200,
                                    width: 200,
                                    padding: null,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Color(0xFF5982FF),
                                    ),
                                    elevation: 8,
                                    offset: const Offset(-20, 0),
                                    scrollbarTheme: ScrollbarThemeData(
                                      radius: const Radius.circular(40),
                                      thickness: MaterialStateProperty.all<double>(6),
                                      thumbVisibility: MaterialStateProperty.all<bool>(true),
                                    ),
                                  ),
                                  menuItemStyleData: const MenuItemStyleData(
                                    height: 40,
                                    padding: EdgeInsets.only(left: 14, right: 14),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: [
                              SizedBox(width: 20,),
                              Text('Deposit Amount ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Text(' : ',style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  // decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20)
                              ),
                              Container(
                                width: 150,
                                child: TextFormField(
                                keyboardType: TextInputType. number,
                                validator: (value){
                                  if(value==null|| value.isEmpty ){
                                    return 'Please enter your deposit';
                                  }
                                  return null;
                                },
                                onChanged: (val){
                                  deposit = val;
                                },
                                decoration: InputDecoration(
                                    labelText: "Deposit"
                                ),
                              ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Deposit is not refundable',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.red),
                          ),

                          SizedBox(height: 10,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 50,
                    child: Container(
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          splashColor: Color(0xFF7DA0FA),
                          onTap: () async{
                            final pref = await SharedPreferences.getInstance();
                            pref.setString('studio_date', date);
                            pref.setString('studio_timeslot', selectedTime!);
                            pref.setString('studio_deposit', deposit!);
                            if(_formKey.currentState!.validate()){
                              // _register();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AudioCredit()),
                              );
                            }


                          },
                          child: const Center(
                            child: Text(
                              "Book Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18
                              ),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xFF6189F1),
                                Color(0xFF3863EE),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                  ),




                ],
              ),
            ),
          ),
        )
    );
  }
  _get() async{
    final pref = await SharedPreferences.getInstance();
    packageName = pref.getString('studio_package')!;
    packagePrice = pref.getString('studio_price')!;
    list = pref.getStringList('studio_book_time')!;
  }

  Future<Map<String, dynamic>> fetchdetails() async {
    final url = 'http://10.0.2.2:8000/api/dateliststudio';

    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      lists=data;
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
    print(lists);
    print(lists.length);
    for(int i=0;i<lists.length;i++){
      getvar = lists[i];
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

}
