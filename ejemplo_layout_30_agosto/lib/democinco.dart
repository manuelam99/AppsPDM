import 'package:flutter/material.dart';

class DemoCinco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.star,
            size: 50,
          ),
          Icon(
            Icons.star,
            size: 200,
            color: Colors.deepPurple,
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
