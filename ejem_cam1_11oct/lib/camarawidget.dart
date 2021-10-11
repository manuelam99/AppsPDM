import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CamaraWidget extends StatefulWidget {
  @override
  _CamaraWidgetState createState() => _CamaraWidgetState();
}

class _CamaraWidgetState extends State<CamaraWidget> {
  XFile? imageFile;

  Future<void> _showVentanaDialogo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Escoge la opción"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () => _abrirGaleria(context),
                    title: Text("Galeria"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () => _abrirCamara(context),
                    title: Text("Camara"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void _abrirGaleria(BuildContext context) async {
    final archivo = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      imageFile = archivo;
    });

    Navigator.pop(context);
  }

  void _abrirCamara(BuildContext context) async {
    final archivo = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = archivo;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejemplo de fotos"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Card(
                child: (imageFile == null)
                    ? Text("No hay imagen")
                    : Image.file(File(imageFile!.path)),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  _showVentanaDialogo(context);
                },
                child: Text("Selecciona imagen"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
