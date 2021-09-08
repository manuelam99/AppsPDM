import 'package:flutter/material.dart';
import 'recibedatos.dart';

class PantallaDos extends StatefulWidget{
  @override 
  _PantallaDosState createState() => _PantallaDosState();
}

class _PantallaDosState extends State<PantallaDos>{
  String dato = '';

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
              child: Text(
                dato
              ),
            ),
            ElevatedButton(
              onPressed: () => _esperavalor(context), 
              child: Text('Envia texto')
            )
          ],
        ),
      ),
    );
  }

  void _esperavalor(BuildContext context) async{
    final res = await Navigator.push(
      context, MaterialPageRoute(builder: (context)=>RecibeDatos())
    );
    await Future.delayed(const Duration(seconds: 2), (){});
    setState(() {
      dato = res;
    });
  }
}