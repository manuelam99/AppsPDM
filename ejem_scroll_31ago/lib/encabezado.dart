import 'package:flutter/material.dart';

class Encabezado extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Text('Esto es un encabezado', 
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}