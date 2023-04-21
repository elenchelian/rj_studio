import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  @override
  void initState()  {
    super.initState();
    // setName=UserSharedPreference.getName();
    WidgetsBinding.instance?.addPostFrameCallback((_){
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
        body: Container(

          child: Column(
            children: <Widget>[
              SizedBox(height: 50,),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                color: Color(0xFF9FB9FC),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10,width: 380,),
                      Text(
                        getPackagename,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                      ),
                      Text(
                        getPrice,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                      ),
                      Text(
                        ("• "+getLine1),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        ("• "+getLine2),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        ("• "+getLine3),
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        ("• "+getLine4),
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
                style: TextStyle(fontSize:22),
              ),
            ],
          ),
        )
      ),
    );
  }
  _get() async{
    final pref =await SharedPreferences.getInstance();
    getPackagename = pref.getString('package_name')!;
    getPrice = pref.getString('price')!;
    getLine1 = pref.getString('line1')!;
    getLine2 = pref.getString('line2')!;
    getLine3 = pref.getString('line3')!;
    getLine4 = pref.getString('line4')!;

    print(getPackagename+getPrice+getLine1+getLine2+getLine3+getLine4);
  }
}


