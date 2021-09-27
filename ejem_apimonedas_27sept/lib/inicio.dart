import 'package:flutter/material.dart';
import 'sumanums.dart';

class Inicio extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Consumo de API monedas",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Consumo de API monedas"),
        ),
        body: SumaDosNumeros(),
      ),
    );
  }

}