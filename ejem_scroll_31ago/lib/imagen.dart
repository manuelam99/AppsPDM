import 'package:flutter/material.dart';

class Imagen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(child: Image.network('https://picsum.photos/250?image=9'),);
  }
}