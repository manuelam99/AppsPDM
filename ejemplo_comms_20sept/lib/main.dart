import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override 
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  openwhatsapp(String message, String destinatario) async {
    var whatsapp = destinatario;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=" + message;
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: new Text("whatsapp no instalado")));
      }
    }
  }

  _enviarSMS(String msg, List<String> para) async{
    String res = await sendSMS(message: msg, recipients: para).catchError( (e){print(e);} );
    print(res);
  }

  _hacerLlamada() async{
    const url = "tel:+525549574954";

    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Hubo un error al llamar la URL';
    }
  }

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Ejemplo comms"),),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(25),
                width: 100,
                child: TextButton(
                  child: Text("Llamada"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.white
                  ),
                  onPressed: _hacerLlamada,
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                width: 100,
                child: TextButton(
                  child: Text("Mensaje"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white
                  ),
                  onPressed: (){
                    String mensaje = "Prueba de mensaje";
                    List<String> dest = ["121412", "1231423"];
                    _enviarSMS(mensaje, dest);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                width: 100,
                child: TextButton(
                  child: Text("WhatsApp"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white
                  ),
                  onPressed: (){
                    String mensaje2 = "Prueba de mensaje";
                    String dest2 = "453634";
                    openwhatsapp(mensaje2, dest2);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}