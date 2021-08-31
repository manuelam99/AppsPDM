import 'package:flutter/material.dart';

class DemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Material(
            color: Colors.yellow,
          ),
          Positioned(
            child: Icon(
              Icons.star,
              size: 50,
            ),
            top: 0,
            left: 0,
          ),
          Positioned(
            child: Icon(
              Icons.star,
              size: 50,
            ),
            top: 240,
            left: 340,
          )
        ],
      ),
    );
  }
}
