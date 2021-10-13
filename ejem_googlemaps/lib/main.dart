import 'package:flutter/material.dart';
import 'mimapa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MiMapa(),
    );
  }
}