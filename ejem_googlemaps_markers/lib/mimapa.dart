import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'descripcionlugar.dart';

class MiMapa extends StatefulWidget {
  @override
  _MiMapaState createState() => _MiMapaState();
}

class _MiMapaState extends State<MiMapa> {
  LatLng? miLatLong = LatLng(19.42847, -99.12766);
  late CameraPosition _cameraPosition;
  late GoogleMapController _controller;
  Location _location = Location();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<MarkerId> listaMarkerId = List<MarkerId>.empty(growable: true);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void _onMapCreated(GoogleMapController ctrl) {
    _controller = ctrl;
    /*
    _location.onLocationChanged.listen((event) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(event.latitude!, event.longitude!), zoom: 10)));
    });
    */
    MarkerId id1 = MarkerId("1");
    MarkerId id2 = MarkerId("2");
    MarkerId id3 = MarkerId("3");
    listaMarkerId.add(id1);
    listaMarkerId.add(id2);
    listaMarkerId.add(id3);

    Marker m1 = Marker(
        markerId: id1,
        position: new LatLng(19.436421052716316, -99.15465126090957),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: "Monumento a la Revolución"));

    Marker m2 = Marker(
        markerId: id2,
        position: new LatLng(19.303194835002362, -99.15046333022373),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        infoWindow: InfoWindow(title: "Estadio Azteca"),
        onTap: () {
          _controller.animateCamera(CameraUpdate.newLatLng(
              new LatLng(19.303194835002362, -99.15046333022373)));
          var desc =
              scaffoldKey.currentState!.showBottomSheet((context) => Container(
                    child: descripcionLugar(
                        "19.303194835002362, -99.15046333022373", context),
                    height: 250,
                    color: Colors.transparent,
                  ));
        });

    Marker m3 = Marker(
        markerId: id2,
        position: new LatLng(19.433889, -99.140556),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: "Torre Latinoamericana"));

    setState(() {
      markers[id1] = m1;
      markers[id2] = m2;
      markers[id3] = m3;
    });
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(target: miLatLong!),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              markers: Set<Marker>.of(markers.values),
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}
