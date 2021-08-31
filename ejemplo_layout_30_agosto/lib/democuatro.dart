import 'package:flutter/material.dart';

class DemoCuatro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 50,
          ),
          Icon(
            Icons.star,
            size: 50,
          ),
          Icon(
            Icons.star,
            size: 50,
          )
        ],
      ),
    );
  }
}
