import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import './Payment.dart';

class FlightDetail extends StatefulWidget {
  final dynamic passenger;
  final String from;
  final String to;

  FlightDetail(this.from, this.to, this.passenger, int index);

  @override
  _FlightDetailState createState() => _FlightDetailState();
}

class _FlightDetailState extends State<FlightDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _class;
  String? _ageClassification;

  void _onClassChange(String? value) {
    setState(() {
      _class = value;
    });
  }

  void _onAgeClassificationChange(String? value) {
    setState(() {
      _ageClassification = value;
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
              height: 120,
              blur: 3,
              shadowStrength: 50,
              opacity: 0.1,
              width: 337,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 180),
                    child: Text(
                      widget.from,
                      style: TextStyle(
                        color: Color(0xFFD7DEFD),
                        fontFamily: 'Pacifico',
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.airplane_ticket_outlined,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: Text(
                      widget.to,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'AbrilFatface',
                        fontSize: 30,
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
                    SizedBox(
                      height: 15,
                    ),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.always,
                      child: SizedBox(
                        width: 200,
                        child: DropdownButtonFormField<String>(
                          validator: (value) {
                            if (value == null) {
                              return ' Please Choose A Class';
                            }
                            return null;
                          },
                          isDense: true,
                          iconSize: 35,
                          iconEnabledColor: Colors.white70,
                          elevation: 1,
                          hint: Text(
                            "Choose a Class",
                            style: TextStyle(
                              fontFamily: 'AbrilFatface',
                              letterSpacing: 1,
                              color: Colors.white,
                            ),
                          ),
                          dropdownColor: Colors.transparent,
                          style: TextStyle(color: Colors.white),
                          value: _class,
                          onChanged: _onClassChange,
                          items: <String>[
                            'Economy Class',
                            'First Class',
                            'Business Class',
                          ].map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ),
                          ).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 110,
                    ),
                    DropdownButton<String>(
                      isDense: true,
                      iconSize: 35,
                      iconEnabledColor: Colors.white70,
                      elevation: 1,
                      hint: Text(
                        " Age Classify",
                        style: TextStyle(
                          fontFamily: 'AbrilFatface',
                          color: Colors.white,
                        ),
                      ),
                      dropdownColor: Colors.transparent,
                      style: TextStyle(color: Colors.white),
                      value: _ageClassification,
                      onChanged: _onAgeClassificationChange,
                      items: <String>[
                        'Adult ',
                        'Child ',
                        'Infant ',
                      ].map<DropdownMenuItem<String>>(
                        (e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ),
                      ).toList(),
                    ),
                    SizedBox(
                      height: 110,
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
                          hintText: 'Choose a Date',
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
                      height: 10,
                    ),
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
                          hintText: 'Choose a Time',
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
                      height: 50,
                    ),
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
                                builder: (_) => Payment(widget.passenger, _class),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Book Now",
                          style: TextStyle(
                            fontFamily: 'AbrilFatface',
                            color: Color(0xFFFFDDF2),
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
