import 'package:flutter/material.dart';
import './Boarding.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

// ignore: must_be_immutable
class Payment extends StatefulWidget {
  var passenger;
  var clss;
  Payment(this.passenger, this.clss);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Payment",
            style: TextStyle(
              fontFamily: 'Courgette',
              color: Color(0xFFFFECF9),
              letterSpacing: 9,
              fontSize: 28,
            ),
          ),
        ),
        body: Stack(children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset("Images/air2.jpg",
                fit: BoxFit.cover, height: double.infinity),
          ),
          Positioned(
              top: 100,
              left: 9,
              child: SingleChildScrollView(
                  reverse: true,
                  child: GlassContainer(
                      height: 600,
                      blur: 10,
                      shadowStrength: 50,
                      opacity: 0.1,
                      width: 340,
                      border: Border.fromBorderSide(BorderSide.none),
                      borderRadius: BorderRadius.circular(20),
                      child: Column(children: <Widget>[
                        SingleChildScrollView(
                          reverse: true,
                          child: CreditCardWidget(
                            cardType: CardType.mastercard,
                            cardBgColor: Colors.transparent,
                            cardNumber: cardNumber,
                            expiryDate: expiryDate,
                            cardHolderName: cardHolderName,
                            cvvCode: cvvCode,
                            showBackView: isCvvFocused,
                            obscureCardNumber: true,
                            obscureCardCvv: true,
                          ),
                        ),
                        SingleChildScrollView(
                          reverse: true,
                          child: Column(
                            children: <Widget>[
                              SingleChildScrollView(
                                reverse: true,
                                child: CreditCardForm(
                                  formKey: formKey,
                                  obscureCvv: true,
                                  obscureNumber: true,
                                  cardNumber: cardNumber,
                                  cvvCode: cvvCode,
                                  cardHolderName: cardHolderName,
                                  expiryDate: expiryDate,
                                  themeColor: Colors.white,
                                  cardNumberDecoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    labelText: 'Number',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Lobster',
                                        color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'XXXX XXXX XXXX XXXX',
                                  ),
                                  textColor: Colors.white,
                                  expiryDateDecoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    labelText: 'Expired Date',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Lobster',
                                        color: Colors.white),
                                    hintStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    hintText: 'XX/XX',
                                  ),
                                  cvvCodeDecoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    labelText: 'CVV',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Lobster',
                                        color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: 'XXX',
                                  ),
                                  cardHolderDecoration: const InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    labelStyle: TextStyle(
                                        fontFamily: 'Lobster',
                                        color: Colors.white),
                                    hintStyle: TextStyle(color: Colors.white),
                                    labelText: 'Card Holder',
                                  ),
                                  onCreditCardModelChange:
                                      onCreditCardModelChange,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 250,
                                child: OutlinedButton(
                                    style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            BorderSide(color: Colors.white)),
                                        shape: MaterialStateProperty.all(
                                            StadiumBorder())),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Boarding(
                                                  widget.passenger,
                                                  widget.clss)));
                                    },
                                    child: Text(
                                      "Make The Payment",
                                      style: TextStyle(
                                          fontFamily: 'Courgette',
                                          color: Color(0xFAF8EDF2),
                                          fontSize: 17),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ]))))
        ]));
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
