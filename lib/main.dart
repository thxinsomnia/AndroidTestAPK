// import 'package:myapp/column_widget.dart';
// import 'package:myapp/ui/produk_form.dart';
import 'package:flutter/material.dart';
// import 'package:myapp/ui/produk_form.dart';
// import 'package:myapp/row_widget.dart';
// import 'package:myapp/ui/produk_page.dart';
import 'package:myapp/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter Pertama",
      home: HomePage(),
    );
  }
}
