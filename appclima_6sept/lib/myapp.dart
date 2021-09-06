import 'package:flutter/material.dart';
import 'paginaprincipal.dart';

class MyApp extends StatelessWidget{

  Widget build(BuildContext context){
    return MaterialApp(
      title: 'App de Clima',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),home: PaginaPrincipal(),
    );
  }
}