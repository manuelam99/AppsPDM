import 'package:flutter/material.dart';
import 'dart:math';

class PaginaPrincipal extends StatefulWidget{
  @override
  _paginaPrincipalState createState() => _paginaPrincipalState();

}

class _paginaPrincipalState extends State<PaginaPrincipal>{
  String caritaCalor = '🥵';
  int grados = 39;
  Color colorFondo = Colors.red;
  var colorNuevo = [255,0,0,1];

  void cambiarClima(){
    int n = Random().nextInt(40);
    double k = ((n-(0))/(39-(0)));
    grados = n;
    setState(() {

      colorTransition(k, 180, 0);
      colorFondo = Color.fromRGBO(colorNuevo[0],colorNuevo[1],colorNuevo[2],colorNuevo[3].toDouble());
      if(n >=0 && n < 10){
        caritaCalor = '🥶';
      }else if(n >=10 && n < 20){
        caritaCalor = '😃';
      }else if(n >=20 && n < 30){
        caritaCalor = '😐';
      }else{
        caritaCalor = '🥵';
      }
    });
  }

  int percToColor(double percentage){
    return (percentage * 255).toInt();
  }

  double hueToRGB(double p, double q, double t){
    if (t < 0) {
        t += 1;
    }
    if (t > 1) {
        t -= 1;
    }
    if (t < 1.0 / 6) {
        return p + (q - p) * 6 * t;
    }
    if (t < 1.0 / 2) {
        return q;
    }
    if (t < 2.0 / 3) {
        return p + (q - p) * (2.0 / 3 - t) * 6;
    }
    return p;
  }

  void hslToRGB(double hue, double saturation, double lightness){
    double q;
    if (lightness < 0.5) {
        q = lightness * (1 + saturation);
    } else {
        q = lightness + saturation - lightness * saturation;
    }
    double p = 2 * lightness - q;
    double oneThird = 1.0 / 3.0;
    int red = percToColor(hueToRGB(p, q, hue + oneThird));
    int green = percToColor(hueToRGB(p, q, hue));
    int blue = percToColor(hueToRGB(p, q, hue - oneThird));
    colorNuevo = [red, green, blue, 1];
  }

  void colorTransition(double porc, int inic, int fin){
    double hue = ((porc*(fin-inic)+inic)/360);
    double saturation = 0.8;
    double lightness = 0.5;

    hslToRGB(hue, saturation, lightness);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: colorFondo,
      appBar: AppBar(title: Text('App de Clima'),),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(caritaCalor, style: TextStyle(fontSize: 100)),
            const SizedBox(height: 24,),
            Text('$grados grados Centigrados', style: TextStyle(fontSize: 80)),
            Spacer(),
            TextButton(
              onPressed: () => cambiarClima(), 
              child: Text('🌡️Cambiar temp', style: TextStyle(fontSize: 24, color: Colors.white),)
            )
          ],
        ),
      ),
    );
  }
}