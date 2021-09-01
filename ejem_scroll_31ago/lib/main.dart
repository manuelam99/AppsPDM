import 'package:flutter/material.dart';
import 'articulo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Ejemplo scroll",
      home: Scaffold(
        appBar: AppBar(title: Text("Ejemplo de scroll"),),
        body: Articulo(),
      ),
    );
  }
}
