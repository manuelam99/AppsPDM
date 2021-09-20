import 'package:flutter/material.dart';
import 'package:navegacion_drawer/navigationDrawer.dart';

class contacto extends StatelessWidget {
  static const String nombreruta = '/contacto';
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('contacto')
      ),
      drawer: navigationDrawer(),
      body: Center(
        child: Text('soy contacto')
      )
    );
  }
}