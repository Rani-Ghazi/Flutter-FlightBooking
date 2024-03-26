import 'package:flutter/material.dart';
import './Home.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? _userName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Opacity(
            opacity: 1,
            child: Image.asset(
              "Images/air2.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Positioned(
            top: 180,
            left: 29,
            child: SingleChildScrollView(
              reverse: true,
              child: GlassContainer(
                height: 420,
                blur: 10,
                shadowStrength: 50,
                opacity: 0.1,
                width: 300,
                border: Border.fromBorderSide(BorderSide.none),
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Text(
                      "R Airlines",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        color: Color(0xffF0D9E7),
                        fontSize: 34,
                        letterSpacing: 10,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your username';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            setState(() {
                              _userName = val;
                            });
                          },
                          textCapitalization: TextCapitalization.words,
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              fontFamily: 'Lobster',
                              color: Color(0xFFFDF6F6),
                              letterSpacing: 5,
                            ),
                            icon: Icon(
                              Icons.person_outline_rounded,
                              color: Color(0xFFC9D5F8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color(0xFFFDF6F6),
                            fontFamily: 'Lobster',
                            letterSpacing: 5,
                          ),
                          icon: Icon(
                            Icons.security,
                            color: Color(0xFFC9D5F8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 240,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            BorderSide(width: 0.3, color: Colors.white),
                          ),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Home(_userName),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontFamily: 'AbrilFAtface',
                            color: Color(0xFFF3E6EE),
                            fontSize: 20,
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
