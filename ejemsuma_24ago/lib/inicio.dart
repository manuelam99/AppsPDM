import 'package:flutter/material.dart';
import 'sumanums.dart';

class Inicio extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Suma de dos numeros",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Suma de dos numeros"),
        ),
        body: SumaDosNumeros(),
      ),
    );
  }

}