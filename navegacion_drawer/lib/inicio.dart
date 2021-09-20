import 'package:flutter/material.dart';

class inicio extends StatelessWidget {
  static const String nombreruta = '/inicio';
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('inicio')
      ),
      body: Center(
        child: Text('soy inicio')
      )
    );
  }
}