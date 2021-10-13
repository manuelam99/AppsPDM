import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MiMapa extends StatefulWidget {
  @override
  _MiMapaState createState() => _MiMapaState();
}

class _MiMapaState extends State<MiMapa> {
  LatLng? miLatLong = LatLng(19.42847,-99.12766);
  late CameraPosition _cameraPosition;
  late GoogleMapController _controller;
  Set<Marker> _markers = {};
  Location _location = Location();

  void _onMapCreated(GoogleMapController ctrl){
    _controller = ctrl;
    _location.onLocationChanged.listen((event) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(event.latitude, event.longitude), zoom: 10)
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}