import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class MyCrud extends StatefulWidget {
  const MyCrud({Key? key}) : super(key: key);

  @override
  _MyCrudState createState() => _MyCrudState();
}

class _MyCrudState extends State<MyCrud> {
  final TextEditingController _nomCtrl = TextEditingController();
  final TextEditingController _precCtrl = TextEditingController();

  CollectionReference _prods =
      FirebaseFirestore.instance.collection('productos');

  Future<void> _deleteProd(String id) async {
    await _prods.doc(id).delete();

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Borraste un dato")));
  }

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';

    if (documentSnapshot != null) {
      action = 'update';
      _nomCtrl.text = documentSnapshot['nombre'];
      _precCtrl.text = documentSnapshot['precio'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nomCtrl,
                  decoration: const InputDecoration(labelText: 'nombre'),
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _precCtrl,
                  decoration: const InputDecoration(
                    labelText: 'precio',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Insertar' : 'Actualizar'),
                  onPressed: () async {
                    final String? nombre = _nomCtrl.text;
                    final double? precio = double.tryParse(_precCtrl.text);
                    if (nombre != null && precio != null) {
                      if (action == 'create') {
                        await _prods.add({"nombre": nombre, "precio": precio});
                      }

                      if (action == 'update') {
                        await _prods
                            .doc(documentSnapshot!.id)
                            .update({"nombre": nombre, "precio": precio});
                      }

                      // Clear the text fields
                      _nomCtrl.text = '';
                      _precCtrl.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD firebase MAM'),
      ),
      // Using StreamBuilder to display all productos from Firestore in real-time
      body: StreamBuilder(
        stream: _prods.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['nombre']),
                    subtitle: Text(documentSnapshot['precio'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          // Press this button to edit a single product
                          IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () =>
                                  _createOrUpdate(documentSnapshot)),
                          // This icon button is used to delete a single product
                          IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () =>
                                  _deleteProd(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: Icon(Icons.add),
      ),
    );
  }
}
