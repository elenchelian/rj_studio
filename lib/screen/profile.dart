import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../CallApi/CallApi.dart';
import '../auth/login.dart';
import '../background/allbackground.dart';
import 'nav/NavPage.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  String name ='';
  String email = '';
  String phoneNumber = '';
  String password = '';

  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _get();
      setState(() {
        build(context);
      });
    });
  }

  final TextEditingController NameController = new TextEditingController();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController PhoneController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  NameController.text=name;
  EmailController.text=email;
  PhoneController.text=phoneNumber;
  PasswordController.text=password;

    return Scaffold(
      body: Form(
        key: _formKey,
        child: AllBackground(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Update Profile",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height:10),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: NameController,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return 'Please Enter your Name';
                    }
                    return null;
                  },
                  onChanged: (val){
                    name = val;
                  },
                  decoration: InputDecoration(
                      labelText: "Name"
                  ),
                ),
              ),

              SizedBox(height: 10),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  enabled: false,
                  controller: EmailController,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Please enter your Email';
                    }
                    return null;
                  },
                  onChanged: (val){
                    email=val;
                  },
                  decoration: InputDecoration(
                      labelText: "Email"
                  ),
                ),
              ),

              SizedBox(height: 10),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: PhoneController,
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Please enter your Phone Number';
                    }
                    return null ;
                  },
                  onChanged: (val){
                    phoneNumber=val;
                  },
                  decoration: InputDecoration(
                      labelText: "Phone Number"
                  ),
                ),
              ),

              SizedBox(height: 10),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: PasswordController,
                  validator: (value){
                    if(value==null ||value.isEmpty){
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  onChanged: (val){
                    password=val;
                  },
                  decoration: InputDecoration(
                      labelText: "Password"
                  ),
                  obscureText: true,
                ),
              ),


              SizedBox(height: 10),




              SizedBox(height: 10),

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
                                  _update();
                                }
                              },
                              child: const Center(
                                child: Text(
                                  "Update Profile",
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

              SizedBox(height: 10),

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
                              splashColor: Color(0xFF63C5FF),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder:(context)=>LoginScreen())
                                );

                              },
                              child: const Center(
                                child: Text(
                                  "Log Out",
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

            ],
          ),
        ),
      ),
    );
  }

  _get() async{
    final pref = await SharedPreferences.getInstance();
    name = pref.getString('custName')!;
    email=pref.getString('custEmail')!;
    phoneNumber=pref.getString('custPhoneNumber')!;
    password=pref.getString('custPassword')!;
    print(name+email+phoneNumber+password);
  }

  _update() async{
    var data = {
      'name': name,
      'email' : email,
      'phone_number':phoneNumber,
      'password':password,
    };
    var res = await CallApi().UpdateProfile(data,'register');
    var get= json.decode(res.body);

  if(get['success']){
    Fluttertoast.showToast(msg: "Account Updated Successfully");
    Navigator.push(context,
        MaterialPageRoute(builder:(context)=>LoginScreen())
    );
  }else{
    Fluttertoast.showToast(msg: "Account Update Failed");
  }

  }
}
