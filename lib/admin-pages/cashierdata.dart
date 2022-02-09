import 'package:flutter/material.dart';

class CashierData extends StatefulWidget {
  CashierData({Key? key}) : super(key: key);

  @override
  State<CashierData> createState() => _CashierDataState();
}

class _CashierDataState extends State<CashierData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cashier Data'),
      ),
      body: Center(
        child: Text('Cashier Data'),
      ),
    );
  }
}
