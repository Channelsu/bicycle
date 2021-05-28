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

  void _currentLocation() async {
   final GoogleMapController controller = await _controller.future;
   LocationData currentLocation;
   var location = new Location();
   try {
     currentLocation = await location.getLocation();
     } on Exception {
       currentLocation = null;
       }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 15.0,
      ),
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
	      initialCameraPosition: CameraPosition(
	        target: LatLng(35.68131292899063, 139.76717584669254),
	        zoom: 15,
	      ),
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  // FAB構築メソッド
  Widget _buildFloatingActionButton() => Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      FloatingActionButton(
        heroTag: 'add_location',
        child: Icon(Icons.add_location),
        onPressed: () async {
          await Navigator.pushNamed(context, Routes.spotForm,);
        },
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal:8, vertical: 16),
        child: FloatingActionButton(
          heroTag: 'my_location',
          child: Icon(Icons.my_location, color: Theme.of(context).primaryColor),
          backgroundColor: Colors.white,
          onPressed: _currentLocation,
        ),
      ),
    ],
  );

}