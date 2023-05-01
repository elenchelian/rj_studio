import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rj_studio/screen/audio/studio_booking.dart';
import 'package:rj_studio/screen/audio/studio_payment_sucess.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../.env';
import '../../CallApi/CallApi.dart';
import '../../background/allbackground.dart';
import '../confirm_booking.dart';
import '../payment_Suc.dart';


class AudioCredit extends StatefulWidget {
  const AudioCredit({Key? key}) : super(key: key);

  @override
  State<AudioCredit> createState() => _AudioCreditState();
}

class _AudioCreditState extends State<AudioCredit> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name='';
  String email='';
  String package='';
  String date='';
  String price='';
  String time ='';
  String category='Studio';
  String phoneNumber='';

  @override
  void initState() {
    _get();
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Color bgcolor = Color(0xFFFFFFFF);
    Color color = Color(0xFF5982FF);
    return MaterialApp(
      title: 'Credit Card',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          leading: const BackButton(
            color: Colors.white, // <-- SEE HERE
          ),
          title: RichText(
            text: TextSpan(
              text: 'Studio Credit Card Payment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: AllBackground(
          child: Container(
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   image: ExactAssetImage('assets/bg.png'),
              //   fit: BoxFit.fill,
              // ),
              // color: Colors.blueAccent,
            ),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  CreditCardWidget(
                    glassmorphismConfig:
                    useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Credit Card',
                    frontCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.black) : null,
                    backCardBorder:
                    !useGlassMorphism ? Border.all(color: Colors.black) : null,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: Colors.blueAccent,
                    // backgroundImage:
                    // useBackgroundImage ? 'assets/card_bg.png' : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      // CustomCardTypeIcon(
                      //   cardType: CardType.mastercard,
                      //   cardImage: Image.asset(
                      //     'assets/mastercard.png',
                      //     height: 48,
                      //     width: 48,
                      //   ),
                      // ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: cardNumber,
                            cvvCode: cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: cardHolderName,
                            expiryDate: expiryDate,
                            themeColor: Colors.blue,
                            textColor: Colors.black,
                            cardNumberDecoration: InputDecoration(
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                            ),
                            expiryDateDecoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                              labelText: 'Expired Date',
                              hintText: 'XX/XX',
                            ),
                            cvvCodeDecoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                              labelText: 'CVV',
                              hintText: 'XXX',
                            ),
                            cardHolderDecoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.black),
                              labelStyle: const TextStyle(color: Colors.black),
                              focusedBorder: border,
                              enabledBorder: border,
                              labelText: 'Card Holder',
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 16),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: <Widget>[
                          //       const Text(
                          //         'Glassmorphism',
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 18,
                          //         ),
                          //       ),
                          //       const Spacer(),
                          //       Switch(
                          //         value: useGlassMorphism,
                          //         inactiveTrackColor: Colors.grey,
                          //         activeColor: Colors.black,
                          //         activeTrackColor: Colors.redAccent,
                          //         onChanged: (bool value) => setState(() {
                          //           useGlassMorphism = value;
                          //         }),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 16),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: <Widget>[
                          //       const Text(
                          //         'Card Image',
                          //         style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 18,
                          //         ),
                          //       ),
                          //       const Spacer(),
                          //       Switch(
                          //         value: useBackgroundImage,
                          //         inactiveTrackColor: Colors.grey,
                          //         activeColor: Colors.white,
                          //         activeTrackColor: Colors.redAccent,
                          //         onChanged: (bool value) => setState(() {
                          //           useBackgroundImage = value;
                          //         }),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: _onValidate,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF7DA0FA),
                                        Color(0xFF6D8EF9),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)
                                // borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                'Validate',
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontFamily: 'halter',
                                  fontSize: 18,
                                  package: 'flutter_credit_card',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          GestureDetector(
                            onTap: (){

                              Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=>StudioBooking())
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF7DA0FA),
                                        Color(0xFF6D8EF9),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter)
                                // borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                'Cancel Payment',
                                style: TextStyle(
                                  color: Colors.white,
                                  // fontFamily: 'halter',
                                  fontSize: 18,
                                  package: 'flutter_credit_card',
                                ),
                              ),
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
        ),
      ),
    );
  }

  void _onValidate() async{

    if (formKey.currentState!.validate()) {
      var data = {
        'name':name,
        'email':email,
        'phonenum':phoneNumber,
        'package':package,
        'price':price,
        'time':time,
        'date':date,
        'category':category
      };

      var res = await CallApi().BookingSet(data,'register');
      var getVal = json.decode(res.body);
      if(getVal['success']){
        Fluttertoast.showToast(msg: "The Booking Successful");
        Navigator.push(context,
            MaterialPageRoute(builder:(context)=>StudioPaymentSuc())
        );
      }else{
        Fluttertoast.showToast(msg: "Cannot Proceed the Booking");
      }
    } else {
      print('invalid!');
    }
  }

  _get() async{
    final pref = await SharedPreferences.getInstance();
    name = pref.getString('custName')!;
    email=pref.getString('custEmail')!;
    phoneNumber=pref.getString('custPhoneNumber')!;
    package=pref.getString('studio_package')!;
    price = pref.getString('studio_price')!;
    date = pref.getString('studio_date')!;
    time = pref.getString('studio_timeslot')!;
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void _stripe() async{
    WidgetsFlutterBinding.ensureInitialized();
    Stripe.publishableKey = stripePublishableKey;
    await Stripe.instance.applySettings();
  }
}
