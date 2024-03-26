import 'package:flutter/material.dart';
import './FlightDetail.dart';
import 'FlightDetailTwoWay.dart';

// ignore: unused_import
import 'Login.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home(this.passenger);

  var passenger;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget twoway() {
    return Stack(children: [
      Opacity(
        opacity: 0.8,
        child: Image.asset("Images/air2.jpg",
            fit: BoxFit.cover, height: double.infinity),
      ),
      Positioned(
        left: 10,
        top: 199,
        child: SingleChildScrollView(
          child: GlassContainer(
            height: 550,
            blur: 3,
            shadowStrength: 50,
            opacity: 0.1,
            width: 340,
            border: Border.fromBorderSide(BorderSide.none),
            borderRadius: BorderRadius.circular(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  cardset2way('Madani', 'Khartoum'),
                  cardset2way('Atbara', 'Portsudan'),
                  cardset2way('Kassala', 'Merowe'),
                  cardset2way('Barah', 'Kosti'),
                  cardset2way('Nyala', 'AlManaqil'),
                  cardset2way('ErRoseires', 'Dongola'),
                  cardset2way('Babanusa', 'AlFashir'),
                  cardset2way('Sinjah', 'Rabak'),
                  cardset2way('UmmRuwaba', 'AdDamazin'),
                  cardset2way('WadiHalfa', 'ElObeid'),
                  cardset2way('Juba', 'ElDaein'),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget oneway() {
    return Stack(children: [
      Opacity(
        opacity: 0.8,
        child: Image.asset("Images/air2.jpg",
            fit: BoxFit.cover, height: double.infinity),
      ),
      Positioned(
        left: 10,
        top: 199,
        child: SingleChildScrollView(
          child: GlassContainer(
            height: 550,
            blur: 3,
            shadowStrength: 50,
            opacity: 0.1,
            width: 340,
            //--code to remove border
            border: Border.fromBorderSide(BorderSide.none),
            borderRadius: BorderRadius.circular(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  cardset('Madani', Icons.airplane_ticket_rounded, 'Khartoum',
                      1), // Added an additional argument
                  cardset('Atbara', Icons.airplane_ticket_rounded, 'Portsudan',
                      2), // Added an additional argument
                  cardset('Kassala', Icons.airplane_ticket_rounded, 'Merowe',
                      3), // Added an additional argument
                  cardset('EnNahud', Icons.airplane_ticket_rounded, 'AlQadarif',
                      4), // Added an additional argument
                  cardset('Kosti', Icons.airplane_ticket_rounded, 'Barah ',
                      5), // Added an additional argument
                  cardset('AlManaqil', Icons.airplane_ticket_rounded, 'Nyala',
                      6), // Added an additional argument
                  cardset('Dongola', Icons.airplane_ticket_rounded,
                      'ErRoseires', 7), // Added an additional argument
                  cardset('AlFashir', Icons.airplane_ticket_rounded, 'Babanusa',
                      8), // Added an additional argument
                  cardset('Rabak', Icons.airplane_ticket_rounded, 'Sinjah',
                      9), // Added an additional argument
                  cardset('AdDamazin', Icons.airplane_ticket_rounded,
                      'UmmRuwaba', 10), // Added an additional argument
                  cardset('ElObeid', Icons.airplane_ticket_rounded, 'WadiHalfa',
                      11), // Added an additional argument
                  cardset('Juba', Icons.airplane_ticket_rounded, 'ElDaein',
                      12), // Added an additional argument
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Widget cardset(String fromtxt, IconData icn, String totxt, int index) {
    // Added an additional parameter 'index'
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => FlightDetail(
                        fromtxt,
                        totxt,
                        widget.passenger,
                        index))); // Passed 'index' as an argument
          },
          child: SizedBox(
            height: 100,
            child: Card(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$fromtxt',
                          style: TextStyle(
                              color: Color(0xFFFDD7FD),
                              fontFamily: 'Lobster',
                              letterSpacing: 2),
                        ),
                        Icon(
                          icn,
                          color: Colors.grey[300],
                        ),
                        Text(
                          "$totxt",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'AbrilFAtface'),
                        )
                      ],
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

  Widget cardset2way(String f1, String t1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          splashColor: Colors.white,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TwoWay(f1, t1, widget.passenger)));
          },
          child: SizedBox(
            height: 120,
            child: Card(
              color: Colors.transparent,
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$f1',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'AbrilFAtface',
                              letterSpacing: 1),
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.airplane_ticket_outlined,
                              color: Colors.grey[300],
                            ),
                            Icon(
                              Icons.airplane_ticket,
                              color: Colors.grey[300],
                            ),
                          ],
                        ),
                        Text(
                          "$t1",
                          style: TextStyle(
                              color: Color(0xFFFDD7FD),
                              fontFamily: 'Courgette',
                              letterSpacing: 1),
                        )
                      ],
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            bottom: TabBar(
                indicatorColor: Colors.lightBlueAccent,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.airplane_ticket,
                          color: Color(0xFFF9F9F9),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "One Way",
                          style: TextStyle(color: Color(0xFFF7DBF0)),
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.airplane_ticket_rounded),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Two Way",
                          style: TextStyle(color: Color(0xFFF7DBF0)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.airplane_ticket_rounded),
                      ],
                    ),
                  ),
                ]),
            toolbarHeight: 150,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose Flight",
                  style: TextStyle(
                      fontFamily: 'Courgette',
                      fontStyle: FontStyle.italic,
                      letterSpacing: 6,
                      fontSize: 25,
                      color: Color(0xFFF7DBF0)),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          body: TabBarView(children: [oneway(), twoway()])),
    );
  }
}
