import 'package:aice/net/flutterfire.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';
import 'register_view.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final TextEditingController _emailField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  bool _isLoading = false;

  String assetName = "assets/aice.png";
  String errorText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      assetName,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 35),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _emailField,
                        decoration: const InputDecoration(
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        controller: _passwordField,
                        obscureText: true,
                        decoration: const InputDecoration(
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
                    SizedBox(height: MediaQuery.of(context).size.height / 35),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 62, 182, 226),
                            Color.fromARGB(255, 148, 231, 225),
                          ],
                        ),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          setState(() {
                            errorText = "";
                            _isLoading = true;
                          });
                          final shouldNavigate = await signIn(
                              _emailField.text, _passwordField.text);

                          if (shouldNavigate) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ),
                            );
                          } else {
                            _isLoading = false;
                            errorText = "Email atau password anda salah";
                            setState(() {});
                          }
                        },
                        textColor: Colors.white,
                        child: const Text("Login"),
                      ),
                    ),
                    Visibility(
                      visible: errorText.isNotEmpty,
                      child: Text(
                        errorText,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      child: const Text(
                        "Belum punya akun? Register",
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
