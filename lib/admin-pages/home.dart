import 'package:aplikasi_kasir/admin-pages/cashierdata.dart';
import 'package:aplikasi_kasir/admin-pages/report.dart';
import 'package:aplikasi_kasir/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'cashierdata.dart';
import 'fooddata.dart';
import 'tabledata.dart';
import 'transaction.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Card card(IconData icn, String title, Widget wg) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.brown),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
        onPressed: () {
          Navigator.push(context,
              PageTransition(child: wg, type: PageTransitionType.fade));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(icn),
              const SizedBox(
                height: 15,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: unnecessary_new
      backgroundColor: Color(0xFFF6F3F7),
      body: Container(
        padding:
            EdgeInsets.only(left: 44.0, right: 10.0, top: 55.0, bottom: 44.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/img/Logo.png', width: 35, height: 44),
                SizedBox(height: 5.0),
                FlatButton(
                    onPressed: _signOut,
                    child: Icon(
                      Icons.logout_outlined,
                      color: Colors.brown,
                      size: 31,
                    ))
              ],
            ),
            Row(
              children: [
                SizedBox(height: 100),
                Text('Hi, Welcome to \nCafetarian Dashboard !',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF704232),
                        fontFamily: 'Poppins')),
              ],
            ),
            Row(
              children: [
                Text('Master Data',
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF704232),
                        fontFamily: 'Poppins')),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(height: 12),
                  card(Icons.people, "Cashier Data", CashierData()),
                  card(Icons.food_bank_outlined, "Food Data", FoodData()),
                  card(Icons.table_chart_outlined, "Table Data", TableData()),
                ],
              ),
            ),
            SizedBox(height: 45),
            Row(
              children: [
                Text('Report',
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF704232),
                        fontFamily: 'Poppins')),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(height: 12),
                  card(Icons.money_outlined, "Transaction", Transaction()),
                  card(Icons.book_online_outlined, "Report", Report()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
