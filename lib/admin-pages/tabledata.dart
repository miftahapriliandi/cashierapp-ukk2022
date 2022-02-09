import 'package:flutter/material.dart';

class TableData extends StatefulWidget {
  TableData({Key? key}) : super(key: key);

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Data'),
      ),
      body: Center(
        child: Text('Table Data'),
      ),
    );
  }
}
