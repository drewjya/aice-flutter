import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../net/flutterfire.dart';

import 'home_view.dart';
import 'authentication.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  TextEditingController _usernameField = TextEditingController();

  String assetName = "assets/register.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                assetName,
                width: 65,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _usernameField,
                  decoration: InputDecoration(
                    hintText: "Justin Bieber",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Nama Lengkap",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _emailField,
                  decoration: InputDecoration(
                    hintText: "something@email.com",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  controller: _passwordField,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: 37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  gradient: new LinearGradient(
                    colors: [
                      Color.fromARGB(255, 62, 182, 226),
                      Color.fromARGB(255, 148, 231, 225),
                    ],
                  ),
                ),
                child: MaterialButton(
                  onPressed: () async {
                    bool shouldNavigate = await register(
                      _emailField.text,
                      _passwordField.text,
                      _usernameField.text,
                    );
                    if (shouldNavigate) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeView(),
                        ),
                      );
                    }
                  },
                  child: Text("Buat Akun"),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Authentication(),
                    ),
                  );
                },
                child: Text(
                  "Sudah punya akun? Login disini",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
