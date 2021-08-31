import 'package:flutter/material.dart';

class DemoAncho extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: IntrinsicWidth(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: () {}, child: Text('Hola')),
            ElevatedButton(onPressed: () {}, child: Text('Holaa')),
            ElevatedButton(onPressed: () {}, child: Text('Holaaa'))
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ),
      ),
    ));
  }
}
