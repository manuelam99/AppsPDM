import 'package:flutter/material.dart';
import 'contenedor4.dart';
import 'imagen.dart';
import 'imagen2.dart';

class EstructuraDos extends StatelessWidget{

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Titulo de AppBar"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
            decoration: BoxDecoration(color: Colors.green),
            child: Text("Caja 1"),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.purple),
            child: Text("Caja 2"),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.cyan),
            child: Text("Caja 3"),
          ),
          Contenedor4(),
          Imagen(),
          ImagenRed()
        ],),
      );
  }
}