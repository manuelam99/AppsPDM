import 'package:flutter/material.dart';

class SumaDosNumeros extends StatefulWidget {
  @override
  _SumaDosNumerosState createState() => _SumaDosNumerosState();
}

class _SumaDosNumerosState extends State<SumaDosNumeros> {
  TextEditingController cajaNum1Controller = new TextEditingController();
  TextEditingController cajaNum2Controller = new TextEditingController();

  String resultadoSuma = "0";

  void suma() {
    setState(() {
      int sum = int.parse(cajaNum1Controller.text) +
          int.parse(cajaNum2Controller.text);
      resultadoSuma = sum.toString();
    });
  }

  void sumaDecimal(){
    setState(() {
      double sum = double.parse(cajaNum1Controller.text) + 
                   double.parse(cajaNum2Controller.text);
      resultadoSuma = sum.toString();
    });
  }

  void resta(){
    setState(() {
      double sum = double.parse(cajaNum1Controller.text) - 
                   double.parse(cajaNum2Controller.text);
      resultadoSuma = sum.toString();
    });
  }

  void multip(){
    setState(() {
      double sum = double.parse(cajaNum1Controller.text) * 
                   double.parse(cajaNum2Controller.text);
      resultadoSuma = sum.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Numero 1: "),
              new Flexible(
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: cajaNum1Controller,
                  ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text("Numero 2: "),
              new Flexible(
                  child: new TextField(
                    keyboardType: TextInputType.number,
                    controller: cajaNum2Controller,
                  )
              )
            ],
          ),
          Row(
            children: <Widget>[
              ElevatedButton(onPressed: () => multip(), child: Text("Operar"))
            ],
            mainAxisAlignment: MainAxisAlignment.center
          ),
          Row(
            children: <Widget>[
              Text("Resultado: $resultadoSuma")
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
