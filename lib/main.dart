import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(CashierApp());
}

class CashierApp extends StatelessWidget {
  const CashierApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cashier App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: LoginPage(),
    );
  }
}
