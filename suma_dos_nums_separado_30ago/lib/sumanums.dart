import 'package:flutter/material.dart';
import 'numerouno.dart';
import 'numerodos.dart';

class SumaDosNumeros extends StatefulWidget {
  _sumaDosNumerosState createState() => _sumaDosNumerosState();
}

class _sumaDosNumerosState extends State<SumaDosNumeros> {
  TextEditingController num1Controller = new TextEditingController();
  TextEditingController num2Controller = new TextEditingController();
  String res = '';
  void suma() {
    setState(() {
      res = (int.parse(num1Controller.text) + int.parse(num2Controller.text))
          .toString();
    });
  }

  @override
  Widget build(BuildContext cotext) {
    return Container(
      child: Column(
        children: <Widget>[
          NumeroUno(),
          NumeroDos(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(onPressed: () => suma(), child: Text('Sumar'))
            ],
          )
        ],
      ),
    );
  }
}
