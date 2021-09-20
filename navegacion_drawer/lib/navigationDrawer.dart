import 'package:flutter/material.dart';
import 'rutas.dart';
import 'createDrawerHeader.dart';
import 'createDrawerBodyItem.dart';

class navigationDrawer extends StatelessWidget {
 @override 
 Widget build(BuildContext context){
   return Drawer(
     child: ListView(
       padding: EdgeInsets.zero,
       children: <Widget> [
         createDrawerHeader(),
         createDrawerBodyItem(
           icon: Icons.home,
           texto: 'Inicio',
           onTap: () => Navigator.pushReplacementNamed(context, rutas.rutainicio)
         ),
         createDrawerBodyItem(
           icon: Icons.home,
           texto: 'Contacto',
           onTap: () => Navigator.pushReplacementNamed(context, rutas.rutacontacto)
         ),
         createDrawerBodyItem(
           icon: Icons.home,
           texto: 'Perfil',
           onTap: () => Navigator.pushReplacementNamed(context, rutas.rutaperfil)
         ),
       ]
     ),
   );
 }
}