import 'package:flutter/material.dart';
import 'package:rj_studio/background/allbackground.dart';
import 'package:rj_studio/screen/audio/studio_package.dart';

class MainAudio extends StatefulWidget {
  const MainAudio({Key? key}) : super(key: key);

  @override
  State<MainAudio> createState() => _MainAudioState();
}

class _MainAudioState extends State<MainAudio> {
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
              text: 'Audio & Video Rental Service',
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
            children: [
              SizedBox(height: 50,),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: color,
                child: Container(
                  height: 330,
                  width: 350,
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Text('Studio Equipments',style: TextStyle(
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
                      Text('• 5x Professional Video LED Lights',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,),
                      Text('• 3x Studio Strobe Flash',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,),
                      Text('• Work Station',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,),
                      Text('• Changing Room',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,),
                      Text('• Make-up Table',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,),
                      Text('• Refreshment Area',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,),
                      Text('• 2 x 1.5 HMI Lights',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,),
                      Text('• 3 x Coloured Backdrops',style: TextStyle(
                        fontWeight: FontWeight.normal,
                        // decoration: TextDecoration.underline,
                        color: Colors.white,
                        fontSize: 20,),
                      ),
                      SizedBox(height: 5,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
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
                        height: 50,
                        child: Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Color(0xFF7DA0FA),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => StudioPackage()),
                                );
                              },
                              child: const Center(
                                child: Text(
                                  "Book Your Studio",
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
          ) ,
        ),
      ),
    );
  }
}
