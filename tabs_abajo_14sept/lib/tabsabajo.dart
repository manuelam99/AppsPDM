import 'package:flutter/material.dart';
import 'inicio.dart';
import 'contacto.dart';
import 'acerca.dart';
import 'chat.dart';

class TabsAbajo extends StatefulWidget{
  @override 
  _TabsAbajoState createState() => _TabsAbajoState();
}

class _TabsAbajoState extends State<TabsAbajo>{
  int indice = 0;
  var pantallas = <Widget>[
    Inicio(),
    Contacto(),
    Acerca(),
    Chat()
  ];

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: IndexedStack(
        index: indice,
        children: pantallas,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        iconSize: 40,
        currentIndex: indice,
        onTap: (index) => setState(() => indice = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: "Contacto"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Acerca"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
    );
  }
}