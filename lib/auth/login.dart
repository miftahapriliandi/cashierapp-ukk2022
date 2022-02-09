import 'package:aplikasi_kasir/admin-pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F3F7),
        body: Container(
          padding: EdgeInsets.all(44.0),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/img/Logo.png', width: 132, height: 107),
                  SizedBox(height: 5.0),
                  Text('Cafetarian',
                      style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF704232),
                          fontFamily: 'Poppins')),
                  SizedBox(height: 20),
                  TextFormField(
                      validator: (input) {
                        if (input == null || input.isEmpty) {
                          return 'Please fill an email';
                        }
                      },
                      onSaved: (input) => _email = input!,
                      autofocus: false,
                      style: TextStyle(fontSize: 14.0, fontFamily: 'Poppins'),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(18.0),
                          hintText: 'Enter your email',
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xFFB2B2B2),
                              fontFamily: 'Poppins'),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0)))),
                  SizedBox(height: 12.0),
                  TextFormField(
                    validator: (input) {
                      if (input == null || input.isEmpty) {
                        return 'Please fill a password';
                      }
                    },
                    onSaved: (input) => _password = input!,
                    style: TextStyle(fontSize: 14.0, fontFamily: 'Poppins'),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(18.0),
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFB2B2B2),
                            fontFamily: 'Poppins'),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0))),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(55.0),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: Login,
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600)),
                  )
                ],
              )),
        ));
  }

  // ignore: non_constant_identifier_names
  Future<void> Login() async {
    final formState = _formKey.currentState;
    formState!.save();
    try {
      if (_formKey.currentState!.validate()) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    } catch (e) {
      print(e);
    }
  }
}
