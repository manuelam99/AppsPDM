import 'package:flutter/material.dart';
import 'pantallados.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo navegacion'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => PantallaDos()));
          },
          child: Text('Navegar a pagina 2'),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, textStyle: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
