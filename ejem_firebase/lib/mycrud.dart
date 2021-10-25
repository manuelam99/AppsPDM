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

  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';

    if (documentSnapshot != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
