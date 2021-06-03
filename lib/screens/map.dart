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
  double _latitude;
  double _longitude;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() { 
    super.initState();
    _getLocation(context);
  }

  Future<void> _getLocation(context) async {
    LocationData _currentPosition;
    var location = new Location();
    _currentPosition = await location.getLocation();
    setState(() {
      _latitude = _currentPosition.latitude;
      _longitude = _currentPosition.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildMap(),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }
  
  // マップ構築メソッド
  Widget _buildMap() {
    if (_latitude == null || _longitude == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return GoogleMap(
        onMapCreated: _onMapCreated,
	      initialCameraPosition: CameraPosition(
	        target: LatLng(_latitude, _longitude),
	        zoom: 15,
	      ),
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
      );
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
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

  // 現在地に遷移するメソッド
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
}