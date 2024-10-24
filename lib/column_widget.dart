import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Column'),
      ),
      body: Column(
        children: const [
          Text('kolom1'),
          Text('kolom2'),
          Text('kolom3'),
          Text('kolom4')
        ],
      ));
  }   
}
