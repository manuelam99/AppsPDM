import 'package:flutter/material.dart';

class RecibeDatos extends StatefulWidget{
  @override 
  _RecibeDatosState createState() => _RecibeDatosState();
}

class _RecibeDatosState extends State<RecibeDatos>{
  TextEditingController c1 = new TextEditingController();

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo navegacion'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                controller: c1,
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () => _enviadatos(context), 
              child: Text('Envia texto')
            )
          ],
        ),
      ),
    );
  }

  void _enviadatos(BuildContext context){
    String t = c1.text;
    Navigator.pop(context, t);
  }
}