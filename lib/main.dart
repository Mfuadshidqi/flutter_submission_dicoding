import 'package:flutter/material.dart';
import 'package:submission/list_pahlawan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Pahlawan',
      theme: ThemeData(),
      home: ListPahlawan(),
    );
  }
}