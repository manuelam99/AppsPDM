import 'package:flutter/material.dart';

class DemoTres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
