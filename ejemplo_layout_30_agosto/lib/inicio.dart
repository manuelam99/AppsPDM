import 'package:flutter/material.dart';
import 'demouno.dart';
import 'demodos.dart';
import 'demotres.dart';
import 'democuatro.dart';
import 'democinco.dart';
import 'demoancho.dart';
import 'demostack.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplos layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo de layout'),
        ),
        body: DemoStack(),
      ),
    );
  }
}
