import 'package:flutter/material.dart';
import 'imagenMonke.dart';

class Andamio extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Titulo de AppBar"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ImagenMonke(),
          Container(
            decoration: BoxDecoration(color: Colors.green),
            child: Text(
              "POV, eres banan",
              style: TextStyle(
                color: Colors.white, 
                fontSize: 30
              ),
            ),
          ),
        ],
      ),
    );
  }
}
