import 'package:flutter/material.dart';
// import 'package:example/app_colors.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:rj_studio/background/allbackground.dart';
import 'package:rj_studio/screen/confirm_booking.dart';
import 'package:rj_studio/screen/payment_Suc.dart';

class Credit_Card extends StatefulWidget {
  const Credit_Card({Key? key}) : super(key: key);

  @override
  State<Credit_Card> createState() => _Credit_CardState();
}

class _Credit_CardState extends State<Credit_Card> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
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
              text: 'Credit Card Payment',
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
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: Image.asset(
                          'assets/mastercard.png',
                          height: 48,
                          width: 48,
                        ),
                      ),
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
                                  MaterialPageRoute(builder:(context)=>Confirm_Booking())
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

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
      Navigator.push(context,
          MaterialPageRoute(builder:(context)=>Payment_Successfull())
      );
    } else {
      print('invalid!');
    }
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
}

