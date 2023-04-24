import 'package:flutter/material.dart';
import 'package:rj_studio/screen/service_booking.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CallApi/CallApi.dart';
import '../model/photoshootservice.dart';

class Photoshoot_Service extends StatefulWidget {
  const Photoshoot_Service({Key? key}) : super(key: key);

  @override
  State<Photoshoot_Service> createState() => _Photoshoot_ServiceState();
}

class _Photoshoot_ServiceState extends State<Photoshoot_Service> {



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
        body: FutureBuilder<List<PhotoShootService>>(
          future: CallApi.getpsService(),
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


Widget buildCart(List<PhotoShootService> services)=> ListView.builder(

  physics: BouncingScrollPhysics(),
  itemCount: services.length,
  itemBuilder: (BuildContext context,int index){
    final ser = services[index];
    return GestureDetector(
      onTap: () async {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Service_Booking()));
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('package_name',ser.package_name);
          prefs.setString('price',ser.price);
          prefs.setString('line1',ser.line1);
          prefs.setString('line2', ser.line2);
          prefs.setString('line3', ser.line3);
          prefs.setString('line4', ser.line4);
        },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        color: Color(0xFF9FB9FC),
        child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                Text(
                  ser.package_name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                ),
                Text(
                  ser.price,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                ),
                Text(
                  ("• "+ser.line1),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  ("• "+ser.line2),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  ("• "+ser.line3),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  ("• "+ser.line4),
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),

      ),
    );
  },

);
