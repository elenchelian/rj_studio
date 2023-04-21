import 'package:flutter/material.dart';
import 'package:rj_studio/auth/register.dart';
import 'package:rj_studio/screen/home.dart';
import 'package:rj_studio/screen/nav/NavPage.dart';

import '../background/background.dart';



class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Email"
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Password"
                ),
                obscureText: true,
              ),
            ),

            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            //   child: Text(
            //     "Forgot your password?",
            //     style: TextStyle(
            //         fontSize: 12,
            //         color: Color(0XFF2661FA)
            //     ),
            //   ),
            // ),

            SizedBox(height: size.height * 0.05),

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
                            splashColor: Color(0xFFFFB129),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=>NavPage())
                              );
                            },
                            child: const Center(
                              child: Text(
                                "LOGIN",
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
                                  Color.fromARGB(255, 255, 136, 34),
                                  Color.fromARGB(255, 255, 177, 41)
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
              child: GestureDetector(
                onTap: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()))
                },
                child: Text(
                  "Don't Have an Account? Sign up",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA)
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}