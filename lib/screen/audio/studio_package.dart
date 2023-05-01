import 'package:flutter/material.dart';
import 'package:rj_studio/background/allbackground.dart';
import 'package:rj_studio/screen/audio/studio_booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudioPackage extends StatefulWidget {
  const StudioPackage({Key? key}) : super(key: key);

  @override
  State<StudioPackage> createState() => _StudioPackageState();
}

class _StudioPackageState extends State<StudioPackage> {
  Color bgcolor = Color(0xFFFFFFFF);
  Color color= Color(0xFF5982FF);

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
          body: AllBackground(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFF89A4F8),
                    child: Container(
                      height: 220,
                      width: 350,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text('2 Hours Booking',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              // decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 22),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          SizedBox(height: 15,),
                          Text('• Studio Rental Only',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Photographer not included',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Price RM 300.00',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
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
                                    pref.setString('studio_package', '2 Hours')!;
                                    pref.setString('studio_price', 'RM 300.00')!;
                                    pref.setStringList('studio_book_time',['8.00 a.m. - 10.00 a.m.','12.00 p.m - 2.00 p.m','4.00 p.m. - 6.00 p.m.']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StudioBooking()),
                                    );
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
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFF89A4F8),
                    child: Container(
                      height: 220,
                      width: 350,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text('5 Hours Booking',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              // decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 22),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          SizedBox(height: 15,),
                          Text('• Studio Rental Only',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Photographer not included',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Price RM 600.00',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
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
                                  onTap: () async {
                                    final pref = await SharedPreferences.getInstance();
                                    pref.setString('studio_package', '5 Hours')!;
                                    pref.setString('studio_price', 'RM 600.00')!;
                                    pref.setStringList('studio_book_time',['8.00 a.m. - 1.00 p.m.','2.00 p.m - 7.00 p.m']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StudioBooking()),
                                    );
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
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFF89A4F8),
                    child: Container(
                      height: 220,
                      width: 350,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text('6 Hours Booking',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              // decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 22),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          SizedBox(height: 15,),
                          Text('• Studio Rental Only',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Photographer not included',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Price RM 750.00',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
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
                                    pref.setString('studio_package', '6 Hours')!;
                                    pref.setString('studio_price', 'RM 750.00')!;
                                    pref.setStringList('studio_book_time',['8.00 a.m. - 2.00 p.m.','3.00 p.m - 9.00 p.m']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StudioBooking()),
                                    );
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
                  SizedBox(height: 20,),
                  Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Color(0xFF89A4F8),
                    child: Container(
                      height: 220,
                      width: 350,
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Text('12 Hours Booking',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              // decoration: TextDecoration.underline,
                              color: Colors.white,
                              fontSize: 22),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          SizedBox(height: 15,),
                          Text('• Studio Rental Only',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Photographer not included',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
                          Text('• Price RM 1500.00',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 20,),
                          ),
                          SizedBox(height: 5,),
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
                                  onTap: ()async {
                                    final pref = await SharedPreferences.getInstance();
                                    pref.setString('studio_package', '12 Hours')!;
                                    pref.setString('studio_price', 'RM 1500.00')!;
                                    pref.setStringList('studio_book_time',['8.00 a.m. - 8.00 p.m.']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StudioBooking()),
                                    );
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
                  SizedBox(height: 20,),
                ],

              ),
            ),

          ),
        )
    );
  }
}
