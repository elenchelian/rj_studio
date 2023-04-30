import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rj_studio/CallApi/CallApi.dart';
import 'package:rj_studio/auth/register.dart';
import 'package:rj_studio/screen/home.dart';
import 'package:rj_studio/screen/nav/NavPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../background/background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String email = '';
  String password = '';
  String name = '';
  String phoneNumber='';
  bool passPage= false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Background(
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
                child: TextFormField(
                  validator: (value){
                    if(value==null|| value.isEmpty ){
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  onChanged: (val){
                    email = val;
                  },
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please enter the Password';
                    }
                    return null;
                  },
                  onChanged: (val){
                    password = val;
                  },
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
                                if(_formKey.currentState!.validate()){
                                  _login();
                                }
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
      ),
    );

  }
  _login() async{
    var data = {
      'email':email,
      'password':password,
    };

    var res = await CallApi().LoginData(data, 'login');
    var get = json.decode(res.body);

    if(get['success']){
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('custName', get['name']);
      prefs.setString('custEmail', get['email']);
      prefs.setString('custPassword', get['password']);
      prefs.setString('custPhoneNumber', get['phone_number']);

      name=prefs.getString('custName')!;
      email=prefs.getString('custEmail')!;
      password=prefs.getString('custPassword')!;
      phoneNumber=prefs.getString('custPhoneNumber')!;
      print('Geting userinfo'+name+email+password+phoneNumber);
      Fluttertoast.showToast(msg: "Login Successfully");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>NavPage()));
    }else{
      Fluttertoast.showToast(msg: "Invalid Credential");
    }

  }

}
