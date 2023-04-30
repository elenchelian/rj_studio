import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rj_studio/CallApi/CallApi.dart';
import 'package:rj_studio/background/allbackground.dart';

import '../background/background.dart';
import 'login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  String name ='';
  String email = '';
  String phoneNumber = '';
  String password = '';
  String Cpassword = '';

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                  "REGISTER",
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

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  validator: (value){
                    if(value==null || value.isEmpty){
                      return 'Please enter your Confirm Password';
                    }
                    return null;
                  },
                  onChanged: (val){
                    Cpassword=val;
                  },
                  decoration: InputDecoration(
                      labelText: "Confirm Password"
                  ),
                  obscureText: true,
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
                              splashColor: Color(0xFFFFB129),
                              onTap: () {
                                if(_formKey.currentState!.validate()){
                                  _register();
                                }
                              },
                              child: const Center(
                                child: Text(
                                  "SIGN UP",
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                  },
                  child: Text(
                    "Already Have an Account? Sign in",
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

_register()async{
    var data = {
      'name':name,
      'email':email,
      'phone_number':phoneNumber,
      'password':password
    };

    if(password==Cpassword){
      var res = await CallApi().RegisterData(data,'register');
      var getVal = json.decode(res.body);

      if(getVal['success']){
        Fluttertoast.showToast(msg: "Account created Successfully");
        Navigator.push(context,
            MaterialPageRoute(builder:(context)=>LoginScreen())
        );
      }else{
        Fluttertoast.showToast(msg: "SignUp Failed");
      }
    }else{
      Fluttertoast.showToast(msg: "Password doesn't match");
    }


}

}
