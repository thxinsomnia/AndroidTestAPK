import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Flutter Kuyyy!'),
      ),
      body: const Center(
        child: Text("Hello World, Flutter!!!"),
      ),
    );
  }
}
