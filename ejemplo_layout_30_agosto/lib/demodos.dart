import 'package:flutter/material.dart';

class DemoDos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
