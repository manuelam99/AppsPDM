import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class CamaraWidget extends StatefulWidget {
  @override
  _CamaraWidgetState createState() => _CamaraWidgetState();
}

class _CamaraWidgetState extends State<CamaraWidget> {
  XFile? imageFile;
  String url = "";

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

  Future<void> _subirImagen(BuildContext context) async {
    final CLOUDINARY = CloudinaryPublic("dk4jwq6u2", "lfvatyg4", cache: false);
    String url_local = "";

    try {
      CloudinaryResponse res = await CLOUDINARY.uploadFile(
          CloudinaryFile.fromFile(imageFile!.path,
              resourceType: CloudinaryResourceType.Image));
      print(res.secureUrl);
      url_local = res.secureUrl;
      setState(() {
        url = url_local;
      });
    } on CloudinaryException catch (err) {
      print(err.message);
      print(err.request);
    }
  }

  void _abreLiga() {
    launch(url);
  }

  void _compartir() {
    Share.share('Wacha la foto del JuanCa bn pedera en $url');
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
                    : Image.file(
                        File(imageFile!.path),
                        width: 250,
                      ),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  _showVentanaDialogo(context);
                },
                child: Text("Selecciona imagen"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.deepPurple,
                onPressed: () {
                  _subirImagen(context);
                },
                child: Text("Subir Imagen"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.blueAccent,
                onPressed: () {
                  _abreLiga();
                },
                child: Text("Abre liga de imagen"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: Colors.pink[900],
                onPressed: () {
                  _compartir();
                },
                child: Text("Compartir"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
