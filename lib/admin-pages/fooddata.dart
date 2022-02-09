import 'package:flutter/material.dart';

class FoodData extends StatefulWidget {
  FoodData({Key? key}) : super(key: key);

  @override
  State<FoodData> createState() => _FoodDataState();
}

class _FoodDataState extends State<FoodData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Data'),
      ),
      body: Center(
        child: Text('Food Data'),
      ),
    );
  }
}
