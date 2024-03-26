import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import './Payment.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class TwoWay extends StatefulWidget {
  final String from;
  final String to;
  final dynamic passenger;

  TwoWay(this.from, this.to, this.passenger);

  @override
  _TwoWayState createState() => _TwoWayState();
}

class _TwoWayState extends State<TwoWay> {
  late String _class;
  late String _ageClassification;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onClassChange(String? value) {
    setState(() {
      _class = value!;
    });
  }

  void _onAgeClassificationChange(String? value) {
    setState(() {
      _ageClassification = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              "Images/air2.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 42,
            left: 10,
            child: GlassContainer(
              height: 140,
              blur: 3,
              shadowStrength: 50,
              opacity: 0.1,
              width: 337,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180, top: 5),
                    child: Text(
                      widget.from,
                      style: TextStyle(
                        color: Color(0xFFC8D0F3),
                        fontFamily: 'Lobster',
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.airplane_ticket_outlined,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.airplane_ticket_rounded,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: Text(
                      widget.to,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Courgette',
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 190,
            left: 10,
            child: GlassContainer(
              height: 570,
              blur: 9,
              shadowStrength: 50,
              opacity: 0.1,
              width: 337,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    SizedBox(
                      width: 200,
                      child: Form(
                        key: _formKey,
                        child: DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null) {
                              return 'Please choose a class';
                            }
                            return null;
                          },
                          isDense: true,
                          iconSize: 35,
                          iconEnabledColor: Colors.white70,
                          elevation: 1,
                          hint: Text(
                            "Choose a Class",
                            style: TextStyle(color: Colors.white),
                          ),
                          dropdownColor: Colors.transparent,
                          style: TextStyle(
                            fontFamily: 'AbrilFatface',
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          value: _class,
                          onChanged: _onClassChange,
                          items: <String>[
                            'Economy Class',
                            'First Class',
                            'Business Class',
                          ]
                              .map<DropdownMenuItem<String>>(
                                (e) => DropdownMenuItem(
                                  child: Text(e),
                                  value: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    SizedBox(height: 80),
                    DropdownButton<String>(
                      isDense: true,
                      iconSize: 35,
                      iconEnabledColor: Colors.white70,
                      elevation: 1,
                      hint: Text(
                        "Age Classification",
                        style: TextStyle(
                          fontFamily: 'AbrilFatface',
                          color: Colors.white,
                        ),
                      ),
                      dropdownColor: Colors.transparent,
                      style: TextStyle(color: Colors.white),
                      value: _ageClassification,
                      onChanged: _onAgeClassificationChange,
                      items: <String>['Adult', 'Child', 'Infant']
                          .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(height: 110),
                    SizedBox(
                      width: 220,
                      child: DateTimePicker(
                        initialValue: '',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        use24HourFormat: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          hintText: 'Choose Departure Date',
                          hintStyle: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 220,
                      child: DateTimePicker(
                        initialValue: '',
                        type: DateTimePickerType.time,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.access_alarms_rounded,
                            color: Colors.white,
                          ),
                          hintText: 'Choose Departure Time',
                          hintStyle: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 220,
                      child: DateTimePicker(
                        initialValue: '',
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                        use24HourFormat: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.white,
                          ),
                          hintText: 'Choose Return Date',
                          hintStyle: TextStyle(
                            fontFamily: 'Pacifico',
                            color: Colors.white,
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 250,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(color: Colors.white),
                          ),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Payment(
                                  widget.passenger,
                                  _class,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            fontFamily: 'AbrilFatface',
                            color: Color(0xFFFFD3F0),
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
