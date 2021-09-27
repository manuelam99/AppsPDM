import 'package:ejemsuma_24ago/regreso.dart';
import 'package:flutter/material.dart';
import 'obtienedatos.dart';

class SumaDosNumeros extends StatefulWidget {
  @override
  _SumaDosNumerosState createState() => _SumaDosNumerosState();
}

class _SumaDosNumerosState extends State<SumaDosNumeros> {
  TextEditingController cajaNum1Controller = new TextEditingController();

  String resultadoApi = '';
  double factor = 0;
  String fecha = '';
  String conversion = '';

  Future<void> dato() async{
    Regreso r = await ObtieneDatos.getDatos('usd', 'mxn');
    factor = r.mxn;
    fecha = r.date;

    setState(() {
      resultadoApi = factor.toString() + 'fecha: ' + fecha;
      double w = double.parse(cajaNum1Controller.text) * factor;
      w = double.parse(w.toStringAsFixed(2));
      conversion = w.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Numero: "),
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
              ElevatedButton(onPressed: () => dato(), child: Text("Convertir"))
            ],
            mainAxisAlignment: MainAxisAlignment.center
          ),
          Row(
            children: <Widget>[
              Text("Resultado: $conversion")
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: <Widget>[
              Text("Factor: $factor")
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Row(
            children: <Widget>[
              Text("Fecha: $fecha")
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
