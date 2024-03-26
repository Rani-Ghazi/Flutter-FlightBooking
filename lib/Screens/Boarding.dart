import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:barcode_widget/barcode_widget.dart';

class Boarding extends StatefulWidget {
  final dynamic clss;
  final dynamic passenger;

  Boarding(this.passenger, this.clss);

  @override
  _BoardingState createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  String total_price() {
    List<String> price = ['100\$', '200\$', '150\$', '50\$', '20\$', '400\$'];
    return price[Random().nextInt(price.length)];
  }

  String seatnum() {
    List<String> seat = ['E6', 'A1', 'H7', 'T9', 'O4', 'W2', 'R3'];
    return seat[Random().nextInt(seat.length)];
  }

  String boarding_pass() {
    List<String> boarding_p = [
      'C5656564',
      'N5658564',
      'E5656T64',
      'T265P519',
      'Z2Z5P512',
      'T265NN10'
    ];
    return boarding_p[Random().nextInt(boarding_p.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          "Ticket Info",
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFFE9DDDD),
            letterSpacing: 8,
            fontFamily: 'Courgette',
          ),
        ),
      ),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.9,
            child: Image.asset(
              "Images/air2.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 140,
            left: 30,
            child: GlassContainer(
              height: 620,
              blur: 8,
              shadowStrength: 50,
              opacity: 0.1,
              width: 300,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Passenger",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.passenger.toString(),
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Color(0xFADFC6D2),
                      fontSize: 30,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 50,
                    endIndent: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Total Price",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${total_price()}",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Color(0xFAE9DCE2),
                      fontSize: 30,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 60,
                    endIndent: 60,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Class ",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.clss.toString(),
                    style: TextStyle(
                      fontFamily: 'Courgette',
                      letterSpacing: 2,
                      color: Color(0xFAF5EAEF),
                      fontSize: 22,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 80,
                    endIndent: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Seat",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${seatnum()}",
                    style: TextStyle(
                      fontFamily: 'Lobster',
                      color: Color(0xFAF8EDF2),
                      fontSize: 30,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 90,
                    endIndent: 90,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  BarcodeWidget(
                    style: TextStyle(color: Colors.white70),
                    color: Colors.white,
                    height: 80,
                    width: 250,
                    barcode: Barcode.code39(),
                    data: '${boarding_pass()}',
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "BOARDING PASS",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      letterSpacing: 5,
                      color: Color(0xFAF5E9EE),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
