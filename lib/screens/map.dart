import 'package:bicycle/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'dart:async';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
	      initialCameraPosition: CameraPosition(
	        target: LatLng(35.68131292899063, 139.76717584669254),
	        zoom: 15,
	      ),
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
      ),
    );
  }


}